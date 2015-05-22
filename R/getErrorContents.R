getErrorLibrary = function(error) {
  res = stringr::str_extract(error, "(?<=there is no package called ).*")
  str_extract(res, "\\w+")
}

getErrorMlrLibrary = function(error) {
  stringr::str_extract(error, "(?<=please install the following packages: ).*")
}