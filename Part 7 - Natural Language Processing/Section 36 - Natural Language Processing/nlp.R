# NLP
setwd('/Users/ross/Documents/udemy/Machine Learning A-Z Template Folder/Part 7 - Natural Language Processing/Section 36 - Natural Language Processing/')

dataset_original <- read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

#install.packages('tm')
library(tm)
library(SnowballC)

# as.character(corpus[[1]])

corpus <- VCorpus(VectorSource(dataset_original$Review))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords())
corpus <- tm_map(corpus, stemDocument)
corpus <- tm_map(corpus, stripWhitespace)

# BAgs of words 
dtm <- DocumentTermMatrix(corpus)
dtm <- removeSparseTerms(dtm, 0.999)

dataset <- as.data.frame(as.matrix(dtm))
dataset$Liked <- dataset_original$Liked

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Random Forest Classification
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting classifier to the Training set
# Create your classifier here
library(randomForest)
classifier <- randomForest(x = training_set[-692],
                           y = training_set$Liked,
                           ntree = 10)


# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)
