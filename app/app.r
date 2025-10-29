
# Choices
# region Choices
cap_shape_choices <- c("Bell" = "b", "Conical" = "c", "Convex" = "x",
                       "Flat" = "f", "Knobbed" = "k", "Sunken" = "s")

cap_shape_choices_content <- lapply(names(cap_shape_choices), function(name) {
  paste0('<img src="images/Cap_Shape_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

cap_surface_choices <- c("Fibrous" = "f", "Grooves" = "g", "Scaly" = "y",
                         "Smooth" = "s")
cap_surface_choices_content <- lapply(names(cap_surface_choices), function(name) {
  paste0('<img src="images/Cap_Surface_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

cap_color_choices <- c("Brown" = "n", "Buff" = "b", "Cinnamon" = "c",
                       "Gray" = "g", "Green" = "r", "Pink" = "p",
                       "Purple" = "u", "Red" = "e", "White" = "w",
                       "Yellow" = "y")

bruises_choices <- c("Bruises" = "t", "No Bruises" = "f")

odor_choices <- c("Almond" = "a", "Anise" = "l", "Creosote" = "c", "Fishy" = "y", "Foul" = "f",
                  "Musty" = "m", "None" = "n", "Pungent" = "p", "Spicy" = "s")

gill_attachment_choices <- c("Attached" = "a", "Free" = "f")
gill_attachment_choices_content <- lapply(names(gill_attachment_choices), function(name) {
  paste0('<img src="images/Gill_Attachment_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

gill_spacing_choices <- c("Close" = "c", "Crowded" = "w")
gill_spacing_choices_content <- lapply(names(gill_spacing_choices), function(name) {
  paste0('<img src="images/Gill_Spacing_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

gill_size_choices <- c("Broad" = "b", "Narrow" = "n")

gill_color_choices <- c("Black" = "k", "Brown" = "n", "Buff" = "b", "Chocolate" = "h", "Gray" = "g",
                        "Green" = "r", "Orange" = "o", "Pink" = "p", "Purple" = "u", "Red" = "e",
                        "White" = "w", "Yellow" = "y")

stalk_shape_choices <- c("Enlarging" = "e", "Tapering" = "t")

# stalk_root_choices <- c("bulbous"="b","club"="c","cup"="u","equal"="e",
#                        "rhizomorphs"="z","rooted"="r","missing"="?")

stalk_surface_above_ring_choices <- c("Fibrous" = "f", "Scaly" = "y", "Silky" = "k", "Smooth" = "s")

stalk_surface_below_ring_choices <- c("Fibrous" = "f", "Scaly" = "y", "Silky" = "k", "Smooth" = "s")

stalk_color_above_ring_choices <- c("Black" = "k", "Brown" = "n", "Buff" = "b", "Chocolate" = "h", "Gray" = "g",
                                    "Green" = "r", "Orange" = "o", "Pink" = "p", "Purple" = "u", "Red" = "e",
                                    "White" = "w", "Yellow" = "y")

stalk_color_below_ring_choices <- c("Black" = "k", "Brown" = "n", "Buff" = "b", "Chocolate" = "h", "Gray" = "g",
                                    "Green" = "r", "Orange" = "o", "Pink" = "p", "Purple" = "u", "Red" = "e",
                                    "White" = "w", "Yellow" = "y")

veil_color_choices <- c("Brown" = "n", "Orange" = "o", "White" = "w", "Yellow" = "y")

ring_number_choices <- c("None" = "n", "One" = "o", "Two" = "t")

ring_type_choices <- c("Evanescent" = "e", "Flaring" = "f", "Large" = "l",
                       "None" = "n", "Pendant" = "p")
ring_type_choices_content <- lapply(names(ring_type_choices), function(name) {
  paste0('<img src="images/Ring_Type_', name, '.png" style="width:16px; height:16px; margin-right:10px;"> ', name)
})

spore_print_color_choices <- c("Black" = "k", "Brown" = "n", "Buff" = "b", "Chocolate" = "h", "Green" = "r",
                               "Orange" = "o", "Purple" = "u", "White" = "w", "Yellow" = "y")

population_choices <- c("Abundant" = "a", "Clustered" = "c", "Numerous" = "n",
                        "Scattered" = "s", "Several" = "v", "Solitary" = "y")

habitat_choices <- c("Grasses" = "g", "Leaves" = "l", "Meadows" = "m", "Paths" = "p",
                     "Urban" = "u", "Waste" = "w", "Woods" = "d")

# The following section defines the User Interface (UI)
ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      .sidebar {
        font-size: 12px;
      }
      .selectize-input, .selectize-dropdown, .dropdown-menu, .bootstrap-select {
        font-size: 15px;
      }
      .form-group {
        margin-bottom: 5px;
      }
    "))
  ),
  # Title of the app
  titlePanel("Mushroom"),

  # Layout for the inputs to the app and the outputs
  sidebarLayout(

    # The definition of the input fields on the left side
    sidebarPanel(
      # SidePanel
      # region SidePanel

      # A heading with a line below
      h4("Select mushroom characteristics:", align = "left"),
      hr(style = "height: 1px; background: black"),

      fluidRow(

        # cap-shape
        column(6,
               pickerInput(inputId = "cap_shape", label = "Cap Shape:",
                 choices = cap_shape_choices, selected = "b",
                 choicesOpt = list(content = unlist(cap_shape_choices_content))
               )),

        # cap-surface
        column(6,
               pickerInput(inputId = "cap_surface", label = "Cap Surface:",
                           choices = cap_surface_choices, selected = "b",
                           choicesOpt = list(content = unlist(cap_surface_choices_content))
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
               pickerInput(inputId = "gill_attachment", label = "Gill Attachment:",
                           choices = gill_attachment_choices, selected = "b",
                           choicesOpt = list(content = unlist(gill_attachment_choices_content))
               )),

        # gill-spacing
        column(6,
               pickerInput(inputId = "gill_spacing", label = "Gill Spacing:",
                           choices = gill_spacing_choices, selected = "b",
                           choicesOpt = list(content = unlist(gill_spacing_choices_content))
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

        # veil-color
        column(6,
               selectInput(inputId = "veil_color", label = "Veil Color:",
                           choices = veil_color_choices, selected = "n"
               )),

        # ring-number
        column(6,
               selectInput(inputId = "ring_number", label = "Ring Number:",
                           choices = ring_number_choices, selected = "o"
               )),

        # ring-type
        column(6,
               pickerInput(inputId = "ring_type", label = "Ring Type:",
                           choices = ring_type_choices, selected = "b",
                           choicesOpt = list(content = unlist(ring_type_choices_content))
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
      # endregion

    ),

    # The main area of the user interface for displaying the results
    mainPanel(
      # plotOutput(outputId = "BarPlot"),
      htmlOutput("prediction"),
      plotOutput(outputId = "BarPlot", height = 20 * 21),
      hr(style = "height: 1px; background: black"),
      tags$img(src = "../images/mushroom_overview.png", alt = "Test Image", style = "width:250px; height:250px;")
    )
  )
)

############


server <- function(input, output, session) {

  # Bar diagram (single values)
  output$BarPlot <- renderPlot({

    # Filter properties

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
      filter(gill_attachment == input$gill_attachment) %>%
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
    # endregion

    # Data for plotting. Reverse for correct order, then set the category as factor
    plot_data <- bind_rows(cap_shape_data, cap_surface_data, cap_color_data, bruises_data, odor_data,
                           gill_attachment_data, gill_spacing_data, gill_size_data, gill_color_data,
                           stalk_shape_data, stalk_surface_above_ring_data, stalk_surface_below_ring_data,
                           stalk_color_above_ring_data, stalk_color_below_ring_data, veil_color_data,
                           ring_number_data, ring_type_data, spore_print_color_data, population_data, habitat_data)
    plot_data <- plot_data[rev(seq_len(nrow(plot_data))),]
    plot_data$category <- factor(plot_data$category, levels = plot_data$category)


    ggplot(plot_data, aes(x = category, y = poisonous_percent, fill = category)) +
      geom_bar(stat = "identity", width = 0.5) +
      coord_flip() +
      scale_x_discrete(expand = c(0, 0)) +
      scale_y_continuous(limits = c(0, 100), name = "Toxicity Percentage") +  # Global y-axis label
      labs(
        title = "Toxicity analysis for properties",
      ) +
      theme_minimal() +
      theme(
        axis.text.y = element_text(size = 10),      # Readable category names
        plot.title = element_text(hjust = 0.5),     # Center the title
        legend.position = "none"                    # Remove the legend
      )
  })

  output$prediction <- renderPrint({
    # Convert user inputs into a DataFrame
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
      veil_color = input$veil_color,
      ring_number = input$ring_number,
      ring_type = input$ring_type,
      spore_print_color = input$spore_print_color,
      population = input$population,
      habitat = input$habitat
    )

    # Prediction based on user inputs
    tryCatch({
      # Perform prediction
      output$prediction <- renderUI({
        # Example prediction (replace with your model)
        prediction <- ifelse(input$cap_shape == "b" && input$cap_surface == "f", "e", "p")
        text <- ifelse(prediction == "e", "Edible", "Poisonous")
        color <- ifelse(prediction == "e", "green", "red")

        # Dynamic output
        HTML(paste0('<h4 style="color:', color, '; font-size: 20px; font-weight: bold; text-align: center;">',
                    "The Mushroom is: ", text, '</h4>'))
      })
    }, error = function(e) {
      # Catch errors and output message
      "Prediction not possible: Inputs contain unknown values."
    })
  })

  observeEvent(input$cap_shape, {
    # Wait for selection of cap_shape
    req(input$cap_shape)
    # Filter cap_surface choices based on cap_shape
    filtered_data <- unique(data$cap_surface[data$cap_shape == input$cap_shape])
    # Map names to values
    mapped_data <- cap_surface_choices[cap_surface_choices %in% filtered_data]
    # Update the possible selection
    updateSelectInput(session, "cap_surface",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$cap_surface, {
    req(input$cap_surface)
    filtered_data <- unique(data$cap_color[data$cap_surface == input$cap_surface])
    mapped_data <- cap_color_choices[cap_color_choices %in% filtered_data]
    updateSelectInput(session, "cap_color",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$cap_color, {
    req(input$cap_color)
    filtered_data <- unique(data$bruises[data$cap_color == input$cap_color])
    mapped_data <- bruises_choices[bruises_choices %in% filtered_data]
    updateSelectInput(session, "bruises",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$bruises, {
    req(input$bruises)
    filtered_data <- unique(data$odor[data$bruises == input$bruises])
    mapped_data <- odor_choices[odor_choices %in% filtered_data]
    updateSelectInput(session, "odor",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$odor, {
    req(input$odor)
    filtered_data <- unique(data$gill_attachment[data$odor == input$odor])
    mapped_data <- gill_attachment_choices[gill_attachment_choices %in% filtered_data]
    updateSelectInput(session, "gill_attachment",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$gill_attachment, {
    req(input$gill_attachment)
    filtered_data <- unique(data$gill_spacing[data$gill_attachment == input$gill_attachment])
    mapped_data <- gill_spacing_choices[gill_spacing_choices %in% filtered_data]
    updateSelectInput(session, "gill_spacing",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$gill_spacing, {
    req(input$gill_spacing)
    filtered_data <- unique(data$gill_size[data$gill_spacing == input$gill_spacing])
    mapped_data <- gill_size_choices[gill_size_choices %in% filtered_data]
    updateSelectInput(session, "gill_size",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$gill_size, {
    req(input$gill_size)
    filtered_data <- unique(data$gill_color[data$gill_size == input$gill_size])
    mapped_data <- gill_color_choices[gill_color_choices %in% filtered_data]
    updateSelectInput(session, "gill_color",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$gill_color, {
    req(input$gill_color)
    filtered_data <- unique(data$stalk_shape[data$gill_color == input$gill_color])
    mapped_data <- stalk_shape_choices[stalk_shape_choices %in% filtered_data]
    updateSelectInput(session, "stalk_shape",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$stalk_shape, {
    req(input$stalk_shape)
    filtered_data <- unique(data$stalk_surface_above_ring[data$stalk_shape == input$stalk_shape])
    mapped_data <- stalk_surface_above_ring_choices[stalk_surface_above_ring_choices %in% filtered_data]
    updateSelectInput(session, "stalk_surface_above_ring",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$stalk_surface_above_ring, {
    req(input$stalk_surface_above_ring)
    filtered_data <- unique(data$stalk_surface_below_ring[data$stalk_surface_above_ring == input$stalk_surface_above_ring])
    mapped_data <- stalk_surface_below_ring_choices[stalk_surface_below_ring_choices %in% filtered_data]
    updateSelectInput(session, "stalk_surface_below_ring",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$stalk_surface_below_ring, {
    req(input$stalk_surface_below_ring)
    filtered_data <- unique(data$stalk_color_above_ring[data$stalk_surface_below_ring == input$stalk_surface_below_ring])
    mapped_data <- stalk_color_above_ring_choices[stalk_color_above_ring_choices %in% filtered_data]
    updateSelectInput(session, "stalk_color_above_ring",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$stalk_color_above_ring, {
    req(input$stalk_color_above_ring)
    filtered_data <- unique(data$stalk_color_below_ring[data$stalk_color_above_ring == input$stalk_color_above_ring])
    mapped_data <- stalk_color_below_ring_choices[stalk_color_below_ring_choices %in% filtered_data]
    updateSelectInput(session, "stalk_color_below_ring",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$stalk_color_below_ring, {
    req(input$stalk_color_below_ring)
    filtered_data <- unique(data$veil_color[data$stalk_color_below_ring == input$stalk_color_below_ring])
    mapped_data <- veil_color_choices[veil_color_choices %in% filtered_data]
    updateSelectInput(session, "veil_color",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$veil_color, {
    req(input$veil_color)
    filtered_data <- unique(data$ring_number[data$veil_color == input$veil_color])
    mapped_data <- ring_number_choices[ring_number_choices %in% filtered_data]
    updateSelectInput(session, "ring_number",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$ring_number, {
    req(input$ring_number)
    filtered_data <- unique(data$ring_type[data$ring_number == input$ring_number])
    mapped_data <- ring_type_choices[ring_type_choices %in% filtered_data]
    updateSelectInput(session, "ring_type",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$ring_type, {
    req(input$ring_type)
    filtered_data <- unique(data$spore_print_color[data$ring_type == input$ring_type])
    mapped_data <- spore_print_color_choices[spore_print_color_choices %in% filtered_data]
    updateSelectInput(session, "spore_print_color",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$spore_print_color, {
    req(input$spore_print_color)
    filtered_data <- unique(data$population[data$spore_print_color == input$spore_print_color])
    mapped_data <- population_choices[population_choices %in% filtered_data]
    updateSelectInput(session, "population",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

  observeEvent(input$population, {
    req(input$population)
    filtered_data <- unique(data$habitat[data$population == input$population])
    mapped_data <- habitat_choices[habitat_choices %in% filtered_data]
    updateSelectInput(session, "habitat",
                      choices = mapped_data,
                      selected = mapped_data[1])
  })

}


# Call the app
###############

shinyApp(ui = ui, server = server)

###############