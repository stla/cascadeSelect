library(shiny)
library(cascadeSelect)

ui <- fluidPage(
  titlePanel("Cascade Select"),
  fluidRow(
    column(
      6,
      cascadeSelectInput(
        "cascade",
        choices = folder,
        placeholder = "Select a file",
        optionLabel = "fname",
        optionGroupLabel = "name",
        optionGroupChildren = list("subfolders", "files"), # (sub, subsub)
        theme = "lara-dark-blue"
      ),
      br(),br(),
      textOutput("textOutput")
    )
  )
)

server <- function(input, output, session) {
  output[["textOutput"]] <- renderText({
    choice <- input[["cascade"]]
    sprintf(
      "You selected the file: %s.\nIts size is: %s.",
      choice[["fname"]], choice[["size"]]
    )
  })
}

shinyApp(ui, server)
