#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Basic input functions for beta dist.
ui <- fluidPage(theme = 'bootstrap.css',
                titlePanel("Basic Beta Sampling"),
                
                sidebarLayout(
                    sidebarPanel(
                        sliderInput(inputId = "alpha", 
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
                                    step = 0.1),
                        sliderInput(inputId = "N", 
                                    label = "Choose sample size N :", 
                                    value = 5000, 
                                    min = 10, 
                                    max = 10000, 
                                    step = 1)     
                    ),
                    mainPanel(
                        plotOutput('hist')
                    )
                )
                
)

server <- function(input, output) {
    output$hist <- renderPlot({
        title<- "Beta Distribution with N samples"
        hist(rbeta(input$N,input$alpha,input$beta),
             xlab = "X",
             main = title,
             breaks = 100)
    })
}

shinyApp(ui = ui, server = server)
