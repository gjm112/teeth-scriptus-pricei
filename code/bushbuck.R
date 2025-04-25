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



#####Compute distances in matlab with bushbuck.m script
set.seed(20240521)
load("./data/teethdata_scriptus_pricei.RData")

for (toothtype in c("LM3")){print(toothtype)
  
  n_scriptus <- length(data[[toothtype]][["scriptus"]])
  n_pricei <- length(data[[toothtype]][["pricei"]])
  
  class <- c(rep("scriptus",n_scriptus),rep("pricei",n_pricei))
  id <- c(names(data[[toothtype]][["scriptus"]]),names(data[[toothtype]][["pricei"]]),"SK4261","UW88519a")
  
  #Run this script first in matlab: bushbuck.m
  #Pariwise distances
  #First rows are scriptus and last rows are pricei
  #Row 67 is SK4261
  #Row 68 is UW 885-19a
  ddd <- read.csv(paste0("./data/matlab/pairwise_distances_bushbuck.csv"), header = FALSE)
  ddd <- as.matrix(ddd)
  ddd[67:68, ]
  image(ddd)
  
  
  mdsdat <- data.frame(x = cmdscale(ddd)[,1], 
                       y = cmdscale(ddd)[,2],
                       species = c(class,"SK4261","UW88519a"), 
                       id = id)
library(ggrepel)                       
  ggplot(aes(x = x, y = y, col = species), data = mdsdat) + geom_point(size = 0.5) + theme_bw() + geom_text_repel(label = id, size = 2, nudge_x = 0.02)
  
  
  
  
#####Compute distances for partial shapes.  
  


