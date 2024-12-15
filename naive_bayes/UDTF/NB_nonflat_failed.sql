use database beetle_db; 
describe table YELP_REVIEW_TESTING; 
describe table YELP_REVIEW_TRAINING;


CREATE OR REPLACE FUNCTION naive_bayes_train_nonflat(text string, label int)
RETURNS TABLE(label int, word string, prob float, prior float)
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'NaiveBayesClassifier'
AS 
$$
from collections import defaultdict
import re

class NaiveBayesClassifier:
    def __init__(self):
        self.class_counts = defaultdict(int)
        self.word_counts = defaultdict(lambda: defaultdict(int))
        self.vocab = set()
        
    def preprocess(self, text):
        text = text.lower()
        words = re.findall(r'\w+', text)
        return words
    
    def process(self, text, label):
        words = self.preprocess(text)
        self.class_counts[label] += 1
        
        for word in words:
            self.word_counts[label][word] += 1
            self.vocab.add(word)

    def get_class_priors(self):
        total_docs = sum(self.class_counts.values())
        return {label: count/total_docs for label, count in self.class_counts.items()}
    
    def get_word_probabilities(self):
        probabilities = {}
        total_vocab = len(self.vocab)
        
        for label in self.class_counts:
            total_words = sum(self.word_counts[label].values())
            word_probs = {}
            
            for word in self.vocab:
                count = self.word_counts[label].get(word, 0)
                prob = (count + 1) / (total_words + total_vocab)
                word_probs[word] = prob
            
            probabilities[label] = word_probs
        
        return probabilities

    def end_partition(self):
        probabilities = self.get_word_probabilities()
        priors = self.get_class_priors()
        
        for label, word_probs in probabilities.items():
            labelprior = priors[label]
            for word, prob in word_probs.items():
                yield (label, word, float(prob), labelprior)
$$;

CREATE OR REPLACE TABLE nb_nonflat AS
SELECT wc.label, wc.word, wc.prob, wc.prior
FROM train_exploded_reviews expl,
     TABLE(naive_bayes_train_nonflat(expl.word, expl.label) OVER (PARTITION BY word)) as wc;


select * from nb_nonflat limit 50; 

select label, prior, product()
from test_exploded_reviews r 
join nb_nonflat nb on r.word = nb.word
where r.review_id = 2001
group by label, prior
; 