#' Might correct you, when you fucked up.
#' @param error [\code{character(1)}]\cr
#'   \code{fuck()} will automatically use the last error message but you can also provide your own. 
#' @param confirm [\code{logical(1)}]\cr
#'   Should this problem be solved without further confirmation?
#' @export
fu = function(error = geterrmessage(), confirm = FALSE){
  assert_string(error)
  assert_flag(confirm)

  for (error_handler in thefu$error_handler) {
    detection = error_handler$error_detector(error)
    if (!is.null(detection) && !is.na(detection)) {
      error_handler$error_solver(detection, confirm)
      break
    }
  }
}