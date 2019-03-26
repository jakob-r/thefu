#' @include ErrorHandler.r
makeErrorHandler(
  name = "ErrorHandlerObject",
  error_detector = function(error) {
    stringi::stri_extract_first_regex(error, "(?<=Error: object ').*(?=' not found)")
  },
  error_solver = function(detection, confirm) {
    missing_object = detection
    objects = ls()
    if (length(match <- agrep(missing_object, objects))) {
      message(sprintf("Maybe you meant: %s", paste(objects[match], collapse = ", ")))
    }
  }
)