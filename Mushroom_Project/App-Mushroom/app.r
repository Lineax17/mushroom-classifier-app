#Choices
#region Choices
cap_shape_choices <- c("Bell" = "b", "Conical" = "c", "Convex" = "x",
                       "Flat" = "f", "Knobbed" = "k", "Sunken" = "s")

choices_content <- lapply(names(cap_shape_choices), function(name) {
  paste0('<img src="images/Cap_Shape_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

cap_surface_choices <- c("Fibrous" = "f", "Grooves" = "g", "Scaly" = "y",
                         "Smooth" = "s")

cap_color_choices <- c("Brown" = "n", "Buff" = "b", "Cinnamon" = "c",
                       "Gray" = "g", "Green" = "r", "Pink" = "p",
                       "Purple" = "u", "Red" = "e", "White" = "w",
                       "Yellow" = "y")

bruises_choices <- c("Bruises" = "t", "No Bruises" = "f")

odor_choices <- c("almond" = "a", "anise" = "l", "creosote" = "c", "fishy" = "y", "foul" = "f",
                  "musty" = "m", "none" = "n", "pungent" = "p", "spicy" = "s")

gill_attachment_choices <- c("attached" = "a", "descending" = "d", "free" = "f", "notched" = "n")

gill_spacing_choices <- c("close" = "c", "crowded" = "w", "distant" = "d")

gill_size_choices <- c("broad" = "b", "narrow" = "n")

gill_color_choices <- c("black" = "k", "brown" = "n", "buff" = "b", "chocolate" = "h", "gray" = "g",
                        "green" = "r", "orange" = "o", "pink" = "p", "purple" = "u", "red" = "e",
                        "white" = "w", "yellow" = "y")

stalk_shape_choices <- c("enlarging" = "e", "tapering" = "t")

# stalk_root_choices <- c("bulbous"="b","club"="c","cup"="u","equal"="e",
#                        "rhizomorphs"="z","rooted"="r","missing"="?")

stalk_surface_above_ring_choices <- c("fibrous" = "f", "scaly" = "y", "silky" = "k", "smooth" = "s")

stalk_surface_below_ring_choices <- c("fibrous" = "f", "scaly" = "y", "silky" = "k", "smooth" = "s")

stalk_color_above_ring_choices <- c("black" = "k", "brown" = "n", "buff" = "b", "chocolate" = "h", "gray" = "g",
                                    "green" = "r", "orange" = "o", "pink" = "p", "purple" = "u", "red" = "e",
                                    "white" = "w", "yellow" = "y")

stalk_color_below_ring_choices <- c("black" = "k", "brown" = "n", "buff" = "b", "chocolate" = "h", "gray" = "g",
                                    "green" = "r", "orange" = "o", "pink" = "p", "purple" = "u", "red" = "e",
                                    "white" = "w", "yellow" = "y")

veil_type_choices <- c("partial" = "p", "universal" = "u")

veil_color_choices <- c("brown" = "n", "orange" = "o", "white" = "w", "yellow" = "y")

ring_number_choices <- c("none" = "n", "one" = "o", "two" = "t")

ring_type_choices <- c("cobwebby" = "c", "evanescent" = "e", "flaring" = "f", "large" = "l",
                       "none" = "n", "pendant" = "p", "sheathing" = "s", "zone" = "z")

spore_print_color_choices <- c("black" = "k", "brown" = "n", "buff" = "b", "chocolate" = "h", "green" = "r",
                               "orange" = "o", "purple" = "u", "white" = "w", "yellow" = "y")

population_choices <- c("abundant" = "a", "clustered" = "c", "numerous" = "n",
                        "scattered" = "s", "several" = "v", "solitary" = "y")

habitat_choices <- c("grasses" = "g", "leaves" = "l", "meadows" = "m", "paths" = "p",
                     "urban" = "u", "waste" = "w", "woods" = "d")
#endregion

################
# Im folgenden Abschnitt wird das User Interface (UI) definiert
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      .sidebar {
        font-size: 12px;  /* Verkleinere die Schriftgröße */
      }
      .selectize-input, .selectize-dropdown, .dropdown-menu, .bootstrap-select {
        font-size: 15px;  /* Verkleinere Schriftgröße in Dropdowns */
      }
      .form-group {
        margin-bottom: 5px;  /* Verkleinere Abstände zwischen Eingaben */
      }
    "))
  ),
  # Titel der App
  titlePanel("Mushroom"),

  # Layout für die Eingaben in die App und die Ausgaben
  sidebarLayout(

    # Die Definition der Eingabefelder auf der linken Seite
    sidebarPanel(
      #SidePanel
      # #region SidePanel

      # Eine Überschrift mit Linie darunter
      h4("Pilz Merkmale auswählen:", align = "center"),
      hr(style = "height: 1px; background: black"),



      fluidRow(

        # cap-shape
        column(6,
               pickerInput(inputId = "cap_shape", label = "Cap Shape:",
                 choices = cap_shape_choices, selected = "b",
                 choicesOpt = list(content = unlist(choices_content))
               )),

        # cap-surface
        column(6,
               selectInput(inputId = "cap_surface", label = "Cap Surface:",
                           choices = cap_surface_choices, selected = NULL
               )),

        # cap_color
        column(6,
               selectInput(inputId = "cap_color", label = "Cap Color:",
                           choices = cap_color_choices, selected = "n"
               )),

        # bruises
        column(6,
               selectInput(inputId = "bruises", label = "Bruises:",
                           choices = bruises_choices, selected = "n"
               )),

        # odor
        column(6,
               selectInput(inputId = "odor", label = "Odor:",
                           choices = odor_choices, selected = "n"
               )),

        # gill-attachment
        column(6,
               selectInput(inputId = "gill_attachment", label = "Gill Attachment:",
                           choices = gill_attachment_choices, selected = "n"
               )),

        # gill-spacing
        column(6,
               selectInput(inputId = "gill_spacing", label = "Gill Spacing:",
                           choices = gill_spacing_choices, selected = "c"
               )),

        # gill-size
        column(6,
               selectInput(inputId = "gill_size", label = "Gill Size:",
                           choices = gill_size_choices, selected = "n"
               )),

        # gill-color
        column(6,
               selectInput(inputId = "gill_color", label = "Gill Color:",
                           choices = gill_color_choices, selected = "n"
               )),

        # stalk-shape
        column(6,
               selectInput(inputId = "stalk_shape", label = "Stalk Shape:",
                           choices = stalk_shape_choices, selected = "e"
               )),

        # stalk-root
        #column(6,
        # selectInput(inputId="stalk_root", label="Stalk Root:",
        #             choices = stalk_root_choices, selected = "b"
        # )),

        # stalk-surface-above-ring
        column(6,
               selectInput(inputId = "stalk_surface_above_ring", label = "Stalk Surface Above Ring:",
                           choices = stalk_surface_above_ring_choices, selected = "f"
               )),

        # stalk-surface-below-ring
        column(6,
               selectInput(inputId = "stalk_surface_below_ring", label = "Stalk Surface Below Ring:",
                           choices = stalk_surface_below_ring_choices, selected = "f"
               )),

        # stalk-color-above-ring
        column(6,
               selectInput(inputId = "stalk_color_above_ring", label = "Stalk Color Above Ring:",
                           choices = stalk_color_above_ring_choices, selected = "n"
               )),

        # stalk-color-below-ring
        column(6,
               selectInput(inputId = "stalk_color_below_ring", label = "Stalk Color Below Ring:",
                           choices = stalk_color_below_ring_choices, selected = "n"
               )),

        # veil-type
        column(6,
               selectInput(inputId = "veil_type", label = "Veil Type:",
                           choices = veil_type_choices, selected = "p"
               )),

        # veil-color
        column(6,
               selectInput(inputId = "veil_color", label = "Veil Color:",
                           choices = veil_color_choices, selected = "n"
               )),

        # ring-number
        column(6,
               selectInput(inputId = "ring_number", label = "Ring Number:",
                           choices = ring_number_choices, selected = "n"
               )),

        # ring-type
        column(6,
               selectInput(inputId = "ring_type", label = "Ring Type:",
                           choices = ring_type_choices, selected = "c"
               )),

        # spore-print-color
        column(6,
               selectInput(inputId = "spore_print_color", label = "Spore Print Color:",
                           choices = spore_print_color_choices, selected = "n"
               )),

        # population
        column(6,
               selectInput(inputId = "population", label = "Population:",
                           choices = population_choices, selected = "n"
               )),

        # habitat
        column(6,
               selectInput(inputId = "habitat", label = "Habitat:",
                           choices = habitat_choices, selected = "d"
               )),
      ),
      #endregion

    ),

    # der Hauptbereich der Nutzeroberfläche für die Ausgabe der Ergebnisse
    mainPanel(
      #plotOutput(outputId = "BarPlot"),
      htmlOutput("prediction"),
      plotOutput(outputId = "BarPlot", height = 20 * 21)
    )
  )
)

############


server <- function(input, output, session) {

  observeEvent(input$cap_shape, {
    #Warted auf auswahl von cap_shape
    req(input$cap_shape)

    # Filtere cap_surface-Choices basierend auf cap_shape
    filtered_surfaces <- unique(data$cap_surface[data$cap_shape == input$cap_shape])

    # Mappe Namen zu Werten
    mapped_surfaces <- cap_surface_choices[cap_surface_choices %in% filtered_surfaces]
    # Update der möglichen Auswahl
    updateSelectInput(session, "cap_surface",
                      choices = mapped_surfaces,
                      selected = mapped_surfaces[1])
  })

  #Bar diagram (single Values)
  output$BarPlot <- renderPlot({

    # Eingeschaften Filtern
    #region Eingeschaften Filtern
    # cap_shape
    cap_shape_data <- data %>%
      filter(cap_shape == input$cap_shape) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Shape:", names(cap_shape_choices[cap_shape_choices == input$cap_shape]))
      )
    # cap_surface
    cap_surface_data <- data %>%
      filter(cap_surface == input$cap_surface) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Surface:", names(cap_surface_choices[cap_surface_choices == input$cap_surface]))
      )

    # cap_color
    cap_color_data <- data %>%
      filter(cap_color == input$cap_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Cap Color:", names(cap_color_choices[cap_color_choices == input$cap_color]))
      )

    # bruises
    bruises_data <- data %>%
      filter(bruises == input$bruises) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Bruises:", names(bruises_choices[bruises_choices == input$bruises]))
      )

    # odor
    odor_data <- data %>%
      filter(odor == input$odor) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Odor:", names(odor_choices[odor_choices == input$odor]))
      )

    # gill-attachment
    gill_attachment_data <- data %>%
      filter(cap_surface == input$gill_attachment) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Attachment:", names(gill_attachment_choices[gill_attachment_choices == input$gill_attachment]))
      )

    # gill-spacing
    gill_spacing_data <- data %>%
      filter(gill_spacing == input$gill_spacing) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Spacing:", names(gill_spacing_choices[gill_spacing_choices == input$gill_spacing]))
      )

    # gill-size
    gill_size_data <- data %>%
      filter(gill_size == input$gill_size) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Size:", names(gill_size_choices[gill_size_choices == input$gill_size]))
      )

    # gill-color
    gill_color_data <- data %>%
      filter(gill_color == input$gill_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Gill Color:", names(gill_color_choices[gill_color_choices == input$gill_color]))
      )

    # stalk-shape
    stalk_shape_data <- data %>%
      filter(stalk_shape == input$stalk_shape) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Shape:", names(stalk_shape_choices[stalk_shape_choices == input$stalk_shape]))
      )

    # stalk-root
    # stalk_root_data <- data %>%
    #   filter(stalk_root == input$stalk_root) %>%
    #   summarise(
    #     poisonous_percent = sum(edible == "p") / n() * 100,
    #     category = paste("Stalk Root:", names(stalk_root_choices[stalk_root_choices == input$stalk_root]))
    #  )

    # stalk-surface-above-ring
    stalk_surface_above_ring_data <- data %>%
      filter(stalk_surface_above_ring == input$stalk_surface_above_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Surface Above Ring:", names(stalk_surface_above_ring_choices[stalk_surface_above_ring_choices == input$stalk_surface_above_ring]))
      )

    # stalk-surface-below-ring
    stalk_surface_below_ring_data <- data %>%
      filter(stalk_surface_below_ring == input$stalk_surface_below_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Surface Below Ring:", names(stalk_surface_below_ring_choices[stalk_surface_below_ring_choices == input$stalk_surface_below_ring]))
      )

    # stalk-color-above-ring
    stalk_color_above_ring_data <- data %>%
      filter(stalk_color_above_ring == input$stalk_color_above_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Color Above Ring:", names(stalk_color_above_ring_choices[stalk_color_above_ring_choices == input$stalk_color_above_ring]))
      )

    # stalk-color-below-ring
    stalk_color_below_ring_data <- data %>%
      filter(stalk_color_below_ring == input$stalk_color_below_ring) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Stalk Color Below Ring:", names(stalk_color_below_ring_choices[stalk_color_below_ring_choices == input$stalk_color_below_ring]))
      )

    # veil-type
    veil_type_data <- data %>%
      filter(veil_type == input$veil_type) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Veil Type:", names(veil_type_choices[veil_type_choices == input$veil_type]))
      )

    # veil-color
    veil_color_data <- data %>%
      filter(veil_color == input$veil_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Veil Color:", names(veil_color_choices[veil_color_choices == input$veil_color]))
      )

    # ring-number
    ring_number_data <- data %>%
      filter(ring_number == input$ring_number) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Ring Number:", names(ring_number_choices[ring_number_choices == input$ring_number]))
      )

    # ring-type
    ring_type_data <- data %>%
      filter(ring_type == input$ring_type) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Ring Type:", names(ring_type_choices[ring_type_choices == input$ring_type]))
      )

    # spore-print-color
    spore_print_color_data <- data %>%
      filter(spore_print_color == input$spore_print_color) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Spore Print Color:", names(spore_print_color_choices[spore_print_color_choices == input$spore_print_color]))
      )

    # population
    population_data <- data %>%
      filter(population == input$population) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Population:", names(population_choices[population_choices == input$population]))
      )

    # habitat
    habitat_data <- data %>%
      filter(habitat == input$habitat) %>%
      summarise(
        poisonous_percent = sum(edible == "p") / n() * 100,
        category = paste("Habitat:", names(habitat_choices[habitat_choices == input$habitat]))
      )
    #endregion

    # data fürs Plotten. Für richtige Reihenfolge umdrehen, und dann die Kategorie as Faktor setzen
    plot_data <- bind_rows(cap_shape_data, cap_surface_data, cap_color_data, bruises_data, odor_data,
                           gill_attachment_data, gill_spacing_data, gill_size_data, gill_color_data,
                           stalk_shape_data, stalk_surface_above_ring_data, stalk_surface_below_ring_data,
                           stalk_color_above_ring_data, stalk_color_below_ring_data, veil_type_data, veil_color_data,
                           ring_number_data, ring_type_data, spore_print_color_data, population_data, habitat_data)
    plot_data <- plot_data[rev(seq_len(nrow(plot_data))),]
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

  output$prediction <- renderPrint({
    # Eingaben des Benutzers in ein DataFrame umwandeln
    user_input <- data.frame(
      cap_shape = input$cap_shape,
      cap_surface = input$cap_surface,
      cap_color = input$cap_color,
      bruises = input$bruises,
      odor = input$odor,
      gill_attachment = input$gill_attachment,
      gill_spacing = input$gill_spacing,
      gill_size = input$gill_size,
      gill_color = input$gill_color,
      stalk_shape = input$stalk_shape,
      stalk_surface_above_ring = input$stalk_surface_above_ring,
      stalk_surface_below_ring = input$stalk_surface_below_ring,
      stalk_color_above_ring = input$stalk_color_above_ring,
      stalk_color_below_ring = input$stalk_color_below_ring,
      veil_type = input$veil_type,
      veil_color = input$veil_color,
      ring_number = input$ring_number,
      ring_type = input$ring_type,
      spore_print_color = input$spore_print_color,
      population = input$population,
      habitat = input$habitat
    )

    # Vorhersage basierend auf Benutzereingaben
    tryCatch({
      # Prediction durchführen
      output$prediction <- renderUI({
        # Beispielvorhersage (ersetze durch dein Modell)
        prediction <- ifelse(input$cap_shape == "b" && input$cap_surface == "f", "e", "p")
        text <- ifelse(prediction == "e", "Essbar", "Giftig")
        color <- ifelse(prediction == "e", "green", "red")

        # Dynamische Ausgabe
        HTML(paste0('<h4 style="color:', color, '; font-size: 20px; font-weight: bold; text-align: center;">',
                    "Der Pilz ist: ", text, '</h4>'))
      })
    }, error = function(e) {
      # Fehler abfangen und Meldung ausgeben
      "Vorhersage nicht möglich: Eingaben enthalten unbekannte Werte."
    })
  })

}


# Aufruf der App-Funktionen
###############

shinyApp(ui = ui, server = server)

###############






