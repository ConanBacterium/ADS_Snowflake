use database beetle_db; 
describe table YELP_REVIEW_TESTING; 
describe table YELP_REVIEW_TRAINING;


CREATE OR REPLACE FUNCTION naive_bayes_train_flat(text string, label int)
RETURNS TABLE(word string, prob0 float, prob1 float, prob2 float, prob3 float, prob4 float, prior0 float, prior1 float, prior2 float, prior3 float, prior4 float)
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
        self.labels = [0, 1, 2, 3, 4]
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
        priors = {}
        for label in self.labels: 
            priors[label] = self.class_counts[label] / total_docs

        return priors
    
    def get_word_probabilities(self):
        probabilities = {}
        total_vocab = len(self.vocab)

        total_words_per_label = []
        for label in self.labels:
            total_words_per_label.append(sum(self.word_counts[label].values()))

            
        for word in self.vocab:
            word_probs = []
            for label, total_words in zip(self.labels, total_words_per_label):
                count = self.word_counts[label].get(word, 0)
                prob = (count + 1) / (total_words + total_vocab)
                word_probs.append(prob)
                
            probabilities[word] = word_probs
        
        return probabilities

    def end_partition(self):
        probabilities = self.get_word_probabilities()
        priors = self.get_class_priors()
        sorted_priors = [priors[label] for label in self.labels]

        for word, word_probs in probabilities.items():
            yield word, *word_probs, *sorted_priors
$$;

CREATE OR REPLACE TABLE nb_flat AS
SELECT wc.word, wc.prob0, wc.prob1, wc.prob2, wc.prob3, wc.prob4, wc.prior0, wc.prior1, wc.prior2, wc.prior3, wc.prior4   
FROM train_exploded_reviews expl,
     -- TABLE(naive_bayes_train_flat(expl.word, expl.label) OVER (PARTITION BY word)) as wc;
     TABLE(naive_bayes_train_flat(expl.word, expl.label) OVER (PARTITION BY 1)) as wc;

select * from nb_flat limit 50; 
     
select *
from test_exploded_reviews r 
join nb_flat nb on r.word = nb.word
where r.review_id = 2001; 
