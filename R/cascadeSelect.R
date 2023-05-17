#' @title Create an icon
#' @description Create an icon with a given color and a given size.
#'
#' @param icon the name (actually the class name) of the icon;
#'   \strong{PrimeIcons} are available, for example \code{"pi pi-youtube"} (see
#'   \href{https://primereact.org/icons/#list}{PrimeIcons}),
#'   \strong{fontawesome} icons are available, for example
#'   \code{"fa fa-paper-plane"}, and \strong{Bootstrap icons} are available,
#'   for example \code{"bi bi-apple"} (see
#'   \href{https://icons.getbootstrap.com/}{Bootstrap icons})
#' @param color a CSS color, e.g. \code{"crimson"} or a hex code like
#'   \code{"#ffaa07"}
#' @param size size of the icon, a css measurement (e.g.
#'   \code{1rem}, \code{11px})
#'
#' @return A list to be included in the fields \code{icon} of the \code{choices}
#'   list of \code{\link{cascadeSelectInput}}.
#' @export
#' @importFrom htmltools validateCssUnit
Icon <- function(icon = "pi pi-circle-fill", color = "red", size = "1.5rem") {
  list(
    "icon"  = icon,
    "color" = validateColor(color),
    "size"  = validateCssUnit(size))
}

#' @title Cascade select input
#' @description Create a cascade select input for Shiny.
#'
#' @param inputId the id that will be used to get the selected value in Shiny
#' @param choices a hierarchical list (see the example); each item is given by
#'   a list with \emph{must} contain an \code{icon} field created with the
#'   \code{\link{Icon}} function
#' @param selected the selected value; \code{NULL} for none
#' @param placeholder placeholder appearing when no selected value
#' @param optionLabel the label of the options to be selected
#' @param optionGroupLabel the label of the groups of options; there can be
#'   several groups and they must have the same label
#' @param optionGroupChildren a list of the names of the groups of options
#' @param theme the CSS theme; see \code{data(themes)} for the list of
#'   available themes
#'
#' @return A \code{shiny.tag.list} object to be included in a Shiny UI.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#' @importFrom fontawesome fa_html_dependency
#'
#' @export
#' @examples
#' library(shiny)
#' library(cascadeSelect)
#'
#' ## | the hierarchical list of choices
#' folders <- list(
#'   list( # first folder
#'     name = "bootstrap", icon = Icon("bi bi-bootstrap", color = "purple"),
#'     subfolders = list(
#'       list( # subfolder of the first folder
#'         name = "css", icon = Icon("bi bi-folder-fill", color = "orange"),
#'         files = list(
#'           list(
#'             fname = "bootstrap-theme.css", size = "25 KB",
#'             icon = Icon("bi bi-filetype-css", color = "steelblue")
#'           ),
#'           list(
#'             fname = "bootstrap.css", size = "142 KB",
#'             icon = Icon("bi bi-filetype-css", color = "steelblue")
#'           )
#'         )
#'       ),
#'       list( # subfolder of the first folder
#'         name = "js", icon = Icon("bi bi-folder-fill", color = "orange"),
#'         files = list(
#'           list(
#'             fname = "bootstrap.js", size = "74 KB",
#'             icon = Icon("bi bi-filetype-js", color = "yellow")
#'           ),
#'           list(
#'             fname = "npm.js", size = "484 B",
#'             icon = Icon("bi bi-filetype-js", color = "yellow")
#'           )
#'         )
#'       )
#'     )
#'   ),
#'   list( # second folder
#'     name = "datatables", icon = Icon("bi bi-table", color = "purple"),
#'     subfolders = list(
#'       list( # subfolder of the second folder
#'         name = "css", icon = Icon("bi bi-folder-fill", color = "orange"),
#'         files = list(
#'           list(
#'             fname = "dataTables.bootstrap.css", size = "7.5 KB",
#'             icon = Icon("bi bi-filetype-css", color = "steelblue")
#'           ),
#'           list(
#'             fname = "dataTables.extra.css", size = "1.2 KB",
#'             icon = Icon("bi bi-filetype-css", color = "steelblue")
#'           )
#'         )
#'       ),
#'       list( # subfolder of the second folder
#'         name = "js", icon = Icon("bi bi-folder-fill", color = "orange"),
#'         files = list(
#'           list(
#'             fname = "dataTables.bootstrap.js", size = "4.2 KB",
#'             icon = Icon("bi bi-filetype-js", color = "yellow")
#'           ),
#'           list(
#'             fname = "jquerydataTable.min.js", size = "77.1 KB",
#'             icon = Icon("bi bi-filetype-js", color = "yellow")
#'           )
#'         )
#'       )
#'     )
#'   )
#' )
#'
#' ## | the Shiny app
#' ui <- fluidPage(
#'   titlePanel("Cascade Select"),
#'   fluidRow(
#'     column(
#'       6,
#'       cascadeSelectInput(
#'         "cascade",
#'         choices = folders,
#'         placeholder = "Select a file",
#'         optionLabel = "fname",
#'         optionGroupLabel = "name",
#'         optionGroupChildren = list("subfolders", "files"),
#'         theme = "mdc-dark-deeppurple"
#'       ),
#'       br(),br(),
#'       uiOutput("textOutput")
#'     )
#'   )
#' )
#'
#' server <- function(input, output, session) {
#'   output[["textOutput"]] <- renderUI({
#'     choice <- req(input[["cascade"]])
#'     tagList(
#'       tags$h4("You selected the file: ", sQuote(choice[["fname"]]), "."),
#'       tags$h4("Its size is: " , choice[["size"]], ".")
#'     )
#'   })
#' }
#'
#' if(interactive()) {
#'   shinyApp(ui, server)
#' }
cascadeSelectInput <- function(
    inputId, choices, selected = NULL, placeholder = "Select",
    optionLabel, optionGroupLabel, optionGroupChildren,
    theme = "bootstrap4-dark-purple"
) {
  createReactShinyInput(
    inputId = inputId,
    class = "cascadeSelect",
    dependencies = list(
      htmlDependency(
        name = "cascadeSelect-input",
        version = "1.0.0",
        src = "www/cS",
        package = "cascadeSelect",
        script = "cascadeSelect.js",
        stylesheet = c(
          "primeicons.css",
          "bootstrap-icons/font/bootstrap-icons.min.css",
          sprintf("t/%s/theme.css", theme)
        )
      ),
      fa_html_dependency()
    ),
    default = selected,
    configuration = list(
      "data" = choices,
      "placeholder" = placeholder,
      "optionLabel" = optionLabel,
      "optionGroupLabel" = optionGroupLabel,
      "optionGroupChildren" = optionGroupChildren
    ),
    container = tags$div
  )
}

# updateCascadeSelectInput <- function(session, inputId, value, configuration = NULL) {
#   message <- list(value = value)
#   if (!is.null(configuration)) message$configuration <- configuration
#   session$sendInputMessage(inputId, message);
# }
