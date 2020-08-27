# isolate() is a function that does exactly what is expected; it isolates a piece of code. In a Shiny reactive context, this means that 
# it prevents the execution of a piece of code unless, of course, certain condition is met. 


library(shiny)


ui <- pageWithSidebar(
    headerPanel("Click the button"),
    sidebarPanel(
        sliderInput("obs", "Number of observations:",
                    min = 0, max = 1000, value = 500),
        actionButton("goButton", "Go!")
    ),
    mainPanel(
        plotOutput("distPlot")
    )
)


server <- function(input, output) {
    output$distPlot <- renderPlot({
        
        # Take a dependency on input$goButton
        input$goButton    # if only this condition is met then code inside isolate is run
        
        # Use isolate() to avoid dependency on input$obs
        dist <- isolate(rnorm(input$obs))
        hist(dist)
    })
}

shinyApp(ui = ui, server = server)