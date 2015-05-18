#' Might correct you, when you fucked up.
#' @export
fuck = function(){
  error = geterrmessage()
  # Loading Packages #
  if (length(str_subset(string = error, pattern = "there is no package called"))) {
    available.packages = available.packages(filters = "R_version")
    installed.packages = installed.packages()
    the.library = str_extract(error, "(?<=\\().*(?=\\))")
    if (length(match <- agrep(the.library, installed.packages[,"Package"]))) {
      catf("The package(s) %s are the closest matches to %s and are beeing loaded now.", paste(installed.packages[match,"Package"], collapse = ", "), the.library)
      invisible(lapply(installed.packages[match,"Package"], library, character.only = TRUE))
    } else if (the.library %in% available.packages[,1]) {
      install.packages(the.library)
      invlibrary(the.library)
    } else {
      matches = as.data.frame(available.packages[agrep(pattern = the.library, available.packages[,1]),])
      catf("The package %s is not available on %s. Do you whish to install the closest mathches [%s] (y/n)?", the.library, getOption("repos"))
      if (readConfirm())
        install.packages(matches$Package)
    }
  }
  # Finding Objects #
  if (!is.na(missing.object <- str_extract(error, "(?<=Error: object ').*(?=' not found)"))){
    objects = ls()
    if (length(match <- agrep(missing.object, objects))) {
      catf("Maybe you meant: %s", paste(objects[match], collapse = ", "))
    }
  }
}