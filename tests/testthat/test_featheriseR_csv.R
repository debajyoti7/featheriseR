library(featheriseR)
context("Sanctity")

test_that("number of records in input and output data is same", {
  expect_equal(dim(featheriseR_csv(system.file("examples", "applicants1.csv",
                                           package = "featheriseR"))),
               dim(read.csv(system.file("examples", "applicants1.csv",
                                        package = "featheriseR"))))

})
