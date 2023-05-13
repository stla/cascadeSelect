library(shiny)
library(cascadeSelect)

ui <- basicPage(
  titlePanel("reactR Input Example"),
  cascadeSelectInput("textInput", choices = countries),
  br(),br(),
  textOutput("textOutput")
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })

  observe(print(input$textInput))
}

shinyApp(ui, server)
