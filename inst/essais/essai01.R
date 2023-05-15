library(shiny)
library(cascadeSelect)
library(fontawesome)

ui <- fluidPage(
  titlePanel("Cascade Select"),
  fluidRow(
    column(
      6,
      cascadeSelectInput(
        "textInput",
        choices = folder,
        placeholder = "Select a file",
        optionLabel = "fname",
        optionGroupLabel = "name",
        optionGroupChildren = list("subfolders", "files"),
        theme = "mdc-dark-deeppurple"
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
