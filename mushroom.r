# Libraries
library(shiny)
library(ggplot2)
library(dplyr)
library(shinyWidgets)
library(lattice)
library(caret)
library(rpart)
library(rpart.plot)


# Read the data
data <- read.csv("./data/agaricus-lepiota.csv", header = TRUE, sep = ";", fill = TRUE, stringsAsFactors = TRUE)
data[] <- lapply(data, as.factor)

# Split into training and test data (80% training, 20% test)
train_index <- createDataPartition(data$edible, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Create decision tree
set.seed(467)
decision_tree <- rpart(edible ~ ., data = train_data, method = "class", control = rpart.control(cp = 0.0001, minsplit = 5))

# Save the decision tree as PDF
pdf("decision_tree.pdf", width = 8, height = 6)
rpart.plot(decision_tree, type = 4, extra = 104)
dev.off()

# Prediction on test data
predictions <- predict(decision_tree, test_data, type = "class")

# Create and display confusion matrix (console)
confusion_matrix <- confusionMatrix(predictions, test_data$edible)
print(confusion_matrix)

# Start the Shiny app
options(shiny.port = 8100)
runApp("app")