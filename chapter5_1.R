op <- options()
options(digits=2)#表示桁数の変更

library(arules)
温泉データ <- read.csv("onsen.csv", header=TRUE, row.names=1)
温泉データ <- as.matrix(温泉データ)
温泉トランザクション <- as(温泉データ, "transactions")
summary(温泉トランザクション)
inspect(温泉トランザクション)
itemFrequency(温泉トランザクション)
itemFrequencyPlot(温泉トランザクション, ylim=c(0,1))
温泉ルール <- apriori(温泉トランザクション, parameter=list(maxlen=4, support=0.04, confidence=0.55, ext=TRUE))
summary(温泉ルール)
inspect(温泉ルール, digits=3)
print(inspect(温泉ルール[c(20,21, 70, 69, 3, 4, 127, 83, 61), ]), digits=3)

options(op)#表示桁数を元に戻す
