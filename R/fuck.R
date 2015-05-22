#' Might correct you, when you fucked up.
#' @param error [\code{character(1)}]\cr
#'   \code{fuck()} will automatically use the last error message but you can also provide your own. 
#' @export
fuck = function(error = NULL, confirm = FALSE){
  if (is.null(error))
    error = geterrmessage()
  assertString(error)
  # Loading Packages #
  if (!is.na(the.library <- getErrorLibrary(error))) {
    available.packages = available.packages(filters = "R_version")
    installed.packages = installed.packages()
    if (the.library %in% available.packages[,1]) {
      BBmisc::messagef("The package %s will be installed from %s and loaded.", the.library, paste(getOption("repos")))
      installAndLoadPackages(the.library)
    } else if (length(match <- agrep(the.library, installed.packages[,"Package"]))) {
      BBmisc::messagef("The package(s) %s are the closest matches to %s and are loaded now.", paste(installed.packages[match,"Package"], collapse = ", "), the.library)
      installAndLoadPackages(installed.packages[match,"Package"], install = FALSE)
    } else if (length(matches <- agrep(pattern = the.library, available.packages[,"Package"]))) {
      matches = as.data.frame(available.packages)[matches,]
      BBmisc::messagef("The package %s is not available on %s. The closest mathches are [%s]?", the.library, paste(getOption("repos")), paste(matches$Package, matches$Version, sep = " ", collapse = "; "))
      if (confirm || readConfirm("Do you whish to install all of them (Y,n)?")) {
        installAndLoadPackages(matches$Package)
      }
    }
  }
  # mlr treatment #
  if (!is.na(the.library <- getErrorMlrLibrary(error))) {
    BBmisc::messagef("The package %s will be installed from %s and loaded.", the.library, paste(getOption("repos")))
    install.packages(pkgs = matches$Package)
  }
  # Finding Objects #
  if (!is.na(missing.object <- stringr::str_extract(error, "(?<=Error: object ').*(?=' not found)"))){
    objects = ls()
    if (length(match <- agrep(missing.object, objects))) {
      BBmisc::messagef("Maybe you meant: %s", paste(objects[match], collapse = ", "))
    }
  }
}