#' @include ErrorHandler.r
makeErrorHandler(
  name = "ErrorHandlerFunction",
  error_detector = function(error) {
    stringi::stri_extract_first_regex(error, "(?<=could not find function \").*(?=\")")
  },
  error_solver = function(detection, confirm) {
    missing_object = detection
    objects = ls()
    if (length(match <- agrep(missing_object, objects))) {
      message(sprintf("Maybe you meant: %s", paste(objects[match], collapse = ", ")))
    }
  }
)