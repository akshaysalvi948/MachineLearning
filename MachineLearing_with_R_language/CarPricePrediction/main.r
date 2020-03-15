

carInfile=read.csv("Carsdata.csv")
str(carInfile)

summary(carInfile)
mean(carInfile$Prices)

lm1=lm(Price~Mileage + Make + Type + Cylinder + Liter ,data = carInfile)
summary(lm1)

table(carInfile$Make)
table(carInfile$Doors,carInfile$Type)

plot(lm1$residuals)

test =data.frame(Mileage=c(38500,100000),
                 
                 Type=c('Sedan','Hatchback'),
                 Make =c('Pontiac','SAAB'),
                 Cylinder=c(6,8),
                 Liter=c(4,6))

test



predict(lm1,newdata = test)