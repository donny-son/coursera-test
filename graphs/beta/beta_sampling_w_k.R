library(shiny)


# Beta sample dist with input w and k
ui <- fluidPage(
  titlePanel("Beta Sampling with w,k"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "w", 
                  label = "Choose the most likely possibility :", 
                  value = 0.01, 
                  min = 0.01, 
                  max = 1, 
                  step = 0.01),
      sliderInput(inputId = "k", 
                  label = "Choose the k value :", 
                  value = 2.001, 
                  min = 2, 
                  max = 1000, 
                  step = 1)
    ),
    mainPanel(
      plotOutput('hist')
    )
  )
)

server <- function(input, output) {
  output$hist <- renderPlot({
    alpha <-input$w*(input$k - 2) +1
    beta <- (1-input$w)*(input$k -2) +1
    title<- "Beta Distribution with 100000 samples"
    hist(rbeta(100000,alpha,beta),
         main = title,
         xlab = 'X',
         breaks = 100)
  })
}

shinyApp(ui = ui, server = server)