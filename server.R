library(shiny)
shinyServer(function(input, output) {
  HP <- lm(hp ~ mpg, data = mtcars)
  qsec <- lm(qsec ~ mpg, data =mtcars)
                         
  HPpred <- reactive({
    mpgInput <- input$sliderMPG
    predict(HP, newdata = data.frame(mpg = mpgInput))
  })
  
  qsecpred <- reactive({
    mpgInput <- input$sliderMPG
    predict(qsec, newdata = data.frame(mpg = mpgInput))
  })
  
  output$plot1 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    plot(mtcars$mpg, mtcars$hp, xlab = "Miles Per Gallon",
         ylab = "Horsepower", bty = "n", pch = 16,
         xlim = c(10, 35), ylim = c(50, 350))
    if(input$HP){
      abline(HP,col="red",lwd=6)
    }
    title("Horsepower by MPG")
    })
  output$HPpred <- renderText({
             HPpred()
           })
  
  output$plot2 <- renderPlot({
    mpgInput <- input$sliderMPG
    
    plot(mtcars$mpg, mtcars$qsec, xlab = "Miles Per Gallon",
         ylab = "1/4 Mile Time (secs)", bty = "n", pch = 16,
         xlim = c(10, 35), ylim = c(14, 23))
    if(input$qsec){
      abline(qsec,col="blue",lwd=6)
    }
    title("1/4 Mile Time (Seconds)")
  })
  output$qsecpred <- renderText({
    qsecpred()
  })
})