

# thefu
Handy corrections for when you fucked up.
Inspired by [nvbn/thefuck](https://github.com/nvbn/thefuck).

## Install

```r
devtools::install_github("jakob-r/thefu")
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
    library("thefu")
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
fuck()
```

```
## The package(s) e1071 are the closest matches to e1061 and are loaded now.
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
```
