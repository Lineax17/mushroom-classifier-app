
cap_shape_choices <- c("Bell" = "b", "Conical" = "c", "Convex" = "x",
                       "Flat" = "f", "Knobbed" = "k", "Sunken" = "s")

cap_surface_choices <- c("Fibrous" = "f", "Grooves" = "g", "Scaly" = "y",
                         "Smooth" = "s")
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

      # cap-shape
      selectInput(inputId="cap_shape", label="Cap Shape:",
                  choices = cap_shape_choices, selected = "b"
      ),

      # cap-surface
      selectInput(inputId="cap_surface", label="Cap Surface:",
                  choices = cap_surface_choices , selected = "g"
      ),

      # cap_color
      selectInput(inputId="cap_color", label="Cap Color:",
                  choices = c("Brown" = "n", "Buff" = "b", "Cinnamon" = "c",
                              "Gray" = "g", "Green" = "r", "Pink" = "p",
                              "Purple" = "u", "Red" = "e", "White" = "w",
                              "Yellow" = "y"), selected = "n"
      ),

      # bruises
      checkboxInput(inputId="bruises", label="bruises?", value = FALSE),

      # odor
      selectInput(inputId="odor", label="Odor:",
                  choices = c("almond"="a","anise"="l","creosote"="c","fishy"="y","foul"="f",
                              "musty"="m","none"="n","pungent"="p","spicy"="s"), selected = "n"
      ),

      # gill-attachment
      selectInput(inputId="gill_attachment", label="Gill Attachment:",
                  choices = c("attached"="a","descending"="d","free"="f","notched"="n"), selected = "n"
      ),

      # gill-spacing
      selectInput(inputId="gill_spacing", label="Gill Spacing:",
                  choices = c("close"="c","crowded"="w","distant"="d"), selected = "c"
      ),

      # gill-size
      selectInput(inputId="gill_size", label="Gill Size:",
                  choices = c("broad"="b","narrow"="n"), selected = "n"
      ),

      # gill-color
      selectInput(inputId="gill_color", label="Gill Color:",
                  choices = c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                              "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                              "white"="w","yellow"="y"), selected = "n"
      ),

      # stalk-shape
      selectInput(inputId="stalk_shape", label="Stalk Shape:",
                  choices = c("enlarging"="e","tapering"="t"), selected = "e"
      ),

      # stalk-root
      selectInput(inputId="stalk_root", label="Stalk Root:",
                  choices = c("bulbous"="b","club"="c","cup"="u","equal"="e",
                              "rhizomorphs"="z","rooted"="r","missing"="?"), selected = "b"
      ),

      # stalk-surface-above-ring
      selectInput(inputId="stalk_surface_above_ring", label="Stalk Surface Above Ring:",
                  choices = c("fibrous"="f","scaly"="y","silky"="k","smooth"="s"), selected = "f"
      ),

      # stalk-surface-below-ring
      selectInput(inputId="stalk_surface_below_ring", label="Stalk Surface Below Ring:",
                  choices = c("fibrous"="f","scaly"="y","silky"="k","smooth"="s"), selected = "f"
      ),

      # stalk-color-above-ring
      selectInput(inputId="stalk_color_above_ring", label="Stalk Color Above Ring:",
                  choices = c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                              "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                              "white"="w","yellow"="y"), selected = "n"
      ),

      # stalk-color-below-ring
      selectInput(inputId="stalk_color_below_ring", label="Stalk Color Below Ring:",
                  choices = c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                              "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                              "white"="w","yellow"="y"), selected = "n"
      ),

      # veil-type
      selectInput(inputId="veil_type", label="Veil Type:",
                  choices = c("partial"="p","universal"="u"), selected = "p"
      ),

      # veil-color
      selectInput(inputId="veil_color", label="Veil Color:",
                  choices = c("brown"="n","orange"="o","white"="w","yellow"="y"), selected = "n"
      ),

      # ring-number
      selectInput(inputId="ring_number", label="Ring Number:",
                  choices = c("none"="n","one"="o","two"="t"), selected = "n"
      ),

      # ring-type
      selectInput(inputId="ring_type", label="Ring Type:",
                  choices = c("cobwebby"="c","evanescent"="e","flaring"="f","large"="l",
                              "none"="n","pendant"="p","sheathing"="s","zone"="z"), selected = "c"
      ),

      # spore-print-color
      selectInput(inputId="spore_print_color", label="Spore Print Color:",
                  choices = c("black"="k","brown"="n","buff"="b","chocolate"="h","green"="r",
                              "orange"="o","purple"="u","white"="w","yellow"="y"), selected = "n"
      ),

      # population
      selectInput(inputId="population", label="Population:",
                  choices = c("abundant"="a","clustered"="c","numerous"="n",
                              "scattered"="s","several"="v","solitary"="y"), selected = "n"
      ),

      # habitat
      selectInput(inputId="habitat", label="Habitat:",
                  choices = c("grasses"="g","leaves"="l","meadows"="m","paths"="p",
                              "urban"="u","waste"="w","woods"="d"), selected = "d"
      ),

    ),

    # der Hauptbereich der Nutzeroberfläche für die Ausgabe der Ergebnisse
    mainPanel(

      # Ausgabe des Histogramms
      plotOutput(outputId = "BarPlot"),
     # plotOutput(outputId = "BarPlot", height = 2 * 50)
      # Ausgabe der Prognose
      #textOutput("Prognose"),

    )
  )
)

