load("./data/teethdata_scriptus_pricei.RData")

#Scriptus is the first n rows, pricei is the last some rows. 
length(data[["LM1"]][["scriptus"]])
length(data[["LM1"]][["pricei"]])

PC_LM1_combined <- read.csv("./data/matlab/PC_feat_UM3_combined.csv", header = FALSE)

library(Hotelling)
PC_LM1_combined$g <- c(rep(1,length(data[["LM1"]][["scriptus"]])),
                           rep(2,length(data[["LM1"]][["pricei"]])))

results <-  hotelling.test(.~g, data = PC_LM1_combined)
results$stats$statistic
results <-  hotelling.stat(PC_LM1_combined[PC_LM1_combined$g ==1,-11],PC_LM1_combined[PC_LM1_combined$g ==2,-11])


#Permutation
nsim <- 1000
null <- c()
for (i in 1:nsim){
temp <- PC_LM1_combined
temp$g <- sample(temp$g, length(temp$g),replace = FALSE)
null[i] <-  hotelling.test(.~g, data = temp)$stat$statistic
}










