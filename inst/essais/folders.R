library(cascadeSelect)

folder <- list(
  list(
    name = "bootstrap", icon = Icon("bi bi-bootstrap", color = "purple"),
    subfolders = list(
      list(
        name = "css", icon = Icon("bi bi-folder-fill", color = "orange"),
        files = list(
          list(
            fname = "bootstrap-theme.css", size = "25 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          ),
          list(
            fname = "bootstrap.css", code = "142 KB",
            icon = Icon("bi bi-filetype-css", color = "steelblue")
          )
        )
      ),
      list(
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
  list(
    name = "datatables", icon = Icon("bi bi-table", color = "purple"),
    subfolders = list(
      list(
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
      list(
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
  )
)
