setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 3 - Classification/Section 14 - Logistic Regression/')

dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

set.seed(123)

library(caTools)

split <- sample.split(dataset$Purchased, SplitRatio =0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

classifier <- glm(formula = Purchased ~ .,
                  family = binomial,
                  data = training_set)

prob_pred <- predict(classifier, type = 'response', newdata = test_set[-3])

# Hyperparameter = 0.5
y_pred <- ifelse(prob_pred > 0.5, 1, 0)

# Confusion Matrix
cm <- table(test_set[ , 3], y_pred)

# Visualization

# Visualising the training set results
set <- training_set
library(ElemStatLearn)
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set <- predict(classifier, type='response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3], main = 'Classifier (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the test set results
set <- test_set
library(ElemStatLearn)
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set <- predict(classifier, type='response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3], main = 'Classifier (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))








