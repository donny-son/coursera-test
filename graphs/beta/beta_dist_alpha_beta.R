# beta dist with input alpha and beta. ggplot. showing alpha and beta values interactively.

library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel('Beta Distributions with a,b'),
  sidebarLayout(
    sidebarPanel(sliderInput(inputId = "alpha", 
                             label = "Choose alpha :", 
                             value = 1, 
                             min = 0.1, 
                             max = 100, 
                             step = 0.1),
                 sliderInput(inputId = "beta", 
                             label = "Choose beta :", 
                             value = 1, 
                             min = 0.1, 
                             max = 100, 
                             step = 0.1)),
    mainPanel(plotOutput('dist'))
  )
)

server <- function(input, output) {
  output$dist <- renderPlot({
    alpha <-input$alpha
    beta <-input$beta 
    p <- seq(0,1,length = 1000)
    db <- dbeta(p,alpha,beta)
    ggplot() + 
      geom_line(aes(p,db)) + 
      ggtitle("Beta Distribution") + 
      xlab("probability") + 
      ylab('density') + 
      theme(plot.title = element_text(size = 14, face = "bold",hjust = 0.5), 
            axis.title = element_text(size = 10, face = 'bold'))
  })
}

shinyApp(ui = ui, server = server)
