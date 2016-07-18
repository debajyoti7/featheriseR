library(featheriseR)
context("Sanctity")

test_that("number of records in input and output data is same", {
  expect_equal(dim(featheriseR_csv(
    system.file("examples", "applicants1.csv",
                package = "featheriseR")
  )),
    dim(read.csv(
      system.file("examples", "applicants1.csv",
                  package = "featheriseR")
    )))


  expect_equal(colnames(featheriseR_csv(
    system.file("examples", "applicants1.csv",
                package = "featheriseR")
  )),
  colnames(read.csv(
    system.file("examples", "applicants1.csv",
                package = "featheriseR")
  )))

})

test_that("invalid inputs raises error",{

  expect_that(featheriseR_csv(system.file("examples", "applicants1.xls",
                package = "featheriseR")),
              throws_error())

  expect_that(featheriseR_csv(system.file("examples", "applicants1.xlsx",
                                          package = "featheriseR")),
              throws_error())

})
