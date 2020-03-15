
infile=read.csv("mushrooms.csv")

library(caTools)
s1=sample.split(infile$type ,SplitRatio = 0.7)

train=infile[s1==T,]
test=infile[s1==F,]

library(e1071)
model=naiveBayes(type ~.,data=train)

predTrain=predict(model,train)
tt=table(train$type,predTrain)

sum(diag(tt))/sum(tt)

predTest=predict(model,test)
tt=table(test$type,predTest)

sum(diag(tt))/sum(tt)
 
