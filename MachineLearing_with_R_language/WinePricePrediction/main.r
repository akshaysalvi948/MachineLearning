
infile=read.csv("wine.csv")
str(infile)
head(infile)
summary(infile$Price)

baseline_M=mean(infile$Price)
baseline_M

lm1=lm(Price ~ WinterRain + AGST + HarvestRain + FrancePop,data = infile)
summary(lm1)

test2 =data.frame("Year"=c(1952) ,"WinterRain"=c(650) ,"AGST"=c(18) ,"HarvestRain"=c(160), "Age"=c(31),FrancePop=c(50000))
predValM=predict(lmModel,newdata = test2)

lmModel=lm(Price ~  WinterRain + AGST + HarvestRain + FrancePop,data = infile)
summary(lmModel)

RMSE = sqrt(mean((infile$Price - lmModel)^2))

plot(lmModel$residuals)

RMSE = sqrt(mean((infile$Price - baseline_M)^2))
RMSE

set.seed(555)
rowidx=sample(22,7,replace = F)
#rowidx=sample(nrow(infile),7,replace = F)

train =infile[ rowidx ,]
test = infile[ -rowidx ,]

lm2=lm(Price ~ WinterRain + AGST + HarvestRain + FrancePop,data = infile)
predTrain = predict(lm2 ,newdata = train)

RMSE = sqrt(mean((train$Price - predTrain)^2))
RMSE

predTest =predict(lm2,newdata =test)
RMSE = sqrt(mean((test$Price - predTest)^2))
RMSE

plot(lm2$residuals)
abline(h=0)
abline(h=0.2)
abline(h=-0.2)

#######################

test2 =data.frame("Year"=c(1952) ,"WinterRain"=c(650) ,"AGST"=c(18) ,"HarvestRain"=c(160), "Age"=c(31),FrancePop=c(50000))
str(test2)          

predTest2=predict(lm2,newdata = test2)
predTest2

RMSE =sqrt(mean((test$Price - predTest2)^2))
RMSE

