#' Add Title
#'
#' Add Description
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
      data = choices,
      placeholder = placeholder,
      optionLabel = optionLabel,
      optionGroupLabel = optionGroupLabel,
      optionGroupChildren = optionGroupChildren
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
