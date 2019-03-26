# Error handler
# error_detector: function(error)
#   returns: detection (any value different from NULL)
#   If error_detector returns NULL it means that this error handler cannot deal with this error
# error_solver: function(detection)
#   Gets the detection from the error_detector and can do anything
#' @include zzz.r
makeErrorHandler = function(name, error_detector, error_solver) {
  error_handler = list(name = name, error_detector = error_detector, error_solver = error_solver)
  thefu$error_handler[[name]] = error_handler
  invisible(error_handler)
}