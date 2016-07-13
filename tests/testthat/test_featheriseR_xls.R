library(featheriseR)
library(xlsx)
context("Sanctity")

test_that("number of records in input and output data is same", {
  expect_equal(dim(featheriseR_xls(system.file("examples", "applicants2.xls",
                                           package = "featheriseR"))),
               dim(read.xlsx(system.file("examples", "applicants2.xls",
                                        package = "featheriseR"))))

})
