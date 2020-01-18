rm(list = ls())
# 1). load library
library(naivebayes)

# 2). load data
data_set <- read.csv("Youtube02-KatyPerry.csv", stringsAsFactors = TRUE)
data_set <- as.data.frame(data_set)
# 3). convert target from integer to boolean
data_set$CLASS <- factor(data_set$CLASS, levels = c(0,1), labels = c("FALSE", "TRUE"))

# Re index and split data
set.seed(99)
id <- sample(nrow(data_set), .8*nrow(data_set))
train_set <- as.data.frame(data_set[id, ])
test_set <- as.data.frame(data_set[-id, ])

# train model
nb_model <- naive_bayes(CLASS ~ ., data = train_set)

#predict
nb_predic = predict(nb_model, test_set[, 1:4])

# data_set['predic_result'] <- nb_predic
print(table(nb_predic, test_set$CLASS))
plot(nb_predic)