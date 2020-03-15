infile=read.csv("train.csv")
str(infile)
summary(infile$Age)

infile$Age[is.na(infile$Age) ] = 28
infile$AgeCategory=cut(infile$Age,c(0,5,10,15,20,40,50,60,90))
head(infile$Age)
prop.table(table(infile$AgeCategory,infile$Survived),1)

summary(infile$Age)
library(caTools)
library(rpart)
library(rpart.plot)

set.seed(1234)
s1 = sample.split(infile$Survived,SplitRatio = 0.7)

train = infile[s1 ==TRUE,]
test = infile[s1==FALSE,]
dtmod = rpart(Survived  ~ Sex + Pclass  + AgeCategory + Embarked ,data = train,method = 'class')#rpart is a function used to create a model in Decision tree
prp(dtmod)   


####unit test
predTrain = predict(dtmod,type='class',newdata = train)
tt=table(train$Survived,predTrain)

sum(diag(tt))/sum(tt)#calculating the percentage
#######UAT
predTest = predict(dtmod,type='class',newdata = test)
ttt=table(test$Survived,predTest)

sum(diag(ttt))/sum(ttt)

