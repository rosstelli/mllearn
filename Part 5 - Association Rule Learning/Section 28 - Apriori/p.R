setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 5 - Association Rule Learning/Section 28 - Apriori/')

library(arules)
# dataset <- read.csv('Market_Basket_Optimisation_r.csv', header = FALSE)
# Create a sparse matrix
dataset <- read.transactions('Market_Basket_Optimisation_r.csv', sep = ",", rm.duplicates =TRUE)

summary(dataset)

itemFrequencyPlot(dataset, topN = 30)

# Training the model
# 3 (times a day) * 7 (days/week) / 7500 (total transactions) ~= 0.003
# Default value for confidence is 0.8
rules = apriori(data = dataset, parameter = list(support = 0.003, confidence = 0.2))

# Visualize rules
inspect(sort(rules, by = 'lift')[1:10])
