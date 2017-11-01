library(som)
小売業データ <- read.csv("kouri.csv",header=T)
標準化小売業データ <- normalize(小売業データ[,2:9], byrow=F) #データの標準化
小売業SOM <- som(標準化小売業データ, xdim=10, ydim=10, topol="rect")

乱数 <- cbind(rnorm(nrow(小売業データ), 0, 0.15), rnorm(nrow(小売業データ), 0, 0.15))
小売業マップ <- 小売業SOM $visual[,1:2] + 乱数 + 0.5
plot(小売業マップ, xlim=c(0,10), ylim=c(0,10))
text(小売業マップ[,1], 小売業マップ[,2], 小売業データ$業種名)

#####小売業データ(決定木と組み合わせる)#####
library(rpart)
library(rpart.plot)
library(partykit)

小売業SOM2 <- som(標準化小売業データ, xdim=5, ydim=1, topol="rect")
決定木用小売業データ <- cbind(小売業データ, 小売業SOM2$visual[,1]+1)
colnames(決定木用小売業データ)[10] <- "セグメント"

小売業分類木 <- rpart(セグメント~., data=決定木用小売業データ[,2:10], method="class")
print(小売業分類木)

plot(小売業分類木, uniform=T, branch=0.6, margin=0.15)
text(小売業分類木, all=T, use.n=T, pretty=0)

rpart.plot(小売業分類木, type = 1, uniform = TRUE, extra = 1, under = 1, faclen = 0)

plot(as.party(小売業分類木))

printcp(小売業分類木)
plotcp(小売業分類木)

