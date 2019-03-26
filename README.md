
# thefu

Handy corrections for when you fucked up. Inspired by
[nvbn/thefuck](https://github.com/nvbn/thefuck).

## Install

``` r
devtools::install_github("jakob-r/thefu")
```

And totally recommended: Run in command line or edit with your favourite
text editor:

    vi ~/.Rprofile

Change the `.Rprofile` so that it has the following lines somewhere.

    .First = function() {
      if (interactive()) {
        library("thefu")
      }
    }

## Usage

You misspelled an installed
    package?

``` r
library(e1061)
```

    ## Error in library(e1061): there is no package called 'e1061'

``` r
fu()
```

    ## The package(s) e1071 are the closest matches to e1061 and are loaded now.

Thought you already have the package
    installed?

``` r
library(purrr)
```

    ## Error in library(purrr): there is no package called 'purrr'

``` r
fu()
```

    ## The package purrr will be installed from https://cran.rstudio.com/ and loaded.

    ## Installing package into '/home/richter/.R/library'
    ## (as 'lib' is unspecified)

That package you don’t know if you have it installed or how it is called
exactly?

``` r
library(randomserch)
```

    ## Error in library(randomserch): there is no package called 'randomserch'

``` r
fu(confirm = TRUE)
```

    ## The package randomserch is not available on https://cran.rstudio.com/. The closest mathches are [randomsearch 0.2.0]?

    ## Installing package into '/home/richter/.R/library'
    ## (as 'lib' is unspecified)

    ## Loading required package: ParamHelpers

    ## Loading required package: smoof

    ## Loading required package: BBmisc

    ## 
    ## Attaching package: 'BBmisc'

    ## The following object is masked from 'package:base':
    ## 
    ##     isFALSE
