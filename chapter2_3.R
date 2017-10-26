library(neuralnet)
鉛筆データ<-read.csv("鉛筆.csv",header=T)
鉛筆データ$偶奇<-鉛筆データ$本数%%2
鉛筆データ

set.seed(4)
print(net.鉛筆 <- neuralnet(ポン+ホン+ボン~本数+偶奇, 鉛筆データ, hidden=3))

plot(net.鉛筆,rep="best")
plot(net.鉛筆,show.weights=F)

confidence.interval(net.鉛筆)
print(pre.鉛筆<-prediction(net.鉛筆))
print(err.鉛筆<-round(pre.鉛筆[[2]]-pre.鉛筆[[1]],2))
print(cur.鉛筆<-compute(net.鉛筆, cbind(c(1:10),c(1:10)%%2))$net.result)
