#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jul 26 15:48:37 2018

@author: ross
"""

# pip install --upgrade --no-deps git+git://github.com/Theano/Theano.git
# pip install --upgrade keras
# Keras runs on Theano and tensor flow

# Pre-processing
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv('Churn_Modelling.csv')

x = dataset.iloc[:, [3, 13]].values
y = dataset.iloc[:, 13].values

from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.25, random_state=0)


from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
x_train = sc_X.fit_transform(x_train)
x_test = sc_X.transform(x_test)
 
# All the above steps are clubbed together into one line 
#y_ss = StandardScaler()
#y = y_ss.fit_transform(np.array(y).reshape(len(y),1)).reshape(len(y))

## Put the classifier here



y_pred = classifier.predict(x_test)

# Confusion matrix 
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)