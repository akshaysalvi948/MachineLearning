
infile=read.csv("concrete.csv")

str(infile)
summary(infile)

#base line Model
mean(infile$strength)
var(infile$strength)

#Regression Model
lm2=lm(strength~cement + slag + ash + water + superplastic  + age ,data=infile)
summary(lm2)
par(mfrow=c(2,1)) #too Plot two graphs togethere
  
plot(lm2$residuals)
abline(h=0)
hist(lm2$residuals)
#################################################
set.seed(555)
rowidx=sample(nrow(infile),720,replace = F) #relpce=F it will not take  duplicate value

train = infile[ rowidx, ]
test = infile[ -rowidx , ]

lm1 = lm(strength ~ cement + slag + ash + water + superplastic + age, data = train)
summary(lm1)

predTrain = predict(lm1,newdata = train)
RMSE = sqrt(mean((train$strength - predTrain)^2))

RMSE

predTest =predict(lm1, newdata = test)
RMSE = sqrt(mean((test$strength - predTest)^2))
RMSE
