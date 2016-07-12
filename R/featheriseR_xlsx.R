#' A featheriseR Function
#'
#' This function allows you to convert an xlsx file to feather format.
#' @param ip input file, xlsx with headers.
#' @param sheet.name input sheet name.
#' @keywords feather, xlsx
#' @export
#' @return Outputs a feather file to the same path as input
#' @examples featheriseR_xlsx(system.file("examples", "applicants.xlsx", package = "featheriseR"))


featheriseR_xlsx <- function(ip,sheet.name){

  list.of.packages <- c("feather","magrittr","xlsx")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  if(length(new.packages)) devtools::use_package(new.packages)

  lapply(list.of.packages, require, character.only = TRUE)

  if(! file_ext(ip)=="xlsx" ){
    stop("Invalid input type. Please provide a xlsx.")
  }


  op <- gsub(".xlsx", "", ip) %>%
    paste0(".feather")

  read.xlsx(file=ip, sheetName=sheet.name, header=TRUE) %>%
    as.data.frame() %>%
    write_feather(op)
}
