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

  expect_equal(colnames(featheriseR_xlsx(system.file("examples", "applicants.xlsx",
                                                package = "featheriseR"),
                                    sheet.name = 'applicants')),
               colnames(read.xlsx(system.file("examples", "applicants.xlsx",
                                         package = "featheriseR"),
                             sheetName = 'applicants')))

})


test_that("invalid inputs raises error",{

  expect_that(featheriseR_xlsx(system.file("examples", "applicants.csv",
                                           package = "featheriseR"),
                               sheet.name = 'applicants'),
              throws_error())

  expect_that(featheriseR_xlsx(system.file("examples", "applicants.xls",
                                           package = "featheriseR"),
                               sheet.name = 'applicants'),
              throws_error())

})
