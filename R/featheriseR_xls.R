#' A featheriseR Function
#'
#' This function allows you to convert an xls file to feather format.
#' @param ip input file, xls with headers.
#' @param sheet.name input sheet name.
#' @keywords feather, xls
#' @importFrom feather write_feather
#' @importFrom magrittr %>%
#' @importFrom tools file_ext
#' @importFrom xlsx read.xlsx
#' @export
#' @return Outputs a feather file to the same path as input
#' @examples featheriseR_xls(system.file("examples", "applicants2.xls", package = "featheriseR"))


featheriseR_xls <- function(ip,sheet.name){

  list.of.packages <- c("feather","magrittr","xlsx", "tools")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  if(length(new.packages)) devtools::use_package(new.packages)

  lapply(list.of.packages, require, character.only = TRUE)

  if(! file_ext(ip)=="xls" ){
    stop("Invalid input type. Please provide a xls.")
  }

  op <- gsub(".xls", "", ip) %>%
    paste0(".feather")

  read.xlsx(file=ip, sheetName = sheet.name, header=TRUE) %>%
    as.data.frame() %>%
    write_feather(op)
}
