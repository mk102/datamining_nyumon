op <- options()
options(digits=2)#表示桁数の変更

library(arules)
動物データ <- read.csv("animal2.csv", header=TRUE, row.names=1)
動物データ <- as.matrix(動物データ)
動物トランザクション <- as(動物データ, "transactions")
summary(動物トランザクション)
inspect(動物トランザクション)
itemFrequency(動物トランザクション)
itemFrequencyPlot(動物トランザクション, ylim=c(0, 1))

動物好きルール <- apriori(動物トランザクション, 
                             parameter=list(maxlen=4, support=0.05, confidence=0.55, ext=TRUE),
                             appearance=list(rhs="好きな", default="lhs"))
length(動物好きルール)
inspect(sort(動物好きルール, by="confidence"))

動物危険ルール <- apriori(動物トランザクション,
                             parameter=list(maxlen=4, support=0.05, confidence=0.55, ext=TRUE),
                             appearance=list(rhs="危険な", default="lhs"))
length(動物危険ルール)
inspect(sort(動物危険ルール, by="confidence"))

options(op)#表示桁数を元に戻す
