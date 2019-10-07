#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 24 10:28:41 2018

@author: ross
"""

# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# 'Review' 'Liked'
dataset = pd.read_csv('Restaurant_Reviews.tsv', delimiter = '\t', quoting = 3)

# Cleaning the text
import re
import nltk
nltk.download('stopwords') # Download the words that are 'irrelevant'
from nltk.corpus import stopwords
from nltk.stem.porter import PorterStemmer

corpus = []
for i in range(0, 1000):
    review = re.sub('[^a-zA-Z]', ' ', dataset['Review'][i])
    review = review.lower()
    review = review.split()
    
    ps = PorterStemmer() # Stemming - keep only the root of the word
    
    # Remove all words in stopwords list
    review = [ps.stem(word) for word in review if not word in stopwords.words('english')] # set(stopwords.words('english'))
    review = ' '.join(review)
    corpus.append(review)

# Generate a sparse matrix where each column is a unique word
# Creating Bag of Words model
from sklearn.feature_extraction.text import CountVectorizer
cv = CountVectorizer(max_features = 1500) # make only 1500 words
x = cv.fit_transform(corpus).toarray()
y = dataset.iloc[:, 1]

# Use classification model
# Naive Bayes and decision trees are commonly used

# Directly from Naive bayes
from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.20, random_state=0)


from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
x_train = sc_X.fit_transform(x_train)
x_test = sc_X.transform(x_test)

## Put the classifier here
from sklearn.naive_bayes import GaussianNB
classifier = GaussianNB()
classifier.fit(x_train, y_train)

y_pred = classifier.predict(x_test)

# Confusion matrix 
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
