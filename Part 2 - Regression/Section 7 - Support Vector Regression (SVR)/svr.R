setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 7 - Support Vector Regression (SVR)/')

# Polynomial Regression

dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

library(e1071)
regressor <- svm(formula = Salary ~ ., data = dataset, type = 'eps-regression')

y_pred = predict(regressor, data.frame(Level = 6.5))

library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)

ggplot() +
  geom_point(aes(x = dataset$Level, y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') + 
  ggtitle('SVM results') + 
  xlab('Level') + 
  ylab('Salary')


# Predictions


y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2))
