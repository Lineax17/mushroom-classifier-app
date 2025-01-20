# Librarys
library(shiny)
library(ggplot2)
library(dplyr)
library(shinyWidgets)
library(lattice) #abhänginkeit für  caret
library(caret) # Für einfache dataaufteilung
library(rpart)
library(rpart.plot)  # Für die Visualisierung des Baums


# Einlesen der data
data <- read.csv("./agaricus-lepiota.csv",header=TRUE,sep=";",fill=TRUE,stringsAsFactors=TRUE)
data[] <- lapply(data, as.factor)

# Aufteilen in Trainings- und Testdata (80% Training, 20% Test)
train_index <- createDataPartition(data$edible, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Entscheidungsbaum erstellen
set.seed(42)  # Zufallszahlen immer vom selben standpunkt aus. (Reproduzierbarkeit sicherstellen)
decision_tree <- rpart(edible ~ ., data = train_data, method = "class", control = rpart.control(cp = 0.0001, minsplit = 5))

# Speichern des Desition Trees als PDF
pdf("decision_tree.pdf", width = 8, height = 6)
rpart.plot(decision_tree, type = 4, extra = 104)
dev.off()

# Vorhersage auf Testdata
predictions <- predict(decision_tree, test_data, type = "class")

# Konfusionsmatrix erstellen und anzeigen (Konsole)
confusion_matrix <- confusionMatrix(predictions, test_data$edible)
print(confusion_matrix)

# Starten der Shiny-App
options(shiny.port = 8100)
runApp("App-Mushroom")

