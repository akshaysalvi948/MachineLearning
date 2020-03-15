library(randomForest)
iris

library(caTools)
s1 = sample.split(iris$Species,SplitRatio = 0.7)

traindf = iris[ s1 == T , ]
testdf = iris[ s1 == F , ]

rfmod = randomForest(Species~ Petal.Length + Petal.Width + Sepal.Length + Sepal.Width,data=traindf) 
varImpPlot(rfmod)

rfmod
PredTrain = predict(rfmod)
table(traindf$Species,PredTrain)

PredTest = predict(rfmod,newdata = testdf)
table(testdf$Species,PredTest)

rfmod
plot(iris$Petal.Length,iris$Petal.Width,col=iris$Species)
