library(rpart)
library(rpart.plot)
library(partykit)

ハウスデータ <- read.csv("ハウス.csv", header=T)
ハウス木 <- rpart(家価格 ~ ., data=ハウスデータ, method="anova")
print(ハウス木)

plotcp(ハウス木)
ハウス木2 <- prune(ハウス木, cp=0.03)
print(ハウス木2)

plot(ハウス木2, uniform=T, branch=0.6, margin=0.1)
text(ハウス木2, all=T, use.n=T)

rpart.plot(ハウス木2, type = 1, uniform = TRUE, extra = 1, under = 1, faclen = 0)

plot(as.party(ハウス木2))

printcp(ハウス木2)
plotcp(ハウス木2)
