set.seed(20240521)
library(jpeg)
library(tidyverse)
library(dplyr)
library(Momocs)
library(fdasrvf)

path <- paste0("./data/bushbuck/")
file_list_BW_bushbuck <- list.files(path, recursive = TRUE, full.names = TRUE)

start <- Sys.time()
import_BW <- function(x){import_jpg(x)[[1]]}
teeth_BW_bushbuck <- lapply(as.list(file_list_BW_bushbuck), import_BW)
names(teeth_BW_bushbuck) <- unlist(lapply(strsplit(file_list_BW_bushbuck,"/"), function(x){x[[length(x)]]}))
names(teeth_BW_bushbuck) <- substring(names(teeth_BW_bushbuck),1,nchar(names(teeth_BW_bushbuck))-4)
end <- Sys.time()
end - start

save(teeth_BW_bushbuck, file = "./data/teeth_BW_bushbuck.RData")

#Export data to matlab

#Now do data prep for matlab
#Makes all the teeth have the same number of points
make_same_num_points <- function(x, N = 500){
  out <- resamplecurve(t(x),N)
  return(out)
}

#Make all teeth have 500 points
teeth_BW_bushbuck <- lapply(teeth_BW_bushbuck, make_same_num_points)
write.csv(do.call(rbind,teeth_BW_bushbuck),file = paste0("./data/matlab/data_bushbuck.csv"), row.names = FALSE)




