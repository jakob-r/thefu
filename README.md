

# thefu
Handy corrections for when you fucked up.
Inspired by [nvbn/thefuck](https://github.com/nvbn/thefuck).

## Install

```r
devtools::install_github("jakob-r/thefuckr")
```
And totally recommended:
Run in command line or edit with your favourite text editor:
```
vi ~/.Rprofile
```
Change the `.Rprofile` so that it has the following lines somewhere.
```
.First = function() {
  if (interactive()) {
    library("thefuckr")
  }
}
```

## Usage



```r
library(thefu)
# misspelled an installed package?
library(e1061)
```

```
## Error in library(e1061): there is no package called 'e1061'
```

```r
fuck()
```

```
## The package(s) e1071 are the closest matches to e1061 and are loaded now.
```

```r
# thought you already have the package installed?
library(plyr)
```

```
## Error in library(plyr): there is no package called 'plyr'
```

```r
fuck()
```

```
## The package plyr will be installed from http://cran.uni-muenster.de and loaded.
## Installing package into '/home/richter/R/x86_64-pc-linux-gnu-library/3.1'
## (as 'lib' is unspecified)
```

```
## 
## The downloaded source packages are in
## 	'/tmp/RtmptLbFD9/downloaded_packages'
```

```r
# That package you don't know if you have it installed or how it is called exactly?
library(xtables)
```

```
## Error in library(xtables): there is no package called 'xtables'
```

```r
fuck(confirm = TRUE)
```

```
## The package(s) tables are the closest matches to xtables and are loaded now.
## Loading required package: Hmisc
## Loading required package: grid
## 
## Attaching package: 'grid'
## 
## The following object is masked from 'package:BBmisc':
## 
##     explode
## 
## Loading required package: lattice
## Loading required package: survival
## Loading required package: splines
## Loading required package: Formula
## Loading required package: ggplot2
## 
## Attaching package: 'Hmisc'
## 
## The following objects are masked from 'package:plyr':
## 
##     is.discrete, summarize
## 
## The following object is masked from 'package:e1071':
## 
##     impute
## 
## The following object is masked from 'package:BBmisc':
## 
##     %nin%
## 
## The following objects are masked from 'package:base':
## 
##     format.pval, round.POSIXt, trunc.POSIXt, units
```
