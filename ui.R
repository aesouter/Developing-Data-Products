library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Metrics from MPG"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderMPG", "What is the MPG of the car?", 10,35,value=20),
      checkboxInput("HP","Show/Hide HP", value=TRUE),
      checkboxInput("qsec","Show/Hide qsec", value=TRUE)
    ),
    mainPanel(
      plotOutput("plot1"),
      h5("Predicted Horsepower from MPG:"),
      textOutput("HPpred"),
      plotOutput("plot2"),
      h5("Predicted 1/4 Mile Time from MPG:"),
      textOutput("qsecpred")
    )
  )
))
      