library(kohonen)
チロルデータ1 <-read.csv("tirol1.csv",header=T)
チロルSOM <- som(scale(チロルデータ1[,2:9]), grid =somgrid(5, 5,"hexagonal"), rlen=500)

plot(チロルSOM, type="changes", main="類似度の変化")
plot(チロルSOM, type="codes", main="コード情報")
plot(チロルSOM, type="counts", main="各ユニットのオブザベーション数")

plot(チロルSOM , type="mapping", labels=チロルデータ1[,1],main="チロルチョコのポジショニングマップ")

###おまけ(形容詞対ごとのプロット)###
plot(チロルSOM, type="mapping", labels=チロルデータ1[,2],main="奇抜・ベタ")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,3],main="リッチ・庶民")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,4],main="くどい・さわやか")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,5],main="おしゃれ・ださい")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,6],main="大人・子供")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,7],main="和・洋")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,8],main="男・女")
plot(チロルSOM, type="mapping", labels=チロルデータ1[,9],main="春夏・秋冬")

