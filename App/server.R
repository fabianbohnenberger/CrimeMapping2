library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$text1 <- renderText({ 
    paste("You have selected", input$Select)
  })
  output$map <- renderPlot({
    locationData <- subset(Crime_Data, Primary.Type == input$Select)
    
    ChicagoMap <- qmap("Chicago", zoom = 11, maptype = "toner", source = "stamen")
    
    ##ChicagoMap <- get_map(location = c(lon = -87.6747987, lat = 41.9654501), zoom = 10, maptype = "toner", source = "stamen")
    
    FinalMap <- ChicagoMap +
      geom_point(aes(x = Longitude, y = Latitude, colour = Primary.Type),
                 data = locationData) +
      #geom_point(aes(x = stations$coords.x1, y = stations$coords.x2), data = stations) +
      xlab('') + ylab('') +
      theme(axis.ticks = element_blank(), 
            axis.text.x = element_blank(),
            axis.text.y = element_blank()) + 
      guides(size = guide_legend(title = 'Crime Type'),
             colour = guide_legend(title = 'Crime Type'))
    print(FinalMap)
  })
})