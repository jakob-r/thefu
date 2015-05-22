context("getErrorContents function")

test_that("getError(Mlr)Library", {
  error = 'Error in library("bbad") : there is no package called ‘no1Mercy2’'
  expect_equal(getErrorLibrary(error), "no1Mercy2")
  error.none = "Nothing went bad"
  expect_true(is.na(getErrorLibrary(error.none)))
  error =  "Error in requirePackages(learner$package, why = paste(\"learner\", learner$id),  : \n  For learner classif.randomForest please install the following packages: randomForest\n"
  expect_equal(getErrorMlrLibrary(error), "randomForest")
  expect_true(is.na(getErrorMlrLibrary(error.none)))
})
