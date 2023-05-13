library(shiny)
library(cascadeSelect)

ui <- fluidPage(
  titlePanel("Cascade Select"),
  fluidRow(
    column(
      6,
      cascadeSelectInput("textInput", choices = countries),
      br(),br(),
      textOutput("textOutput")
    )
  )
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })

  observe(print(input$textInput))
}

shinyApp(ui, server)
