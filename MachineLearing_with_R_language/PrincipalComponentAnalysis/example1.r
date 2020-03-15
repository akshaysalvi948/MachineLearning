
infile=read.csv("wdbc.csv",header = F)
str(infile)

scaled_data=scale(infile[,3:32])
pcamod=prcomp(scaled_data)

summary(pcamod)#80% we have to Stop thats why we stop at PC5
pcamod$rotation[,1:5]#PC are different angle to see 

library(rpart)
library(rpart.plot)

dtmod=rpart(V2 ~V9+V10+V30+V12+V22+V32+V31+V37+V21+V17+V15+V13,
            method = "class",data = infile)
prp(dtmod)
tt=table(infile$v2,predict(dtmod,type = "class"))