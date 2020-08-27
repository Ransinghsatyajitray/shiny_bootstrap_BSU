# An observe expression is triggered every time one of its inputs changes. The major difference with regards to a 
# reactive expression is that it yields no output, and it should only be used for its side effects (such as 
# modifying a reactiveValues object, or triggering a pop-up).



# They are pop up messages which get activated when one or more event run

library(shiny)

ui <- fluidPage(
    headerPanel("Example observe"),
    
    mainPanel(
        
        # action buttons
        actionButton("button1","Button 1"),
        actionButton("button2","Button 2")
    )
)

server <- function(input, output) {
    
    # observe button 1 press.
    observe({
        input$button1
        input$button2  
        showModal(modalDialog(
            title = "Button pressed",
            "You pressed one of the buttons!"
        ))
    })
}

shinyApp(ui = ui, server = server)