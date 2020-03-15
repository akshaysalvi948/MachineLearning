infile=read.csv("wine.data.csv",header = F)
str(infile)

scaled_infile=scale(infile[,2:14])
pcmod=prcomp(scaled_infile)
summary(pcmod)

pcmod$rotation[,1:5]
dtmod=rpart(V1~V7+V8+V9+V10+V12+V13+V14
            #+V2+V4+V6+V10+V11+V12+V14
            #+V4+V5
            #+V3+V9+V10+V12+V14
            #+V2+V6+V9
            ,data = infile,method = "class")

tt=table(infile$V1,(predict(dtmod,type = "class")))
ttt=sum(diag(tt))/sum(tt)
ttt
#############################Run PCA###########
#identify the variable

library(caTools)
s1 = sample.split(scaled_infile,SplitRatio = 0.7)

traindf =scaled_infile [ s1 == T , ]
testdf = scaled_infile[ s1 == F , ]
traindf

