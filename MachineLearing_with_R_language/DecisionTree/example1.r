iris

str(iris)

library(caTools)
library(rpart)
library(rpart.plot)

set.seed(4444)
s1 = sample.split(iris$Species,SplitRatio = 0.7)

traindf = iris[s1 == T ,]
testdf = iris[s1 == F ,]

dtmod = rpart(Species ~Petal.width + Petal.width + Petal.Length + Sepal.width + Sepal.Length,
              data = traindf,method = 'class')
text(dtmod , cex=.7)

predTrain = predict(dtmod,type='class',newdata = traindf)
table(traindf$Species,predTrain)

predTrain = predict(dtmod,type='class',newdata = traindf)
table(traindf$Species,predTrain)
