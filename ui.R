library(shiny)
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Crime locations inside the city - by type"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(position ="right",
    sidebarPanel("Crimes",
      selectInput("Select",
                  "Select the kind of crime to display:",
                  choices = as.character( agg_crime$Primary.Type))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(align="center",
      textOutput("text1"),
      imageOutput("map")
    )
  )
))
