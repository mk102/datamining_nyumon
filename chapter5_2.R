op <- options()
options(digits=2)#表示桁数の変更

library(arules)
スコッチデータ <- read.csv("scotch.csv", header=TRUE, row.names=1)
スコッチデータ
スコッチトランザクション <- as(スコッチデータ, "transactions")
summary(スコッチトランザクション)
inspect(スコッチトランザクション)
itemFrequency(スコッチトランザクション)
itemFrequencyPlot(スコッチトランザクション, ylim=c(0, 1))
スコッチルール <- apriori(スコッチトランザクション, parameter
                               =list(maxlen=3, supp=0.02, conf=0.35, ext=TRUE))

甘いかつ改善率1より大ルール <- subset(スコッチルール, subset= (rhs %in% "味=甘い") & (lift>1.0) )
inspect(甘いかつ改善率1より大ルール)
inspect(甘いかつ改善率1より大ルール[c(16, 15, 11, 5, 35, 33), ])

甘いかつ改善率1より小ルール <- subset(スコッチルール, subset= (rhs %in% "味=甘い") & (lift<1.0) )
inspect(甘いかつ改善率1より小ルール)
inspect(甘いかつ改善率1より小ルール[c(8, 1, 2, 9), ])


options(op)#表示桁数を元に戻す
