#' A featheriseR Function
#'
#' This function allows you to convert a csv file to feather format.
#' @param ip input file
#' @keywords feather, csv
#' @export
#' @return Outputs a feather file to the same path as input
#' @examples featheriseR_csv(system.file("examples", "applicants.csv", package = "featheriseR"))

featheriseR_csv <- function(ip){

  list.of.packages <- c("feather","magrittr", "tools")
  new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
  if(length(new.packages)) install.packages(new.packages)
  if(length(new.packages)) devtools::use_package(new.packages)

  lapply(list.of.packages, require, character.only = TRUE)

  #if(!library(feather)){devtools::use_package("feather")}
  #if(!(library(magrittr))){devtools::use_package("magrittr")}

  if(! file_ext(ip)=="csv" ){
    stop("Invalid input type. Please provide a csv.")
  }

  op <- gsub(".csv", "", ip) %>%
    paste0(".feather")

  read.csv(file=ip, header=TRUE, sep=",") %>%
    as.data.frame() %>%
    write_feather(op)
}
