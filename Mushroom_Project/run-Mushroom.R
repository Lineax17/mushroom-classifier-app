
# Setzen des Pfades und Einlesen der Daten

#setwd("C:/Users/o_Tra/OneDrive/Studium/Assistenzsysteme/Mushroom_Project/Mushroom_Project/")

Daten <- read.csv("./agaricus-lepiota.csv",header=TRUE,sep=";",fill=TRUE,stringsAsFactors=TRUE)

#colnames(Daten)
Daten[] <- lapply(Daten, as.factor)



# Berechnung der linearen Regression

#model <- lm( edible ~ cap_shape + cap_surface + cap_color, data=Daten)
di

# Starten der Shiny-App

library(shiny)
library(ggplot2)
library(dplyr)

options(shiny.port = 8100)
runApp("App-Mushroom")

