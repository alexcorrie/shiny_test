# ui.R for Census-App

library(shiny)

shinyUI(fluidPage(theme = "slatebootstrap.css",
  titlePanel("Census Visualization"),
  
  sidebarLayout(
    sidebarPanel(
    helpText("Create demographic maps of the continental US with information
             from the 2010 US Census."),
    
    selectInput("var",
      label = "Choose a variable to display:",
      choices = list("Percent Asian", "Percent Black",
                     "Percent Hispanic", "Percent White"),
      selected = "Percent Asian"),
    
    sliderInput("range",
      label = "Percentage range:",
      min = 0, max = 100, value = c(0, 10)),
    br(), # break
    br(),
    br(),
    br(),
    br(),
    br(),
    img(src = "bigorb.png", width = 72, height = 72), # image file in App-A www directory
    "This application is powered by ",
    a("RStudio", href = "http://www.rstudio.com/shiny")
  ),
  
  mainPanel(
    textOutput("text1"), # text1 is the name you have given text output
    textOutput("text2"), # text2 is the name you have given text output
    plotOutput("map") # map is the name you have given plot output
    ) 
  )
))
