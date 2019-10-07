setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 8 - Decision Tree Regression/')

# Polynomial Regression

dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

library(rpart)
regressor <- rpart(formula = Salary ~ ., data = dataset,
                   control = rpart.control(minsplit = 1))

y_pred = predict(regressor, data.frame(Level = 6.5))

library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.01)

ggplot() +
  geom_point(aes(x = dataset$Level, y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid,
                y = predict(regressor,
                            newdata = data.frame(Level = x_grid))),
            colour = 'blue') + 
  ggtitle('Decision Tree results') + 
  xlab('Level') + 
  ylab('Salary')


# Predictions


y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2))
