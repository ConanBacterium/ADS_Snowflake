-- use database zebra_db; 
-- show schemas in database zebra_db; 

-- create database beetle_db; 

use database beetle_db; 
describe table YELP_REVIEW_TESTING; 
describe table YELP_REVIEW_TRAINING;



---------------------------------
-- DATA CLEANING AND EXPLOSION --
---------------------------------

CREATE OR REPLACE TABLE train_transformed_yelp_reviews (
    id INTEGER AUTOINCREMENT START = 1,
    label INTEGER,
    text STRING,
    primary key(id)
);

INSERT INTO train_transformed_yelp_reviews (label, text)
SELECT 
    CAST(data:label AS INTEGER) as label,
    REGEXP_REPLACE(                           -- Step 4: Remove extra spaces
        REGEXP_REPLACE(                       -- Step 3: Add space between letter-number transitions
            REGEXP_REPLACE(                   -- Step 2: Convert any non-alphanumeric to space
                LOWER(                        -- Step 1: Convert to lowercase first
                    TRIM(CAST(data:text AS STRING))
                ),
                '([a-z])([0-9])|([0-9])([a-z])',
                '\1\3 \2\4'
            ),
            '[^a-z0-9 ]',
            ' '
        ),
        ' +',
        ' '
    ) as cleaned_text
FROM yelp_review_training;


CREATE OR REPLACE TABLE train_exploded_reviews (
    review_id INTEGER REFERENCES train_transformed_yelp_reviews(id),
    word STRING,
    label INTEGER
);

INSERT INTO train_exploded_reviews (
    SELECT 
        id as review_id,
        value AS word,
        label
    FROM
        train_transformed_yelp_reviews,
        LATERAL FLATTEN(input => SPLIT(text, ' ')) f
    WHERE value <> ''
); 

CREATE OR REPLACE TABLE test_transformed_yelp_reviews (
    id INTEGER AUTOINCREMENT START = 1,
    label INTEGER,
    text STRING,
    primary key(id)
);

INSERT INTO test_transformed_yelp_reviews (label, text)
SELECT 
    CAST(data:label AS INTEGER) as label,
    REGEXP_REPLACE(                           -- Step 4: Remove extra spaces
        REGEXP_REPLACE(                       -- Step 3: Add space between letter-number transitions
            REGEXP_REPLACE(                   -- Step 2: Convert any non-alphanumeric to space
                LOWER(                        -- Step 1: Convert to lowercase first
                    TRIM(CAST(data:text AS STRING))
                ),
                '([a-z])([0-9])|([0-9])([a-z])',
                '\1\3 \2\4'
            ),
            '[^a-z0-9 ]',
            ' '
        ),
        ' +',
        ' '
    ) as cleaned_text
FROM yelp_review_testing;


CREATE OR REPLACE TABLE test_exploded_reviews (
    review_id INTEGER REFERENCES test_transformed_yelp_reviews(id),
    word STRING,
    label INTEGER
);

INSERT INTO test_exploded_reviews (
    SELECT 
        id as review_id,
        value AS word,
        label
    FROM
        test_transformed_yelp_reviews,
        LATERAL FLATTEN(input => SPLIT(text, ' ')) f
    WHERE value <> ''
); 



----------------------------------------
-- CALCULATING PRIORS AND LIKELIHOODS --
----------------------------------------


SELECT 'PURE SQL PRIORS AND LIKELIHOODS START';


CREATE OR REPLACE TABLE priors (
    label INTEGER, 
    prior FLOAT
);

INSERT INTO priors (
    WITH 
    label_counts AS (
        SELECT label, COUNT(id) as count
        FROM train_transformed_yelp_reviews
        GROUP BY label
    ),
    total AS (
        SELECT COUNT(*) as total 
        FROM train_transformed_yelp_reviews
    )
    SELECT 
        label_counts.label, 
        label_counts.count::FLOAT / total.total as prior
    FROM label_counts, total
);

select * from priors;



