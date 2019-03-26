#' @include ErrorHandler.R
makeErrorHandler(
  name = "ErrorHandlerLibrary",
  error_detector = function(error) {
    res = stringi::stri_extract_first_regex(error, "(?<=there is no package called ).*")
    stri_extract_first_regex(res, "\\w+")
  },
  error_solver = function(detection, confirm) {
    the_library = detection
    available.packages = available.packages(filters = "R_version")
    installed.packages = installed.packages()
    if (the_library %in% available.packages[,1]) {
      message(sprintf("The package %s will be installed from %s and loaded.", the_library, paste(getOption("repos"))))
      installAndLoadPackages(the_library)
    } else if (length(match <- agrep(the_library, installed.packages[,"Package"]))) {
      message(sprintf("The package(s) %s are the closest matches to %s and are loaded now.", paste(installed.packages[match,"Package"], collapse = ", "), the_library))
      installAndLoadPackages(installed.packages[match,"Package"], install = FALSE)
    } else if (length(matches <- agrep(pattern = the_library, available.packages[,"Package"]))) {
      matches = as.data.frame(available.packages)[matches,]
      message(sprintf("The package %s is not available on %s. The closest mathches are [%s]?", the_library, paste(getOption("repos")), paste(matches$Package, matches$Version, sep = " ", collapse = "; ")))
      if (confirm || readConfirm("Do you whish to install all of them (Y,n)?")) {
        installAndLoadPackages(matches$Package)
      }
    }
  }
)