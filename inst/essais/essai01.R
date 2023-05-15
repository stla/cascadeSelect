library(shiny)
library(cascadeSelect)

ui <- fluidPage(
  #tags$head(tags$link(rel="stylesheet", href="https://unpkg.com/primeicons@6.0.1/primeicons.css")),
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
        optionGroupChildren = list("subfolders", "files")
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
