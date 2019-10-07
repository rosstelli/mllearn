setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 4 - Clustering/Section 24 - K-Means Clustering/')

dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5]

# Elbow method
set.seed(6)

wcss <- vector()
for (i in 1:10) {
  wcss[i] <- sum(kmeans(x, i)$withinss)
}

plot(1:10, wcss, type = "b", main = paste('Clusters of clients'), xlab = "num of clusters", ylab = "WCSS")

#Select best K
set.seed(29)
kmeans <- kmeans(x, 5, iter.max = 300, nstart = 10)

# Visualizing clusters
library(cluster)
clusplot(x, kmeans$cluster, lines = 0, shade = TRUE, color = TRUE, labels = 2, plotchar = FALSE, span = TRUE, main = 'clusters of clients', 
         xlab = 'Annual income', ylab = 'Spending score')