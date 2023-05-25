library(cascadeSelect)

folder <- list(
  list( # first folder
    name = "bootstrap", icon = Icon("oi oi-markdown", color = "purple", scale=2),
    subfolders = list(
      list( # subfolder of the first folder
        name = "css", icon = Icon("oi oi-json", color = "orange"),
        files = list(
          list(
            fname = "bootstrap-theme.css", size = "25 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          ),
          list(
            fname = "bootstrap.css", size = "142 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          )
        )
      ),
      list( # subfolder of the first folder
        name = "js", icon = Icon("bi bi-folder-fill", color = "orange"),
        files = list(
          list(
            fname = "bootstrap.js", size = "74 KB",
            icon = Icon("bi bi-filetype-js", color = "yellow")
          ),
          list(
            fname = "npm.js", size = "484 B",
            icon = Icon("bi bi-filetype-js", color = "yellow")
          )
        )
      )
    )
  ),
  list( # second folder
    name = "datatables", icon = Icon("bi bi-table", color = "purple"),
    subfolders = list(
      list( # subfolder of the second folder
        name = "css", icon = Icon("bi bi-folder-fill", color = "orange"),
        files = list(
          list(
            fname = "dataTables.bootstrap.css", size = "7.5 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          ),
          list(
            fname = "dataTables.extra.css", size = "1.2 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          )
        )
      ),
      list( # subfolder of the second folder
        name = "js", icon = Icon("bi bi-folder-fill", color = "orange"),
        files = list(
          list(
            fname = "dataTables.bootstrap.js", size = "4.2 KB",
            icon = Icon("bi bi-filetype-js", color = "yellow")
          ),
          list(
            fname = "jquerydataTable.min.js", size = "77.1 KB",
            icon = Icon("bi bi-filetype-js", color = "yellow")
          )
        )
      )
    )
  ),
  list( # third folder
    name = "shiny_scss", icon = Icon("bi bi-folder-fill", color = "orange"),
    subfolders = list(
      list(
        fname = "bootstrap.scss", size = "2.7 KB",
        icon = Icon("bi bi-filetype-scss", color = "salmon")
      ),
      list(
        fname = "shiny.scss", size = "10.1 KB",
        icon = Icon("bi bi-filetype-scss", color = "salmon")
      )
    )
  )
)
