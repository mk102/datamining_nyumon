library(som)
動物データ1 <- read.csv("animal1.csv",header=T)

標準化動物データ <- normalize(動物データ1[,2:14], byrow=F)
動物SOM <- som(標準化動物データ, xdim=10, ydim=10, topol="rect")
plot(動物SOM)
head(動物SOM$visual)

乱数 <- cbind(rnorm(nrow(動物データ1), 0, 0.15), rnorm(nrow(動物データ1), 0, 0.15))
動物マップ <- 動物SOM$visual[,1:2] + 乱数 + 0.5
plot(動物マップ, xlim=c(0,10), ylim=c(0,10))
text(動物マップ[,1], 動物マップ[,2], 動物データ1$動物名)
