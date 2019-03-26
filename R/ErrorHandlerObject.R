#' @include ErrorHandler.R
makeErrorHandler(
  name = "ErrorHandlerObject",
  error_detector = function(error) {
    stringi::stri_extract_first_regex(error, "(?<=object ').*(?=' not found)")
  },
  error_solver = function(detection, confirm) {
    objects = ls(envir = .GlobalEnv)
    if (length(match <- agrep(detection, objects)) > 0) {
      message(sprintf("Maybe you meant: %s", paste(objects[match], collapse = ", ")))
    }
  }
)