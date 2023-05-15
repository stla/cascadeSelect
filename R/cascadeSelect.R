#' @title Create an icon
#' @description Create an icon with a given color and a given size.
#'
#' @param icon the name (actually the class name) of the icon;
#'   \strong{PrimeIcons} are available, for example \code{"pi pi-youtube"} (see
#'   \href{https://primereact.org/icons/#list}{PrimeIcons}) and
#'   \strong{fontawesome} icons are available, for example
#'   \code{"fa fa-paper-plane"}
#' @param color a CSS color
#' @param size size of the icon, a css measurement
#'
#' @return A list to be included in the field \code{icon} of the \code{choices}
#'   list of \code{\link{cascadeSelectInput}}.
#' @export
#' @importFrom htmltools validateCssUnit
Icon <- function(icon = "pi pi-circle-fill", color = "red", size = "1rem") {
  list(
    "icon"  = icon,
    "color" = validateColor(color),
    "size"  = validateCssUnit(size))
}

#' @title Cascade select input
#' @description Create a cascade select input for Shiny.
#'
#' @param inputId the id that will be used to get the selected value in Shiny
#' @param choices a hierarchical list; see the examples
#' @param selected the selected value; \code{NULL} for none
#' @param placeholder placeholder appearing when no selected value
#' @param optionLabel the label of the options to be selected
#' @param optionGroupLabel the label of the groups of options
#' @param optionGroupChildren a list of the names of the groups of options
#'
#' @return A \code{shiny.tag.list} object to be included in a Shiny UI.
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#' @importFrom fontawesome fa_html_dependency
#'
#' @export
cascadeSelectInput <- function(
    inputId, choices, selected = NULL, placeholder = "Select",
    optionLabel, optionGroupLabel, optionGroupChildren
) {
  createReactShinyInput(
    inputId = inputId,
    class = "cascadeSelect",
    dependencies = list(
      htmlDependency(
        name = "cascadeSelect-input",
        version = "1.0.0",
        src = "www/cascadeSelect/cascadeSelect",
        package = "cascadeSelect",
        script = "cascadeSelect.js",
        stylesheet = "primeicons.css"
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

#' Add Title
#'
#' Add Description
#'
#' @export
updateCascadeSelectInput <- function(session, inputId, value, configuration = NULL) {
  message <- list(value = value)
  if (!is.null(configuration)) message$configuration <- configuration
  session$sendInputMessage(inputId, message);
}
