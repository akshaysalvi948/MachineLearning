import nltk
import string
from nltk.corpus import stopwords
from nltk.classify import NaiveBayesClassifier
from nltk.classify.util import accuracy


nltk.download('punkt')
nltk.download('averaged_perception_tagger')

def format_sentence(sent):
    sent = sent.lower()
    sent = sent.translate(string.punctuation)
    sentc = stopwords.words('english') + ["''"] + list(string.punctuation)
    retval = [i for i in nltk.word_tokenize(sent.lower()) if i not in sentc]
    return({word: True for word in retval})
# print(format_sentence("The cat is very Cute . There is spoon on a table"))

pos = []
with open("pos_tweets.txt",encoding='utf8') as f:
    for i in f:
        pos.append([format_sentence(i),'pos'])


neg = []
with open("neg_tweets.txt",encoding='utf8') as f:
     for i in f:
        neg.append([format_sentence(i),'neg']) 


training = pos[:int((.8)*len(pos))] + neg[:int((.8)*len(neg))]
test = pos[int((.8)*len(pos)):] + neg[int((.8)*len(neg)):]


classifier = NaiveBayesClassifier.train(training)

classifier.show_most_informative_features()
example = "CAts are awesome great  headache lost "

print(classifier.classify(format_sentence(example)))
print(accuracy(classifier,test))
