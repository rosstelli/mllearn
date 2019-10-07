setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression/')

dataset <- read.csv("Salary_Data.csv")
# x <- dataset[, 1:3]
# y <- dataset[, 4]

library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fit simple linear regression
regressor <- lm(formula = Salary ~ YearsExperience,
                data=training_set)

# Get the predicted values
y_pred <- predict(regressor, newdata=test_set)

# plot the data
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$YearsExperience, y=training_set$Salary),
             color='red') + 
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            color='blue') + 
  ggtitle('Salary vs experience - Training set') + 
  xlab('Years of experience') + 
  ylab('Salary')

ggplot() +
  geom_point(aes(x=test_set$YearsExperience, y=test_set$Salary),
             color='red') + 
  geom_line(aes(x=training_set$YearsExperience, y=predict(regressor, newdata=training_set)),
            color='blue') + 
  ggtitle('Salary vs experience - Test set') + 
  xlab('Years of experience') + 
  ylab('Salary')
