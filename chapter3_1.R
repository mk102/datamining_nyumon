library(rpart)
library(rpart.plot)
library(partykit)

お札データ <- read.csv("お札.csv", header=T)
お札木 <- rpart(真偽 ~ ., data=お札データ)
print(お札木)

plot(お札木, uniform=T, branch=1, margin=0.05)
text(お札木, all=T, use.n=T)


rpart.plot(お札木, type = 1, uniform = TRUE, extra = 1, under = 1, faclen = 0)

plot(as.party(お札木))

printcp(お札木)
plotcp(お札木)
