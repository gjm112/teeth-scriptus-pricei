library(jpeg)
library(tidyverse)
library(dplyr)
library(Momocs)
library(fdasrvf)

#path <- "/Users/gregorymatthews/Dropbox/gladysvale/images_20210622/Extant"
path <- "/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei/data/pricei_bw/images/Fossil/Tragelaphini/Tragelaphus/pricei/LM1/bw"
file_list_BW_extant <- list.files(path, recursive = TRUE, full.names = TRUE)


#Import the BW image files.
start <- Sys.time()
import_BW <- function(x){import_jpg(x)[[1]]}
teeth_BW_train <- lapply(as.list(file_list_BW_extant), import_BW)
names(teeth_BW_train) <- substring(file_list_BW_extant, unlist(gregexpr( "JPG",file_list_BW_extant)) - 9, unlist(gregexpr( "JPG",file_list_BW_extant)) - 2)
end <- Sys.time()
end - start

