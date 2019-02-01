## LOADING LIBRARIES
library(shiny)
library(datasets)

## FACTORS
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

## SHINY SERVER
shinyServer(function(input, output) {
  
  formulaLabel <- reactive({
    paste("mpg ~", input$variable)
  })
  
  formulaTextAnalysis <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    lm(as.formula(formulaTextAnalysis()), data=mpgData)
  })
  
  output$caption <- renderText({
    formulaLabel()
  })
  
  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaLabel()), 
            data = mpgData,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaTextAnalysis()))
      abline(fit(), col=2)
    })
  })
  
})