############


server <- function(input, output) {

  #facet diagram (single Values)
  output$BarPlot <- renderPlot({

    cap_shape_data  <- Daten %>%
      filter(cap_shape == input$cap_shape) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Shape:", names(cap_shape_choices[cap_shape_choices == input$cap_shape]))
      )

    cap_surface_data <- Daten %>%
      filter(cap_surface == input$cap_surface) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Surface:", names(cap_surface_choices[cap_surface_choices == input$cap_surface]))
      )
    
    # Daten fürs Plotten. Für richtige Reihenfolge umdrehen, und dann die Kategorie as Faktor setzen
    plot_data <- bind_rows(cap_shape_data, cap_surface_data)
    plot_data <- plot_data[rev(seq_len(nrow(plot_data))), ]
    plot_data$category <- factor(plot_data$category, levels = plot_data$category)


    ggplot(plot_data, aes(x = category, y = poisonous_percent, fill = category)) +
      geom_bar(stat = "identity", width = 0.2) +
      coord_flip() +
      scale_x_discrete(expand = c(0, 0)) +
      scale_y_continuous(limits = c(0, 100), name = "Giftigkeitsprozentsatz") +  # Globale y-Achsenbeschriftung
      labs(
        title = "Giftigkeitsanalyse für Eigenschaften",
      ) +
      theme_minimal() +
      theme(
        axis.text.y = element_text(size = 10),      # Lesbare Kategorienamen
        plot.title = element_text(hjust = 0.5),    # Zentriere den Titel
        legend.position = "none"                   # Entferne die Legende
      )
  })
  
  # output$FacetPlot <- renderPlot({
  #   tryCatch({
  #     # Allow multiple selections
  #     selected_shapes <- input$selected_shapes 
  #     selected_colors <- input$selected_colors
  #     
  #     filtered_data <- Daten %>%
  #       filter(
  #         cap_shape %in% selected_shapes, 
  #         cap_color %in% selected_colors
  #       ) 
  #     
  #     if (nrow(filtered_data) == 0) {
  #       return(NULL)  # Return NULL if no data
  #     }
  #     
  #     # Calculate percentage of poisonous mushrooms
  #     poisonous_prop <- sum(filtered_data$edible == "p") / nrow(filtered_data) * 100
  #     
  #     ggplot(data.frame(poisonous_prop = poisonous_prop), aes(x = poisonous_prop)) +
  #       geom_bar(stat = "identity", fill = "red") +
  #       xlim(0, 100) + 
  #       labs(
  #         x = "Percentage Poisonous",
  #         y = "Frequency",
  #         title = paste("Edibility for Selected Criteria")
  #       ) +
  #       theme_minimal()
  #     
  #   }, error = function(e) {
  #     print(paste("Error encountered:", e))
  #     return(NULL)
  #   })
  # })

}



# Aufruf der App-Funktionen
###############

shinyApp(ui = ui, server = server)

###############






