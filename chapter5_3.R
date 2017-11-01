op <- options()
options(digits=2)#表示桁数の変更

library(arules)
天気データ <- read.csv("tenki.csv", header=TRUE, row.names=1, colClasses="factor") 
天気トランザクション <- as(天気データ, "transactions")
summary(天気トランザクション)
inspect(天気トランザクション)
itemFrequency(天気トランザクション)
itemFrequencyPlot(天気トランザクション, ylim=c(0, 1), cex.names=0.7)

晴れルール <- apriori(天気トランザクション,
                           parameter=list(maxlen=5, supp=0.05, conf=0.65, ext=TRUE),
                           appearance=list(rhs="当日天気=晴", default="lhs"))
inspect(sort(晴れルール, "support")[1:10, ])
inspect(sort(晴れルール,"confidence")[1:10, ])

雨ルール <- apriori(天気トランザクション,
                          parameter=list(maxlen=3, supp=0.01, conf=0.40, ext=TRUE),
                          appearance=list(rhs="当日天気=雨", default="lhs"))
inspect(sort(雨ルール, "support")[1:10, ])
inspect(sort(雨ルール, "confidence")[1:10, ])

雪ルール <- apriori(天気トランザクション,
                          parameter=list(maxlen=3, supp=0.0001, conf=0.01, ext=TRUE),
                          appearance=list(rhs="当日天気=雪", default="lhs"))
雪ルール1.2月 <- subset(雪ルール, subset= (lhs %in% "月=2") |(lhs %in% "月=1") )
inspect(雪ルール1.2月[1:10, ])

options(op)#表示桁数を元に戻す
