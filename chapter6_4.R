###チロルチョコの再分析###

チロルデータ2 <- read.csv('チロル2.csv',header=T,row.names=1)       #データの読み込み
チロルクラスター<-kmeans(チロルデータ2,centers=5)                   #クラスター分析の実行
チロルクラスター                                                    #結果の確認
tapply(names(チロルクラスター$cluster), チロルクラスター$cluster,unique)  #結果の整理
