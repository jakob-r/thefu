#' @include ErrorHandler.R
makeErrorHandler(
  name = "ErrorHandlerMlrLibrary",
  error_detector = function(error) {
    stringi::stri_extract_first_regex(error, "(?<=please install the following packages: ).*")
  },
  error_solver = function(detection, confirm) {
    the_library = detection
    message(sprintf("The package %s will be installed from %s and loaded.", the_library, paste(getOption("repos"))))
    install.packages(pkgs = matches$Package)
  }
)