setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 6 - Polynomial Regression/')

# Polynomial Regression

dataset <- read.csv('Position_Salaries.csv')
dataset <- dataset[2:3]

lin_reg <- lm(formula = Salary ~ ., data = dataset)

dataset$Level2 <- dataset$Level ^ 2

poly_reg <- lm(formula = Salary ~ ., data = dataset)

library(ggplot2)
x_grid <- seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            colour = 'blue') + 
  ggtitle('Linear Regression results') + 
  xlab('Level') + 
  ylab('Salary')

ggplot() +
  geom_point(aes(x = dataset$Level, y=dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            colour = 'blue') + 
  ggtitle('Polynomial Regression results') + 
  xlab('Level') + 
  ylab('Salary')


# Predictions
y_pred = predict(lin_reg, data.frame(Level = 6.5))

y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2))
