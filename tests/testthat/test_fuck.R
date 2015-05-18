context("fuck function")

test_that("fuck can load a misspelled library", {
  err = try(library(ggplot), silent = TRUE)
  expect_message(fuck(err[[1]]), "are loaded now.")
})

test_that("fuck can download a missing library", {
  the.package = "waffle"
  if (the.package %in% installed.packages()[,"Package"])
    remove.packages(the.package)
  err = try(library(the.package, character.only = TRUE), silent = TRUE)
  expect_message(fuck(err[[1]]), "will be installed from")
})

test_that("fuck can download a misspelled package", {
  the.package = "waffles"
  the.real.package = "waffle"
  if (the.real.package %in% installed.packages()[,"Package"])
    remove.packages(the.real.package)
  err = try(library(the.package, character.only = TRUE), silent = TRUE)
  expect_message(fuck(err[[1]], TRUE), "The closest mathches are")
})