library(nnet)
お札データ<-read.csv("お札.csv",header=T)

下部マージン<-(お札データ$下部マージン - min(お札データ$下部マージン))/
  (max(お札データ$下部マージン)-min(お札データ$下部マージン))
対角線<-(お札データ$対角線 - min(お札データ$対角線))/
  (max(お札データ$対角線) - min(お札データ$対角線))

入力層<-cbind(下部マージン,対角線)
出力層<-class.ind(お札データ$真偽)

head(出力層, n=3)
tail(出力層, n=3)


set.seed(3)
ネットワーク学習 <- nnet(入力層, 出力層, size=3, rang=0.3, maxit=2000)

ネットワーク適用 <- predict(ネットワーク学習, 入力層)
適用結果 <- round(ネットワーク適用, digits=3)

head(適用結果, n=3)
tail(適用結果, n=3)
