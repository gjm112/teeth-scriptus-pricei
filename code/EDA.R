library(jpeg)
library(tidyverse)
library(dplyr)
library(Momocs)
library(fdasrvf)

#path <- "/Users/gregorymatthews/Dropbox/gladysvale/images_20210622/Extant"
path <- "/Users/gregorymatthews/Dropbox/teeth-scriptus-pricei/data/pricei_bw/images/"
file_list_BW_extant <- list.files(path, recursive = TRUE, full.names = TRUE)



remove <- c(grep("DSCN2815.JPG",file_list_BW_extant), grep("DSCN2831.JPG",file_list_BW_extant), grep("DSCN4754.JPG",file_list_BW_extant))
file_list_BW_extant <- file_list_BW_extant[-remove]

#Import the BW image files.
start <- Sys.time()
import_BW <- function(x){import_jpg(x)[[1]]}
teeth_BW_train <- lapply(as.list(file_list_BW_extant), import_BW)
names(teeth_BW_train) <- substring(file_list_BW_extant, unlist(gregexpr( "JPG",file_list_BW_extant)) - 9, unlist(gregexpr( "JPG",file_list_BW_extant)) - 2)
end <- Sys.time()
end - start

