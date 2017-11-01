library(kohonen)
カクテルデータ <- read.csv("cocktail.csv",header=T)

set.seed(123)
カクテルSOM <- som(scale(カクテルデータ[,5:16]), grid =somgrid(5,5, "rectangular"), rlen=1000)
#summary(カクテルSOM)

head(カクテルSOM$grid$pts, n=3)
tail(カクテルSOM$grid$pts, n=3)

plot(カクテルSOM, type="changes", main="類似度の変化")
plot(カクテルSOM, type="counts", main="各ユニットのオブザベーション数")
plot(カクテルSOM, type="codes", main="コード情報")

plot(カクテルSOM, type="mapping", labels=カクテルデータ[,2],main="甘さ−辛さ")
plot(カクテルSOM, type="mapping", labels=カクテルデータ[,3],main="飲時")
plot(カクテルSOM, type="mapping", labels=カクテルデータ[,4],main="グラス")

