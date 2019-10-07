#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 23 14:34:12 2018

@author: ross
"""


# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# start with round 0 - 9 selecting 0 - 9

# Implementing UCB
N = 10000
d = 10
ads_selected = []
numbers_of_selections = [ 0 ] * d 
sums_of_rewards = [ 0 ] * d
total_reward = 0

for n in range(0, N): # at a specific round
    max_upper_bound = 0
    ad = 0 # index
    for i in range(0, d):
        if (numbers_of_selections[i] > 0):
            average_reward = sums_of_rewards[i] / numbers_of_selections[i]
            delta_i = math.sqrt(3/2 * math.log(n + 1) / numbers_of_selections[i]) # upperbound from average
            upper_bound = average_reward + delta_i
        else:
            upper_bound = 1e400
        if upper_bound >  max_upper_bound:
            # Become new max upperbound
            max_upper_bound = upper_bound
            ad = i
    # Append the ad selected
    ads_selected.append(ad)
    numbers_of_selections[ad] = numbers_of_selections[ad] + 1
    reward = dataset.values[n, ad]
    sums_of_rewards[ad] = sums_of_rewards[ad] + reward
    total_reward = total_reward + reward
    
    
# Visualization
plt.hist(ads_selected)
plt.title('Histogram of ads')