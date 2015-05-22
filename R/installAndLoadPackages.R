installAndLoadPackages = function(packages, install = TRUE, load = TRUE) {
  if (install) install.packages(pkgs = packages)
  if (load) invisible(lapply(packages, library, character.only = TRUE))
}