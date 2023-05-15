library(shiny)
library(cascadeSelect)

ui <- fluidPage(
  titlePanel("Cascade Select"),
  fluidRow(
    column(
      6,
      cascadeSelectInput(
        "textInput",
        choices = countries,
        placeholder = "Select a city",
        optionLabel = "cname",
        optionGroupLabel = "name",
        optionGroupChildren = list("states", "cities")
      ),
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
