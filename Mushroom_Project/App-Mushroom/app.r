
cap_shape_choices <- c("Bell" = "b", "Conical" = "c", "Convex" = "x",
                       "Flat" = "f", "Knobbed" = "k", "Sunken" = "s")

cap_surface_choices <- c("Fibrous" = "f", "Grooves" = "g", "Scaly" = "y",
                         "Smooth" = "s")

cap_color_choices <- c("Brown" = "n", "Buff" = "b", "Cinnamon" = "c",
                       "Gray" = "g", "Green" = "r", "Pink" = "p",
                       "Purple" = "u", "Red" = "e", "White" = "w",
                       "Yellow" = "y")

bruises_choices <- c("Bruises" = "t", "No Bruises" = "f")

odor_choices <- c("almond"="a","anise"="l","creosote"="c","fishy"="y","foul"="f",
                  "musty"="m","none"="n","pungent"="p","spicy"="s")

gill_attachment_choices <- c("attached"="a","descending"="d","free"="f","notched"="n")

gill_spacing_choices <- c("close"="c","crowded"="w","distant"="d")

gill_size_choices <- c("broad"="b","narrow"="n")

gill_color_choices <- c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                        "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                        "white"="w","yellow"="y")

stalk_shape_choices <- c("enlarging"="e","tapering"="t")

# stalk_root_choices <- c("bulbous"="b","club"="c","cup"="u","equal"="e",
#                        "rhizomorphs"="z","rooted"="r","missing"="?")

stalk_surface_above_ring_choices <- c("fibrous"="f","scaly"="y","silky"="k","smooth"="s")

stalk_surface_below_ring_choices <- c("fibrous"="f","scaly"="y","silky"="k","smooth"="s")

stalk_color_above_ring_choices <- c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                                    "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                                    "white"="w","yellow"="y")

stalk_color_below_ring_choices <- c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g",
                                    "green"="r","orange"="o","pink"="p","purple"="u","red"="e",
                                    "white"="w","yellow"="y")

veil_type_choices <- c("partial"="p","universal"="u")

veil_color_choices <- c("brown"="n","orange"="o","white"="w","yellow"="y")

ring_number_choices <- c("none"="n","one"="o","two"="t")

ring_type_choices <- c("cobwebby"="c","evanescent"="e","flaring"="f","large"="l",
                        "none"="n","pendant"="p","sheathing"="s","zone"="z")

spore_print_color_choices <- c("black"="k","brown"="n","buff"="b","chocolate"="h","green"="r",
                               "orange"="o","purple"="u","white"="w","yellow"="y")

population_choices <- c("abundant"="a","clustered"="c","numerous"="n",
                        "scattered"="s","several"="v","solitary"="y")

