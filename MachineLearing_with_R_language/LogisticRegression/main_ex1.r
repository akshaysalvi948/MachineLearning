# setwd("C:/Users/Akshay Salvi/Downloads")
bankfile = read.csv("BankLoan.csv")

str(infile)
head(bankfile)

logmod = glm(LoanApproval ~ Income + CIBILScore,data = bankfile , family = 'binomial')
summary(logmod)

predval = predict(logmod,newdata = bankfile,type='response')
head(predval)

bankfile$PredProb = predval
head(bankfile,20)

bankfile$PreApp = ''
bankfile$PreApp[ bankfile$PredProb > .5]= "yes-Approved"
bankfile$PreApp[ bankfile$PredProb < .5]= "No-Approved"
table(bankfile$LoanApproval,bankfile$PreApp)

################################################

library(caTools) #this package is used for split the value in equal proportional
set.seed(1234)

s2 = sample.split(bankfile$LoanApproval,SplitRatio = 0.7) #split the value in 70%
traindf = bankfile[ s2 == TRUE ,] #where ever the value is True all the value is taken
testdf =bankfile[ s2 == FALSE ,]  #where ever the value is False all the value is taken

table(bankfile$LoanApproval)
table(traindf$LoanApproval)
table(testdf$LoanApproval)

#################build model

logmod = glm(LoanApproval ~ Income + CIBILScore,data = bankfile , family = 'binomial')
summary(logmod)

########unit Test

predTrain = predict(logmod , newdata = traindf,type = "response")
table(traindf$LoanApproval,predTrain> .5)


#####UAT

predTest = predict(logmod , newdata = testdf,type = "response")
table(testdf$LoanApproval,predTest> .5)