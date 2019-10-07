setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 9 - Random Forest Regression/')

dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

set.seed(123)

library(randomForest)
regressor <- randomForest(x = dataset[1], y = dataset$Salary,
                          ntree=10)

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
