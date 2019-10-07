#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul 17 10:06:00 2018

@author: ross
"""

import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

dataset = pd.read_csv('Position_Salaries.csv')
x = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

"""from sklearn.model_selection import train_test_split
x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=0)"""


"""from sklearn.preprocessing import StandardScaler 
sc_X = StandardScaler()
x = sc_X.fit_transform(x)
#sc_Y = StandardScaler()
#z = sc_Y.fit_transform([y])[0]
y_ss = StandardScaler()
 
# All the above steps are clubbed together into one line 
y_ss = StandardScaler()
y = y_ss.fit_transform(np.array(y).reshape(len(y),1)).reshape(len(y))"""


from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state = 0) # random state is seed
regressor.fit(x, y)

y_pred = regressor.predict(6.5)

x_grid = np.arange(min(x), max(x), 0.01)
x_grid = x_grid.reshape((len(x_grid), 1))

# Note: Treats CEO as outlier
plt.scatter(x, y, color = 'red')
plt.plot(x_grid, regressor.predict(x_grid), color='blue')
plt.title('SVR')
plt.xlabel('Position level')
plt.ylabel('Salary')
plt.show()