habitat_choices <- c("grasses"="g","leaves"="l","meadows"="m","paths"="p",
                     "urban"="u","waste"="w","woods"="d")

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
                  choices = cap_color_choices, selected = "n"
      ),

      # bruises
      selectInput(inputId="bruises", label="Bruises:",
                  choices = bruises_choices, selected = "n"
      ),
      # odor
      selectInput(inputId="odor", label="Odor:",
                  choices = odor_choices, selected = "n"
      ),

      # gill-attachment
      selectInput(inputId="gill_attachment", label="Gill Attachment:",
                  choices = gill_attachment_choices, selected = "n"
      ),

      # gill-spacing
      selectInput(inputId="gill_spacing", label="Gill Spacing:",
                  choices = gill_spacing_choices, selected = "c"
      ),

      # gill-size
      selectInput(inputId="gill_size", label="Gill Size:",
                  choices = gill_size_choices, selected = "n"
      ),

      # gill-color
      selectInput(inputId="gill_color", label="Gill Color:",
                  choices = gill_color_choices, selected = "n"
      ),

      # stalk-shape
      selectInput(inputId="stalk_shape", label="Stalk Shape:",
                  choices = stalk_shape_choices, selected = "e"
      ),

      # stalk-root
      # selectInput(inputId="stalk_root", label="Stalk Root:",
      #             choices = stalk_root_choices, selected = "b"
      # ),

      # stalk-surface-above-ring
      selectInput(inputId="stalk_surface_above_ring", label="Stalk Surface Above Ring:",
                  choices = stalk_surface_above_ring_choices, selected = "f"
      ),

      # stalk-surface-below-ring
      selectInput(inputId="stalk_surface_below_ring", label="Stalk Surface Below Ring:",
                  choices = stalk_surface_below_ring_choices, selected = "f"
      ),

      # stalk-color-above-ring
      selectInput(inputId="stalk_color_above_ring", label="Stalk Color Above Ring:",
                  choices = stalk_color_above_ring_choices, selected = "n"
      ),

      # stalk-color-below-ring
      selectInput(inputId="stalk_color_below_ring", label="Stalk Color Below Ring:",
                  choices = stalk_color_below_ring_choices, selected = "n"
      ),

      # veil-type
      selectInput(inputId="veil_type", label="Veil Type:",
                  choices = veil_type_choices, selected = "p"
      ),

      # veil-color
      selectInput(inputId="veil_color", label="Veil Color:",
                  choices = veil_color_choices, selected = "n"
      ),

      # ring-number
      selectInput(inputId="ring_number", label="Ring Number:",
                  choices = ring_number_choices, selected = "n"
      ),

      # ring-type
      selectInput(inputId="ring_type", label="Ring Type:",
                  choices = ring_type_choices, selected = "c"
      ),

      # spore-print-color
      selectInput(inputId="spore_print_color", label="Spore Print Color:",
                  choices = spore_print_color_choices, selected = "n"
      ),

      # population
      selectInput(inputId="population", label="Population:",
                  choices = population_choices, selected = "n"
      ),

      # habitat
      selectInput(inputId="habitat", label="Habitat:",
                  choices = habitat_choices, selected = "d"
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

    # cap_shape
    cap_shape_data  <- Daten %>%
      filter(cap_shape == input$cap_shape) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Shape:", names(cap_shape_choices[cap_shape_choices == input$cap_shape]))
      )

    # cap_surface
    cap_surface_data <- Daten %>%
      filter(cap_surface == input$cap_surface) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Surface:", names(cap_surface_choices[cap_surface_choices == input$cap_surface]))
      )

    # cap_color
    cap_color_data <- Daten %>%
      filter(cap_color == input$cap_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Color:", names(cap_color_choices[cap_color_choices == input$cap_color]))
      )

    # bruises
    bruises_data <- Daten %>%
      filter(bruises == input$bruises) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Bruises:", names(bruises_choices[bruises_choices == input$bruises]))
      )

    # odor
    odor_data <- Daten %>%
      filter(odor == input$odor) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Odor:", names(odor_choices[odor_choices == input$odor]))
      )

    # gill-attachment
    gill_attachment_data <- Daten %>%
      filter(cap_surface == input$gill_attachment) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Attachment:", names(gill_attachment_choices[gill_attachment_choices == input$gill_attachment]))
      )

    # gill-spacing
    gill_spacing_data <- Daten %>%
      filter(gill_spacing == input$gill_spacing) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Spacing:", names(gill_spacing_choices[gill_spacing_choices == input$gill_spacing]))
      )

    # gill-size
    gill_size_data <- Daten %>%
      filter(gill_size == input$gill_size) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Size:", names(gill_size_choices[gill_size_choices == input$gill_size]))
      )

    # gill-color
    gill_color_data <- Daten %>%
      filter(gill_color == input$gill_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Color:", names(gill_color_choices[gill_color_choices == input$gill_color]))
      )

    # stalk-shape
    stalk_shape_data <- Daten %>%
      filter(stalk_shape == input$stalk_shape) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Shape:", names(stalk_shape_choices[stalk_shape_choices == input$stalk_shape]))
      )

    # stalk-root
    # stalk_root_data <- Daten %>%
    #   filter(stalk_root == input$stalk_root) %>%
    #   summarise(
    #     poisonous_percent = sum(edible == "p") / n() * 100,
    #     category = paste("Stalk Root:", names(stalk_root_choices[stalk_root_choices == input$stalk_root]))
    #  )

    # stalk-surface-above-ring
    stalk_surface_above_ring_data <- Daten %>%
      filter(stalk_surface_above_ring == input$stalk_surface_above_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Surface Above Ring:", names(stalk_surface_above_ring_choices[stalk_surface_above_ring_choices == input$stalk_surface_above_ring]))
      )

    # stalk-surface-below-ring
    stalk_surface_below_ring_data <- Daten %>%
      filter(stalk_surface_below_ring == input$stalk_surface_below_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Surface Below Ring:", names(stalk_surface_below_ring_choices[stalk_surface_below_ring_choices == input$stalk_surface_below_ring]))
      )

    # stalk-color-above-ring
    stalk_color_above_ring_data <- Daten %>%
      filter(stalk_color_above_ring == input$stalk_color_above_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Color Above Ring:", names(stalk_color_above_ring_choices[stalk_color_above_ring_choices == input$stalk_color_above_ring]))
      )

    # stalk-color-below-ring
    stalk_color_below_ring_data <- Daten %>%
      filter(stalk_color_below_ring == input$stalk_color_below_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Color Below Ring:", names(stalk_color_below_ring_choices[stalk_color_below_ring_choices == input$stalk_color_below_ring]))
      )

    # veil-type
    veil_type_data <- Daten %>%
      filter(veil_type == input$veil_type) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Veil Type:", names(veil_type_choices[veil_type_choices == input$veil_type]))
      )

    # veil-color
    veil_color_data <- Daten %>%
      filter(veil_color == input$veil_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Veil Color:", names(veil_color_choices[veil_color_choices == input$veil_color]))
      )

    # ring-number
    ring_number_data <- Daten %>%
      filter(ring_number == input$ring_number) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Ring Number:", names(ring_number_choices[ring_number_choices == input$ring_number]))
      )

    # ring-type
    ring_type_data <- Daten %>%
      filter(ring_type == input$ring_type) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Ring Type:", names(ring_type_choices[ring_type_choices == input$ring_type]))
      )

    # spore-print-color
    spore_print_color_data <- Daten %>%
      filter(spore_print_color == input$spore_print_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Spore Print Color:", names(spore_print_color_choices[spore_print_color_choices == input$spore_print_color]))
      )

    # population
    population_data <- Daten %>%
      filter(population == input$population) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Population:", names(population_choices[population_choices == input$population]))
      )

    # habitat
    habitat_data <- Daten %>%
      filter(habitat == input$habitat) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Habitat:", names(habitat_choices[habitat_choices == input$habitat]))
      )
    
    # Daten fürs Plotten. Für richtige Reihenfolge umdrehen, und dann die Kategorie as Faktor setzen
    plot_data <- bind_rows(cap_shape_data, cap_surface_data, cap_color_data, bruises_data, odor_data,
                           gill_attachment_data, gill_spacing_data, gill_size_data, gill_color_data,
                           stalk_shape_data, stalk_surface_above_ring_data, stalk_surface_below_ring_data,
                           stalk_color_above_ring_data, stalk_color_below_ring_data, veil_type_data, veil_color_data,
                           ring_number_data, ring_type_data, spore_print_color_data, population_data, habitat_data)
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






