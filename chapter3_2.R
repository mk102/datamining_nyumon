install.packages("rpart")
install.packages("rpart.plot")
install.packages("partykit")

library(rpart)
library(rpart.plot)
library(partykit)

タイタニックデータ <- read.csv("タイタニック.csv", header=T)

タイタニック木 <- rpart(生死~等級+大人子ども+性別, data=タイタニックデータ, method="class")
print(タイタニック木)

plot(タイタニック木, uniform=T, branch=0.6, margin=0.15)
text(タイタニック木, all=T, use.n=T, pretty=0)


# "rpart.plot"パッケージのrpart.plot関数で決定木を描く。
rpart.plot(タイタニック木, type = 1, uniform = TRUE, extra = 1, under = 1, faclen = 0)

#"partykit"パッケージのas.party関数用いてデータを変換し、plotする。
plot(as.party(タイタニック木))

printcp(タイタニック木)
plotcp(タイタニック木)

判別 <- predict(タイタニック木, newdata=タイタニックデータ, type="vector")
table(判別, タイタニックデータ$生死)


prp(タイタニック木, type=2, extra=101, nn=TRUE, fallen.leaves=TRUE, faclen=0,
           varlen=0, cex = 1.2, split.cex=0.8, under.cex = 1.2)
#dev.copy2eps(file="z15kettei04.eps",family='Japan1')
