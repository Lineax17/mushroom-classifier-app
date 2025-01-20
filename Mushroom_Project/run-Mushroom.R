# Librarys
library(shiny)
library(ggplot2)
library(dplyr)
library(shinyWidgets)
library(caret)  # Für einfache Datenaufteilung
library(rpart)
library(rpart.plot)  # Für die Visualisierung des Baums


# Einlesen der Daten
Daten <- read.csv("./agaricus-lepiota.csv",header=TRUE,sep=";",fill=TRUE,stringsAsFactors=TRUE)
Daten[] <- lapply(Daten, as.factor)

# Aufteilen in Trainings- und Testdaten (80% Training, 20% Test)
train_index <- createDataPartition(Daten$edible, p = 0.8, list = FALSE)
train_data <- Daten[train_index, ]
test_data <- Daten[-train_index, ]

# Entscheidungsbaum erstellen
set.seed(42)  # Reproduzierbarkeit sicherstellen
decision_tree <- rpart(edible ~ ., data = train_data, method = "class")
rpart.plot(decision_tree, type = 4, extra = 104)

# Vorhersage auf Testdaten
predictions <- predict(decision_tree, test_data, type = "class")

# Konfusionsmatrix erstellen
confusion_matrix <- confusionMatrix(predictions, test_data$edible)

# Ergebnisse anzeigen
print(confusion_matrix)

# Starten der Shiny-App
options(shiny.port = 8100)
runApp("App-Mushroom")

