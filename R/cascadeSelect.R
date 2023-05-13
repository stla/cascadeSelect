#' Add Title
#'
#' Add Description
#'
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
cascadeSelectInput <- function(inputId, choices, selected = NULL) {
  reactR::createReactShinyInput(
    inputId = inputId,
    class = "cascadeSelect",
    dependencies = htmltools::htmlDependency(
      name = "cascadeSelect-input",
      version = "1.0.0",
      src = "www/cascadeSelect/cascadeSelect",
      package = "cascadeSelect",
      script = "cascadeSelect.js"
    ),
    default = selected,
    configuration = list(data = choices),
    container = htmltools::tags$div
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
