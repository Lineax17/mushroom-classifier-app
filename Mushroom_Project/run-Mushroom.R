
# Setzen des Pfades und Einlesen der Daten

setwd("C:/Users/o_Tra/OneDrive/Studium/Assistenzsysteme/Mushroom_Project/Mushroom_Project/")

Daten <- read.csv("agaricus-lepiota.csv",header=TRUE,sep=";",fill=TRUE,stringsAsFactors=TRUE)

#colnames(Daten)
Daten[] <- lapply(Daten, as.factor)
#Daten[,"edible"] <- as.factor(Daten[,"edible"])
#Daten[,"cap_shape"] <- as.factor(Daten[,"cap_shape"])
#Daten[,"cap_surface"] <- as.factor(Daten[,"cap_surface"])
#Daten[,"cap_color"] <- as.factor(Daten[,"cap_color"])


# Berechnung der linearen Regression

#model <- lm( edible ~ cap_shape + cap_surface + cap_color, data=Daten)


# Starten der Shiny-App

library(shiny)
library(ggplot2)

runApp("App-Mushroom")

