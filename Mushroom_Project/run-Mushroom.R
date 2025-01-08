
# Setzen des Pfades und Einlesen der Daten

setwd("C:/Users/o_Tra/OneDrive/Studium/Assistenzsysteme/mushroom/Mushroom_Project/")

Daten <- read.csv("agaricus-lepiota.csv",header=TRUE,sep=";",fill=TRUE,stringsAsFactors=TRUE)

Daten[,"edible"] <- as.factor(Daten[,"edible"])
Daten[,"cap-shape"] <- as.factor(Daten[,"cap-shape"])
Daten[,"cap-surface"] <- as.factor(Daten[,"cap-surface"])
Daten[,"cap-color"] <- as.factor(Daten[,"cap-color"])

# Berechnung der linearen Regression

model <- lm( edible ~ cap-shape + cap-surface + cap-color, data=Daten)


# Starten der Shiny-App

library(shiny)

runApp("App-Mushroom")

