library(MASS) #ライブラリの読み込み
data(Animals) #データの読み込み

#データハンドリング
動物データ3 <- Animals[c(2,9,13,14,24),] #2,9,13,14,24行目だけ抜き出す
rownames(動物データ3) <- c("牛","馬","ゴリラ","人間","チンパンジー") #行に名前をつける
colnames(動物データ3) <- c("体重","脳の重さ")             #列に名前をつける
動物データ3                                               #データの確認

距離行列 <- dist(scale(動物データ))                       #距離行列の作成
round(距離行列,3)                                         #距離行列を確認

動物クラスター <- hclust(距離行列,method="average")       #クラスター分析の実行
plot(動物クラスター,hang=0.2,main="動物のクラスター分析")    #デンドログラムの作図

#plot(動物クラスター,hang=0,main="動物のクラスター分析")  #hangが0の場合


###さまざまな分析###
動物クラスター <- hclust(距離行列,method="single")        #最短距離法
動物クラスター <- hclust(距離行列,method="complete")      #最長距離法
動物クラスター <- hclust(距離行列,method="centroid")      #重心法
動物クラスター <- hclust(距離行列,method="ward.D")        #ウォード法
