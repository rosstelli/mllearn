#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 23 17:18:29 2018

@author: ross
"""


# Importing the libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import math
import random

# Importing the dataset
dataset = pd.read_csv('Ads_CTR_Optimisation.csv')

# Implementing Thompson Sampling
N = 10000
d = 10
ads_selected = []
numbers_of_rewards_1 = [ 0 ] * d
numbers_of_rewards_0 = [ 0 ] * d
total_reward = 0

for n in range(0, N): # at a specific round
    max_random = 0 # take maximum random draw
    ad = 0 # index
    for i in range(0, d):
        random_beta = random.betavariate(numbers_of_rewards_1[i] + 1,
                                         numbers_of_rewards_0[i] + 1)
        if random_beta >  max_random:
            # Become new max upperbound
            max_random = random_beta
            ad = i
    # Append the ad selected
    ads_selected.append(ad)
    reward = dataset.values[n, ad]
    if reward == 1:
        numbers_of_rewards_1[ad] = numbers_of_rewards_1[ad] + 1
    else:
        numbers_of_rewards_0[ad] = numbers_of_rewards_0[ad] + 1
    total_reward = total_reward + reward
    
    
# Visualization
plt.hist(ads_selected)
plt.title('Histogram of ads')
plt.show()