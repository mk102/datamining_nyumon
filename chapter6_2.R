###街のイメージ調査の分析###

街データ <- read.csv("街のイメージ.csv",header=T,row.names=1)      #データの読み込み
距離行列 <- dist(街データ,method="euclidean")                      #距離行列の作成

街クラスター <- hclust(距離行列,method="ward.D")                   #クラスター分析の実行
plot(街クラスター,hang=-1,main="街のイメージ",ylab="高さ")         #デンドログラムの作成

heatmap(as.matrix(街データ),col=c(gray(0.7),gray(0.6),gray(0.5),
                              gray(0.4),gray(0.3),gray(0.2)))                         #ヒートマップの作成
