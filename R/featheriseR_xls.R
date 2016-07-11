#' A featheriseR Function
#'
#' This function allows you to convert files to feather format.
#' @param input file, xls with headers.
#' @param input sheet name.
#' @keywords feather, xls
#' @export
#' @examples
#' featheriseR_function()

featheriseR_xls <- function(ip,sheet.name){

  list.of.packages <- c("feather","magrittr","xlsx")
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