context("fu function")

test_that("fu can load a misspelled library", {
  err = try(library(checkmade), silent = TRUE)
  expect_message(fu(err[[1]]), "are loaded now.")
})

test_that("fu can download a missing library", {
  the.package = "randomsearch"
  if (the.package %in% installed.packages()[,"Package"])
    remove.packages(the.package)
  err = try(library(the.package, character.only = TRUE), silent = TRUE)
  expect_message(fu(err[[1]]), "will be installed from")
})

test_that("fu can download a misspelled package", {
  the.package = "randomseach"
  the.real.package = "randomsearch"
  if (the.real.package %in% installed.packages()[,"Package"])
    remove.packages(the.real.package)
  err = try(library(the.package, character.only = TRUE), silent = TRUE)
  expect_message(fu(err[[1]], TRUE), "The closest mathches are")
})

test_that("fu can find misspelled function", {
  err = try(meann(1:10), silent = TRUE)
  expect_message(fu(err[[1]]), "Maybe you meant:")
})

test_that("fu can find misspelled objects", {
  foobar = 1
  err = try(fobar + 1, silent = TRUE)
  expect_message(fu(err[[1]]), "Maybe you meant:")
})