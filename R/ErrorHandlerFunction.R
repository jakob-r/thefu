#' @include ErrorHandler.R
makeErrorHandler(
  name = "ErrorHandlerFunction",
  error_detector = function(error) {
    stringi::stri_extract_first_regex(error, "(?<=could not find function \").*(?=\")")
  },
  error_solver = function(detection, confirm) {
    objects = unlist(sapply(search()[-1],lsf.str))
    if (length(match <- agrep(detection, objects))) {
      message(sprintf("Maybe you meant: %s", paste(objects[match], collapse = ", ")))
    }
  }
)