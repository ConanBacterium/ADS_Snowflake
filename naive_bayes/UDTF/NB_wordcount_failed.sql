use database beetle_db; 
describe table YELP_REVIEW_TESTING; 
describe table YELP_REVIEW_TRAINING;

CREATE OR REPLACE FUNCTION count_words(text string, label int)
RETURNS TABLE(word string, label_0_count int, label_1_count int, label_2_count int, label_3_count int, label_4_count int, total int )
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'WordCounter'
AS 
$$
from collections import defaultdict

class WordCounter:
    def __init__(self):
        self.word = ""
        self.total = 0
        self.labelcounts = defaultdict(int) 
    
    def process(self, word, label):
        self.word = word
        self.total += 1
        self.labelcounts[label] += 1
    
    def end_partition(self):
        yield (self.word, self.labelcounts[0],self.labelcounts[1],self.labelcounts[2], self.labelcounts[3], self.labelcounts[4], self.total)
$$;

CREATE OR REPLACE TABLE word_counts AS
(
    select wc.word, wc.label_0_count, wc.label_1_count, wc.label_2_count, wc.label_3_count, wc.label_4_count, wc.total 
    from train_exploded_reviews expl,  table(count_words(expl.word, expl.label) over (partition by word)) as wc
);
select * from word_counts;

CREATE OR REPLACE TABLE class_totals AS (
    SELECT 0 as label, sum(label_0_count) as total FROM word_counts
    UNION ALL
    SELECT 1 as label, sum(label_1_count) as total FROM word_counts
    UNION ALL
    SELECT 2 as label, sum(label_2_count) as total FROM word_counts
    UNION ALL
    SELECT 3 as label, sum(label_3_count) as total FROM word_counts
    UNION ALL
    SELECT 4 as label, sum(label_4_count) as total FROM word_counts
);

CREATE OR REPLACE TABLE class_priors AS (
    WITH total_docs AS (
        SELECT 
            SUM(total) as total
        FROM class_totals
    )
    SELECT 
        ct.label,
        ct.total::float / td.total as prior
    FROM class_totals ct, total_docs td
);

CREATE OR REPLACE TABLE word_likelihoods AS (
    WITH vocabulary_size AS (
        SELECT COUNT(DISTINCT word) as vocab_size 
        FROM word_counts
    ),
    unpivoted_counts AS (
        SELECT word, 0 as label, label_0_count as count FROM word_counts
        UNION ALL
        SELECT word, 1 as label, label_1_count as count FROM word_counts
        UNION ALL
        SELECT word, 2 as label, label_2_count as count FROM word_counts
        UNION ALL
        SELECT word, 3 as label, label_3_count as count FROM word_counts
        UNION ALL
        SELECT word, 4 as label, label_4_count as count FROM word_counts
    )
    SELECT 
        uc.word,
        uc.label,
        -- Apply Laplace smoothing: (count + 1) / (total_docs_in_class + vocabulary_size)
        (uc.count + 1)::float / (ct.total + vs.vocab_size) as likelihood
    FROM unpivoted_counts uc
    JOIN class_totals ct ON uc.label = ct.label
    CROSS JOIN vocabulary_size vs
);

select * from word_likelihoods; 



-- THIS THING WORKS FOR ONE DOCUMENT AT A TIME ! So we have to run it once for every test document, that seems quite terrible. Maybe we should made a UDF instead 
-- of a UDTF, and then take the json:text, clean it and run it through... ? 
CREATE OR REPLACE FUNCTION nb_probs(label int, likelihood float, prior float)
RETURNS TABLE(label int, logprob float)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'NB_Probabilities'
AS 
$$
class NB_Probabilities:
    def __init__(self):
        self.label = ""
        self.prior = 1
        self.log_likelihood_sum = 0
        
    def process(self, label, likelihood, prior):
        import math
        self.label = label
        self.prior = prior
        # Stay in log space
        self.log_likelihood_sum += math.log(likelihood)
    
    def end_partition(self):
        import math
        # Stay in log space for the final probability too
        log_prob = self.log_likelihood_sum + math.log(self.prior)
        yield self.label, log_prob
$$;

---- WORKS ! 
with X as (
    select wl.label as label, wl.likelihood as likelihood, cp.prior as prior
    from test_exploded_reviews expl 
    join word_likelihoods wl 
        on expl.word = wl.word
    join class_priors cp
        on cp.label = wl.label
    where expl.review_id = 2001
)
select wc.label, wc.logprob
from X,  table(nb_probs(X.label, X.likelihood, X.prior) over (partition by X.label)) as wc;

---- Need to get label with highest logprob 
WITH X AS (
    SELECT wl.label as label, wl.likelihood as likelihood, cp.prior as prior
    FROM test_exploded_reviews expl 
    JOIN word_likelihoods wl 
        ON expl.word = wl.word
    JOIN class_priors cp
        ON cp.label = wl.label
    WHERE expl.review_id = 2001
),
probabilities AS (
    SELECT 
        wc.label,
        wc.logprob
    FROM X, 
    TABLE(nb_probs(X.label, X.likelihood, X.prior) 
        OVER (PARTITION BY X.label)) as wc
),
ranked_probs AS (
    SELECT 
        label,
        logprob,
        RANK() OVER (ORDER BY logprob DESC) as rnk
    FROM probabilities
)
SELECT 
    label,
    logprob
FROM ranked_probs
WHERE rnk = 1;
