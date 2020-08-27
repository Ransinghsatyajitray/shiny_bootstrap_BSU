# An observeEvent object can be used to trigger a piece of code when a certain event occurs.
# The observeEvent will only be dependent on the 'event' section in the small piece of code above. 
# It will not be dependent on anything in the 'code to run' part.


# observeEvent( event {
#     code to run
# })




library(shiny)

ui <- fluidPage(
    headerPanel("Example observeEvent"),
    
    mainPanel(
        
        # action buttons
        actionButton("button1","Button 1"),
        actionButton("button2","Button 2")
    )
)

server <- function(input, output) {
    
    # observe button 1 press.
    observeEvent(input$button1, {
        # The observeEvent takes no dependency on button 2, even though we refer to the input in the following line.
        input$button2  
        showModal(modalDialog(
            title = "Button pressed",
            "You pressed one of the buttons!"
        ))
    })
}

shinyApp(ui = ui, server = server)