CREATE OR REPLACE VIEW word_freq_pr_class AS (
    with word_label_cross as (
        select w.word, l.label 
        from (select distinct word from train_exploded_reviews) w
        cross join (select distinct label from train_exploded_reviews) l
    )
    select wlc.word, wlc.label, coalesce(count(expl.word), 0) as count
    from word_label_cross wlc 
    left join train_exploded_reviews expl 
        on wlc.word = expl.word and wlc.label = expl.label 
    group by wlc.word, wlc.label
);

select * from word_freq_pr_class; -- sanity test 


CREATE OR REPLACE TABLE likelihoods(
    word STRING,
    label INTEGER, 
    likelihood FLOAT
);

insert into likelihoods (
    with 
    vocabulary as (
        select count(distinct word) as size from train_exploded_reviews
    ),
    freq_pr_class as (
        select label, sum(count) as count 
        from word_freq_pr_class
        group by label
    )
    select  wfc.word, 
            wfc.label, 
            CAST((wfc.count + 1) as DOUBLE PRECISION) / CAST((fc.count + vocabulary.size) as double precision) as likelihood
    from word_freq_pr_class wfc
    join freq_pr_class fc 
        on wfc.label = fc.label
    join vocabulary
);


SELECT 'PURE SQL PRIORS AND LIKELIHOODS END';


---------------------------------------
---- TESTING ACCURACY ON TEST SET  ----
---------------------------------------

SELECT 'PURE SQL EVALUATION TEST SET START';

CREATE OR REPLACE TABLE review_predictions (
    review_id INTEGER,
    true_label INTEGER,
    predicted_label INTEGER,
    probability FLOAT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (review_id) REFERENCES test_transformed_yelp_reviews(id)
);

-- Then, insert the predictions
INSERT INTO review_predictions
WITH review_probabilities AS (
    SELECT 
        r.review_id,
        r.label,
        labels.label as predicted_label,
        SUM(LN(COALESCE(l.likelihood, 1e-10))) as log_likelihood,
        LN(p.prior) as log_prior
    FROM test_exploded_reviews r
    CROSS JOIN (SELECT DISTINCT label FROM priors) labels
    LEFT JOIN likelihoods l 
        ON r.word = l.word 
        AND labels.label = l.label
    JOIN priors p 
        ON labels.label = p.label
    GROUP BY 
        r.review_id,
        r.label,
        labels.label,
        p.prior
),
final_predictions AS (
    SELECT 
        review_id,
        label,
        predicted_label,
        log_likelihood + log_prior as log_probability,
        EXP(log_likelihood + log_prior) as probability
    FROM review_probabilities
),
best_predictions AS (
    SELECT 
        review_id,
        label as true_label,
        predicted_label,
        probability,
        ROW_NUMBER() OVER (PARTITION BY review_id ORDER BY probability DESC) as rn
    FROM final_predictions
)
SELECT 
    review_id,
    true_label,
    predicted_label,
    probability
FROM best_predictions
WHERE rn = 1
ORDER BY review_id;

SELECT 'PURE SQL EVALUATION TEST SET END';


-- select * from review_predictions; 
-- select count(*) from review_predictions where true_label = predicted_label; 
-- select count(*) from review_predictions; 


WITH confusion_counts AS (
    SELECT 
        true_label,
        predicted_label,
        COUNT(*) as count,
        COUNT(*) / SUM(COUNT(*)) OVER (PARTITION BY true_label) as percentage
    FROM review_predictions
    GROUP BY true_label, predicted_label
),
matrix_stats AS (
    SELECT 
        true_label,
        predicted_label,
        count,
        ROUND(percentage * 100, 2) as percentage,
        CONCAT(count, ' (', ROUND(percentage * 100, 2), '%)') as display_value
    FROM confusion_counts
)
SELECT 
    true_label as "Actual Label",
    predicted_label as "Predicted Label",
    count as "Count",
    percentage as "Percentage",
    display_value as "Display Value"
FROM matrix_stats
ORDER BY true_label, predicted_label;


