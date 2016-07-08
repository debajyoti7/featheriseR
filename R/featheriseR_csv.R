#' A featheriseR Function
#'
#' This function allows you to convert files to feather format.
#' @param input file, csv with headers.
#' @keywords feather
#' @export
#' @examples
#' featheriseR_function()

featheriseR_csv <- function(ip){

  list.of.packages <- c("feather","magrittr")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  if(length(new.packages)) devtools::use_package(new.packages)

  lapply(x, require, character.only = TRUE)

  #if(!library(feather)){devtools::use_package("feather")}
  #if(!(library(magrittr))){devtools::use_package("magrittr")}

  op <- gsub(".csv", "", ip) %>%
    paste0(".feather")

  read.csv(file=ip, header=TRUE, sep=",") %>%
    as.data.frame() %>%
    write_feather(op)
}
