# Statistics

## Table of Contents

[Starting with sklearn](#template)

[Linear Regression](#linear_regression)

[Polynomial Regression](#poly_regression)

[Support Vector Regression](#sv_regression)

[Decision Tree Regression](#decision_tree_regression)

[Random Forest Regression](#random_forest_regression)


<div id="template"></div>

## Regression

### Starting

##### Importing the generic packages

```py
import numpy as np
import pandas as pd
# import matplotlib.pyplot as plt # optional for plotting
```

##### Reading in a csv file

```py
dataset = pd.read_csv('FILE.csv')
# use iloc to access the data
# Example (indexing starts at 0)
x = dataset.iloc[:, :-1].values
y = dataset.iloc[:, 1].values
```

##### Splitting the dataset into testing/training sets

```py
# x and y are loaded previously
from sklearn.model_selection import train_test_split

test_percentage = 0.2 # 20% is typical

x_train, x_test, y_train, y_test = train_test_split(x, y, test_size=test_percentage, random_state=0)
```

##### Scaling the data/Normalization

Only perform the following depending on the algorithm

```py
from sklearn.preprocessing import StandardScaler

sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

sc_y = StandardScaler()
y_train = sc_y.fit_transform(y_train)
```

One hot encoding for labeled data

```py
from sklearn.preprocessing import LabelEncoder, OneHotEncoder
labelencoder_x = LabelEncoder()
x[:, 3] = labelencoder_x.fit_transform(x[:, 3])
onehotencoder = OneHotEncoder(categorical_features = [3])
x = onehotencoder.fit_transform(x).toarray()
```

<div id="linear_regression"></div>

### Linear/Multiple Linear Regression

Import the necessary package

```py
from sklearn.linear_model import LinearRegression
```

Fit the data and predict

```py
regressor = LinearRegression()
regressor.fit(x_train, y_train)

# Predict the values on the model built
y_pred = regressor.predict(x_test)
```

<div id="poly_regression"></div>

### Polynomial Regression

##### Transform the data to then perform linear regression

```py
from sklearn.preprocessing import PolynomialFeatures

poly_reg = PolynomialFeatures(degree = 4)
x_poly = poly_reg.fit_transform(x)

# Transform the data to then do a linear regression
lin_reg = LinearRegression()
lin_reg.fit(x_poly, y)
```

Then, to map a bunch of `y` values (TODO: UPDATE THIS)

```py
x_grid = np.arange(min(x), max(x), 0.1)
x_grid = x_grid.reshape((len(x_grid), 1))
y_grid = lin_reg.predict(poly_reg.fit_transform(x_grid))
```

<div id="sv_regression"></div>

### Support Vector Regression

- No training/testing set
- Scaling is highly recommended, and used in this example

Scale the x and y values

```py
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
x = sc_X.fit_transform(x)

y_ss = StandardScaler()
y = y_ss.fit_transform(np.array(y).reshape(len(y),1)).reshape(len(y))
```

Fit the regression

```py
from sklearn.svm import SVR
regressor = SVR(kernel = 'rbf')
regressor.fit(x, y)
```

Get the prediction

```py
# Grab y, where x = 6.5 (i think)
y_pred = regressor.predict(sc_X.transform(np.array( [ [6.5] ] ) ) )
y_pred = y_ss.inverse_transform(y_pred)
```

<div id="decision_tree_regression"></div>

### Decision Tree Regression

- No training/testing set

Fit the regression

```py
from sklearn.tree import DecisionTreeRegressor
regressor = DecisionTreeRegressor(random_state = 0) # random state is seed
regressor.fit(x, y)
```

Get the prediction

```py
# Grab y, where x = 6.5 (i think)
y_pred = regressor.predict(6.5)
```

<div id="random_forest_regression"></div>

### Random Forest Regression

- No training/testing set

```py
from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 100, random_state = 0) # random state is seed
regressor.fit(x, y)
```

Get the prediction
```py
y_pred = regressor.predict(6.5)
```

<div id="logistic_regression"></div>

## Classification

### Logistic Regression

- split into training and testing sets

Create the model

```py
from sklearn.linear_model import LogisticRegression
classifier = LogisticRegression(random_state = 0)
classifier.fit(x_train, y_train)
```

Predict

```py
y_pred = classifier.predict(x_test)
```

Optional: calculate the confusion matrix

```py
# Confusion matrix
from sklearn.metrics import confusion_matrix
cm = confusion_matrix(y_test, y_pred)
```
