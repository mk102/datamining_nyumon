###居酒屋メニューの分類###

居酒屋 <- read.csv("居酒屋.csv",header=T,row.names=1)             #データの読み込み
居酒屋                                                            #データの確認

居酒屋クラスター <-kmeans(居酒屋,centers=4)                       #クラスター分析の実行
居酒屋クラスター                                                  #結果の確認
tapply(names(居酒屋クラスター$cluster), 居酒屋クラスター$cluster,unique)  #データの整理
