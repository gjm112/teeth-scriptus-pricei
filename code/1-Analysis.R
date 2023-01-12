#Scriptus is the first n rows, pricei is the last some rows. 
length(data[["LM1"]][["scriptus"]])
length(data[["LM1"]][["pricei"]])

PC_LM1_combined <- read.csv("./data/matlab/PC_feat_LM1_combined.csv", header = FALSE)

library(Hotelling)
PC_LM1_combined$g <- c(rep(1,length(data[["LM1"]][["scriptus"]])),
                           rep(2,length(data[["LM1"]][["pricei"]])))


results <-  hotelling.test(.~g, data = PC_LM1_combined, shrinkage = TRUE)
