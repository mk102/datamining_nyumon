library(rpart)
library(rpart.plot)
library(partykit)

年収データ <- read.csv("年収.csv", header=T)
年収木 <- rpart(年収 ~ ., data=年収データ)
print(年収木)
plot(年収木, uniform=T, branch=0.6, margin=0.05)
text(年収木, all=T, use.n=T, pretty=0)

年収予測 <- predict(年収木, newdata=年収データ, type="vector")
cor(年収データ$年収, 年収予測)
plot(年収データ$年収, 年収予測)

rpart.plot(年収木, type = 1, uniform = TRUE, extra = 1, under = 1, faclen = 0)

plot(as.party(年収木))

printcp(年収木)
plotcp(年収木)
