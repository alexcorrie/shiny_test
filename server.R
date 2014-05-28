# server.R for Census-App

library(shiny)
library(maps)
source("helpers.R") # working directory Census-App
counties <- readRDS("data/counties.rds") # working directory is 
  # already understood to be Census-App, so only need to add data/

shinyServer(function(input, output) {
  
  output$text1 <- renderText({
    paste("You have selected:", input$var)
  })
  
  output$text2 <- renderText({
    paste("You have chosen a percentage range that goes from:",
          input$range[1], "to", input$range[2])
  })
  
  output$map <- renderPlot({
    data <- switch(input$var,
      "Percent Asian" = counties$asian,
      "Percent Black" = counties$black,
      "Percent Hispanic" = counties$hispanic,
      "Percent White" = counties$white)
    
    color <- switch(input$var,
      "Percent Asian" = "darkviolet",
      "Percent Black" = "darkgreen",
      "Percent Hispanic" = "darkorange",
      "Percent White" = "darkblue")
    
    legend <- switch(input$var,
      "Percent Asian" = "% Asian",
      "Percent Black" = "% Black",
      "Percent Hispanic" = "% Hispanic",
      "Percent White" = "% White")
    
    percent_map(var = data, color = color, legend.title = legend,
                min = input$range[1], max = input$range[2])
  })
})
