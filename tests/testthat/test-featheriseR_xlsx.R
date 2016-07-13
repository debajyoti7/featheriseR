library(featheriseR)
library(xlsx)
context("Sanctity")

test_that("number of records in input and output data is same", {
  expect_equal(dim(featheriseR_xlsx(system.file("examples", "applicants.xlsx",
                                           package = "featheriseR"),
                                    sheet.name = 'applicants')),
               dim(read.xlsx(system.file("examples", "applicants.xlsx",
                                        package = "featheriseR"),
                             sheetName = 'applicants')))

})
