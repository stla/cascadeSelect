library(shiny)
library(cascadeSelect)

ui <- fluidPage(
  titlePanel("My Haskell project"),
  fluidRow(
    column(
      6,
      cascadeSelectInput(
        "cascade",
        choices = folderHaskell,
        placeholder = "Select a file",
        optionLabel = "fname",
        optionGroupLabel = "name",
        optionGroupChildren = list("sub", "subsub"),
        theme = "luna-amber"
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
      "You selected the file: %s.", choice[["fname"]]
    )
  })
}

shinyApp(ui, server)
