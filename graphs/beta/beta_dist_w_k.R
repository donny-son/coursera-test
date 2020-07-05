library(shiny)
library(ggplot2)


# beta dist with input w and k. ggplot. showing alpha and beta values interactively.
ui <- fluidPage(
  titlePanel('Beta Distributions with w,k'),
  sidebarLayout(
    sidebarPanel(sliderInput(inputId = "w", label = "Choose the most likely possibility(w ; mode) :", value = 0.01, min = 0.01, max = 1, step = 0.01),
                 sliderInput(inputId = "k", label = "Choose the k value :", value = 2.001, min = 2, max = 50, step = 1)),
    mainPanel(plotOutput('dist'))
  )
)

server <- function(input, output) {
  output$dist <- renderPlot({
    alpha <-input$w*(input$k - 2) +1
    beta <- (1-input$w)*(input$k -2) +1
    p <- seq(0,1,length = 1000)
    db <- dbeta(p,alpha,beta)
    ggplot() + geom_line(aes(p,db)) + ggtitle("Beta Distribution") + xlab("probability") + ylab('density') + theme(plot.title = element_text(size = 14, face = "bold",hjust = 0.5), axis.title = element_text(size = 10, face = 'bold'))
  })
  output$abvalue <- renderText({
    paste("alpha =", input$w*(input$k - 2) +1,
          "beta = ", (1-input$w)*(input$k -2) +1)
    
  })
}

shinyApp(ui = ui, server = server)
