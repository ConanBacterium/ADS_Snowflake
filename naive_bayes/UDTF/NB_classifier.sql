use database beetle_db; 
describe table YELP_REVIEW_TESTING; 
describe table YELP_REVIEW_TRAINING;

CREATE OR REPLACE FUNCTION nb_classifier(text string, label int)
RETURNS TABLE(
    word STRING, 
    label INT, 
    log_probability FLOAT, 
    log_prior FLOAT,
    vocab_size INT,
    word_total_count INT,
    word_label_count INT
)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'NaiveBayesHandler'
AS 
$$
from collections import defaultdict
import math
import re

class NaiveBayesClassifier:
    def __init__(self):
        self.class_counts = defaultdict(int)
        self.word_counts = defaultdict(lambda: defaultdict(int))
        self.vocab = set()
        
    def cleanString(self, text):
        if not isinstance(text, str):
            text = str(text)
        text = text.lower().strip()
        text = re.sub(r'([a-z])([0-9])|([0-9])([a-z])', r'\1\3 \2\4', text)
        text = re.sub(r'[^a-z0-9 ]', ' ', text)
        text = re.sub(r' +', ' ', text)
        return text
        
    def process(self, text, label):
        self.class_counts[label] += 1
        cleaned = self.cleanString(text)
        
        words = cleaned.split()
        for word in words:
            self.vocab.add(word)
            self.word_counts[word][label] += 1
    
    def getWordProbabilities(self):
        log_probabilities = defaultdict(lambda: defaultdict(float))
        
        class_totals = defaultdict(int)
        vocab_size = len(self.vocab)
        
        for word in self.vocab:
            for label in range(5):  
                class_totals[label] += self.word_counts[word][label]
        
        for word in self.vocab:
            for label in range(5):
                numerator = self.word_counts[word][label] + 1
                denominator = class_totals[label] + vocab_size
                log_probabilities[word][label] = math.log(numerator / denominator)
                
        return log_probabilities
    
    def getClassPriors(self):
        total_docs = sum(self.class_counts.values())
        log_priors = {}
        
        for label in range(5):  
            count = self.class_counts.get(label, 0)
            log_priors[label] = math.log((count + 1) / (total_docs + 5))  
            
        return log_priors

    def getTotalWordCount(self, word):
        return sum(self.word_counts[word].values())
    
    def endPartition(self):
        log_probabilities = self.getWordProbabilities()
        log_priors = self.getClassPriors()
        vocab_size = len(self.vocab)
        
        sorted_words = sorted(self.vocab)
        
        for word in sorted_words:
            total_word_count = self.getTotalWordCount(word)
            for label in range(5):
                log_probability = log_probabilities[word][label]
                log_prior = log_priors[label]
                word_label_count = self.word_counts[word][label]
                yield (word, label, log_probability, log_prior, 
                      vocab_size, total_word_count, word_label_count)

class NaiveBayesHandler:
    def __init__(self):
        self._classifier = NaiveBayesClassifier()
        
    def process(self, text, label):
        """Handler for processing each row"""
        self._classifier.process(text, label)
        return []
        
    def end_partition(self):
        """Handler for end of partition"""
        return list(self._classifier.endPartition())
$$;

CREATE OR REPLACE TABLE nb_likelihoods_counts_priors AS (
    SELECT 
        nb.word,
        nb.label,
        nb.log_probability,
        nb.log_prior,
        nb.vocab_size,       
        nb.word_total_count,  
        nb.word_label_count   
    FROM 
        YELP_REVIEW_TRAINING yrt,
        TABLE(
            nb_classifier(
                CAST(yrt.data:text AS STRING),
                CAST(yrt.data:label AS INTEGER)
            ) OVER (PARTITION BY 1)
        ) AS nb
); 

select * from nb_likelihoods_counts_priors limit 50; 
select count(*) from nb_likelihoods_counts_priors;


--------------------------------------
-------- EVALUATE ON TEST SET --------
--------------------------------------

CREATE OR REPLACE TABLE review_predictions2 (
    review_id INTEGER,
    true_label INTEGER,
    predicted_label INTEGER,
    probability FLOAT,
    PRIMARY KEY (review_id),
    FOREIGN KEY (review_id) REFERENCES test_transformed_yelp_reviews(id)
);

INSERT INTO review_predictions2
WITH word_scores AS (
    SELECT 
        ter.review_id,
        ter.label as true_label,
        nb.label as predicted_label,
        SUM(nb.log_probability) + nb.log_prior as score
    FROM test_exploded_reviews ter
    JOIN nb_likelihoods_counts_priors nb ON ter.word = nb.word 
    GROUP BY ter.review_id, ter.label, nb.label, nb.log_prior
),
ranked_predictions AS (
    SELECT 
        review_id,
        true_label,
        predicted_label,
        score as probability,
        ROW_NUMBER() OVER (PARTITION BY review_id ORDER BY score DESC) as rank
    FROM word_scores
)
SELECT 
    review_id,
    true_label,
    predicted_label,
    probability
FROM ranked_predictions
WHERE rank = 1;