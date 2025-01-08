


################
# Im folgenden Abschnitt wird das User Interface (UI) definiert
ui <- fluidPage(

  # Titel der App
  titlePanel("Mushroom"),

  # Layout für die Eingaben in die App und die Ausgaben
  sidebarLayout(

    # Die Definition der Eingabefelder auf der linken Seite
    sidebarPanel(
    
      # Eine Überschrift mit Linie darunter
      h4("Pilz Merkmale auswählen:",align="left"),
      hr(style="height: 1px; background: black"),

      selectInput(inputId="cap_shape", label="Cap Shape:", 
                  choices = c("Bell" = "b", "Conical" = "c", "Convex" = "x", 
                              "Flat" = "f", "Knobbed" = "k", "Sunken" = "s"), selected = "b"
      ),
      selectInput(inputId="cap_surface", label="Cap Surface:", 
                  choices = c("Fibrous" = "f", "Grooves" = "g", "Scaly" = "y", 
                              "Smooth" = "s"), selected = "g"
      ),
      selectInput(inputId="cap_color", label="Cap Color:", 
                  choices = c("Brown" = "n", "Buff" = "b", "Cinnamon" = "c", 
                              "Gray" = "g", "Green" = "r", "Pink" = "p", 
                              "Purple" = "u", "Red" = "e", "White" = "w", 
                              "Yellow" = "y"), selected = "n"
      ),
      
      checkboxInput(inputId="bruises", label="bruises?", value = FALSE),
      
    
    ),

    # der Hauptbereich der Nutzeroberfläche für die Ausgabe der Ergebnisse
    mainPanel(

      # Ausgabe des Histogramms
      plotOutput(outputId = "Verteilung"),
      
      # Ausgabe der Prognose
      textOutput("Prognose"),

    )
  )
)

############


server <- function(input, output) {

  # Innerhalb dieser Funktion werden die Bilder für die Ausgabe
  # erzeugt und die Ergebnisse berechnet
  
  # Folgende Funktion berechnet die Prognose für die eingegeben Werte  
  prognose <- reactive({

    # Speichere die Daten der Einflussvariablen in ein Objekt X
    X <- Daten[,c("edible","cap-shape","cap-surface","cap-color")]
    
    # Ersetze die erste Zeile in X nun mit den neuen, eingegebenen Werten
      
    # zunächst die Werte für flaeche und bjahr 
    X[1,"edible"] <- input$flaeche 
    X[1,"cap-shape"] <- input$bjahr
    # der angegebene Wert für lage muss zusätzlich noch in factor umgewandelt werden
    X[1,"cap-surface"] <- as.factor(input$lage)
    
    # die Eingaben TRUE/FALSE für die Ausstattungsmerkmale kueche, bad und zh
    # werden jeweils in 0/1-Variablen umgewandelt (mit ifelse) und in
    # den Datentyp factor umgewandelt (mit as.factor);
    # die Werte werden in die erste Zeile von X eingetragen
    #X[1,"kueche"] <- as.factor(ifelse(input$luxuskueche == FALSE, 0, 1))
    #X[1,"bad"] <- as.factor(ifelse(input$luxusbad == FALSE, 0, 1))
    #X[1,"zh"] <- as.factor(ifelse(input$zentralheizung == FALSE, 0, 1))
    
    # Berechne die Prognosen für X
    # die Prognose der neuen, eingegebenen Werte stehen im ersten Eintrag des Prognosevektors
    prognosevektor <- predict(model,X)
    prog <- prognosevektor[1]
    
    # der Prognosewert wird noch auf 2 Stellen hinter dem Komma (digits=2) gerundet.
    prog <- round(prog,digits=2)
    
    # der errechnete Wert soll als Ergebnis der Funktion zurückgegeben werden
    prog
  })         
    
  # diese Funktion erzeugt das Histogramm und speichert es als Ausgabebild 
  # mit dem Namen output$Verteilung
  output$Verteilung <- renderPlot({

    # die errechnete Prognose aus der oben geschriebenen Funktion prognose()
    prog <- prognose()
    
    # Speichere die Daten der Einflussvariablen in ein Objekt X
    # und die Daten der Zielvariable in y.
    # Berechne dann die Abweichungen zwischen den Prognosen und den realen Werten
    X <- Daten[,c("cap-shape","cap-surface","cap-color")]
    y <- Daten[,"edible"]
    abweichungen <- y-predict(model,X)
    
    # Zeichne jetzt im Histogram die Prognose mit den Abweichungen;
    # dies visualisiert die bandbreite der Mieten für diese Wohnung 
    hist(prog+abweichungen, col = "blue", main = "Verteilung der Quadratmetermieten",xlim=c(0,15))

  })
  
  # Definition einer Textausgabe mit dem namen output$Prognose 
  # In dieser Textausgabe soll der in der Funktion prognose() 
  # errechnete Prognosewert ausgegeben werden
  output$Prognose <- renderText({
  
    # der Wert der Prognose aus der Funktion prognose()
    prog <- prognose()
  
    # die Ausgabe ist eine Kombination (mit dem Befehl 'paste') von Text
    # und des errechneten Prognosewerts prog 
    Ausgabe <- paste("Durchschnittliche Miete: ", prog," Euro")
  })

}



# Aufruf der App-Funktionen
###############

shinyApp(ui = ui, server = server)

###############






