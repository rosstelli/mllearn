setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 4 - Clustering/Section 25 - Hierarchical Clustering/')

dataset <- read.csv("Mall_Customers.csv")
x <- dataset[4:5]

dendrogram <-  hclust(dist(x, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean distance')

# Hierarchical clustering
num_clusters <- 5;
hc <- hclust(dist(x, method = 'euclidean'), method = 'ward.D')
y_hc <- cutree(hc, num_clusters)

clusplot(x, y_hc, lines = 0, shade = TRUE, color = TRUE, labels = 2, plotchar = FALSE, span = TRUE, main = 'clusters of clients (hierarchical)', 
         xlab = 'Annual income', ylab = 'Spending score')