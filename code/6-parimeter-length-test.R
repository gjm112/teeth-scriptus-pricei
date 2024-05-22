load("./data/teethdata_scriptus_pricei.RData")

data.frame()

pieces <- c()
for (i in 1:499){
pieces[i] <- sqrt(sum((data[["LM1"]][["scriptus"]][[1]][,i] - data[["LM1"]][["scriptus"]][[1]][,i+1])^2))
}

sum(pieces)
