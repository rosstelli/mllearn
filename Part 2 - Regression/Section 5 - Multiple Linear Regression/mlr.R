setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 5 - Multiple Linear Regression/')

dataset <- read.csv("50_Startups.csv")
# x <- dataset[, 1:3]
# y <- dataset[, 4]

dataset$State <- factor(dataset$State,
                        levels = c('New York', 'California', 'Florida'),
                        labels = c(1, 2, 3))


library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# No need for feature scaling

regressor <- lm(formula = Profit ~ ., data=training_set)
summary(regressor)

y_pred <- predict(regressor, newdata=test_set)

# Backward elimination
training_set2 <- training_set
training_set2$State <- NULL

regressor <- lm(formula = Profit ~ ., data=training_set2)
summary(regressor)
