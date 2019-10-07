#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 23 11:45:57 2018

@author: ross
"""


# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Importing the dataset
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header = None)
#X = dataset.iloc[:, [3, 4]].values
transactions = []
for i in range(0, 7501):
    # brackets make it into a list
    transactions.append([str(dataset.values[i, j]) for j in range(0, 20)])
    
# Training the model
# pip install apyori
from apyori import apriori
rules = apriori(transactions, min_support = 0.003, min_confidence = 0.4, min_lift=3, min_length = 2)

# Visualizing the results
results = list(rules)