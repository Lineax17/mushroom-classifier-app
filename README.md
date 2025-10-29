# Mushroom Classifier

This project contains a dataset with mushroom data and an interactive Shiny app to classify and analyze mushroom characteristics.

## Data Source

https://www.kaggle.com/datasets/uciml/mushroom-classification

## Requirements

- R (>= 4.0)
- Required R packages:
  - shiny
  - ggplot2
  - dplyr
  - shinyWidgets
  - caret (for mushroom.r)
  - rpart (for mushroom.r)
  - rpart.plot (for mushroom.r)

Install packages with:
```r
install.packages(c("shiny", "ggplot2", "dplyr", "shinyWidgets", "caret", "rpart", "rpart.plot"))
```

## Running the App

### Option 1: Direct execution (recommended)
```r
# From R console in the project directory
library(shiny)
runApp(".")
```

### Option 2: Using mushroom.r script

```r
# Run the complete workflow (training + app)
source("mushroom-analysis.r")
```

### Option 3: Command line
```bash
cd /path/to/r-mushroom-classifier-app
R -e "shiny::runApp('.')"
```

The app will start on port 8100 by default and open in your web browser.

## Features

- Interactive mushroom characteristic selection
- Real-time toxicity analysis for each property
- Visual bar charts showing poisonous percentage
- Responsive UI with image-enhanced selection options
- Cascading selection filters based on dataset

