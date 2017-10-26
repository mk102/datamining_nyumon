library(neuralnet)
ケーキデータ<-read.csv("ケーキ.csv",header=T)

for (i in 2:8){
  ケーキデータ[,i]<-(ケーキデータ[,i]-min(ケーキデータ[,i]))/
    (max(ケーキデータ[,i])-min(ケーキデータ[,i]))
}
ケーキデータ

set.seed(5)
print(net.ケーキ 
      <- neuralnet(購入意思~高級感+甘さ+新奇性+濃厚さ+食感+華やかさ+値段, 
                       ケーキデータ, hidden=c(2,1)))

plot(net.ケーキ,rep="best")
plot(net.ケーキ,show.weights=F)

cur.ケーキ<-compute(net.ケーキ, ケーキデータ[,2:8])$net.result
result <- cbind(ケーキデータ[,9],round(cur.ケーキ,2))
dimnames(result)<-list(ケーキデータ[,1],c("購入意思","予測値"))
t(result)
