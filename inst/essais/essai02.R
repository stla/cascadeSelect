library(shiny)
library(cascadeSelect)

folderHaskell <- list(
  list( # first folder
    name = "findPatterInFiles", icon = Icon("bi bi-folder-fill", color = "orange"),
    sub = list(
      list( # subfolder of the first folder
        name = "src", icon = Icon("bi bi-folder-fill", color = "orange"),
        subsub = list(
          list( # file
            fname = "GetAhaHTML.hs", icon = Icon("oi oi-haskell")
          ),
          list( # file
            fname = "GetGrepResults.hs", icon = Icon("oi oi-haskell")
          )
        )
      ),
      list( # subfolder of the first folder
        name = "src-exe", icon = Icon("bi bi-folder-fill", color = "orange"),
        subsub = list(
          list( # file
            fname = "Main.hs", icon = Icon("oi oi-haskell")
          )
        )
      ),
      list( # file in the first folder
        fname = "findPatternInFiles.cabal", icon = Icon("oi oi-cabal")
      ),
      list( # file in the first folder
        fname = "LICENSE", icon = Icon("oi oi-license")
      ),
      list( # file in the first folder
        fname = "README.md", icon = Icon("oi oi-markdown")
      ),
      list( # file in the first folder
        fname = "Setup.hs", icon = Icon("oi oi-haskell")
      ),
      list( # file in the first folder
        fname = "stack.yaml", icon = Icon("oi oi-yaml")
      ),
      list( # file in the first folder
        fname = ".gitignore", icon = Icon("bi bi-git")
      )
    )
  )
)

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
      "You selected the file: %s.", dQuote(choice[["fname"]])
    )
  })
}

shinyApp(ui, server)
