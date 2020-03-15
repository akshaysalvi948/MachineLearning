infile=read.csv("AirlinesCluster.csv")
str(infile)
kc=kmeans(infile,5)
kc
infile_scale=scale(infile)
kc1=kmeans(infile_scale,5)
kc1

bal=tapply(infile$Balance,kc1$cluster,mean)
Q=tapply(infile$QualMiles,kc1$cluster,mean)
B=tapply(infile$BonusMiles,kc1$cluster,mean)
Tr=tapply(infile$BonusTrans,kc1$cluster,mean)
fm=tapply(infile$FlightMiles,kc1$cluster,mean)
ft=tapply(infile$FlightTrans,kc1$cluster,mean)
days=tapply(infile$DaysSinceEnroll,kc1$cluster,mean)
infile_k=cbind(bal,Q,B,Tr,fm,ft,days)
infile_k
hist()



wss = (nrow(scaled_infile)-1)*sum(apply(scaled_infile,2,var))
wss#sum square total var*(n-1) #-sum total of variance
#one way
#for(i in 2:15) {
#  kc=
#}

for(i in 2:7) wss[i] = sum(kmeans(scaled_infile,centers = i)$withinss)
plot(1:7,wss,type="b",xlab = "Number of clusters",ylab = "within groups sum of square")
###########################Herirachical clustering#############3


d=dist(scaled_infile,method = "euclidean")
length(d)
hc =hclust(d,method = "ward.D")
plot(hc)
rect.hclust(hc,k=5)
clusterno=cutree(hc,k=5)
bal=tapply(infile$Balance,clusterno,mean)
Q=tapply(infile$QualMiles,clusterno,mean)
B=tapply(infile$BonusMiles,clusterno,mean)
Tr=tapply(infile$BonusTrans,clusterno,mean)
fm=tapply(infile$FlightMiles,clusterno,mean)
ft=tapply(infile$FlightTrans,clusterno,mean)
days=tapply(infile$DaysSinceEnroll,clusterno,mean)
cbind(bal,Q,B,Tr,fm,ft,days)


