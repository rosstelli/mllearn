setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/')

dataset <- read.csv("Data.csv")
x <- dataset[, 1:3]
y <- dataset[, 4]

dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN=function(x) mean(x, na.rm=TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                        ave(dataset$Salary, FUN=function(x) mean(x, na.rm=TRUE)),
                        dataset$Salary)

# Encoding categorical data
# Use factors for categorical data
dataset$Country = factor(dataset$Country, levels=c('France', 'Spain', 'Germany'),
                         labels=c(1,2,3))

dataset$Purchased = factor(dataset$Purchased, levels=c('No', 'Yes'),
                         labels=c(1,2))
# Split the training set and the test set 
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Scale 
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])












