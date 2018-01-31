#To correctly identify the species by using unsupervised learning----
library(ggplot2)
install.packages("tidyverse")
# load iris data set
library(datasets)
# load iris data set and look into its structure.
str(iris)
# Observe first and last 10 observations ----
head(iris)
tail(iris)
iris
iris$Species
#summerize data on Iris ----
summary(iris)
# plot ----
library(ggplot2)
attach(iris)
plot(Sepal.Length,Sepal.Width)
plot(Petal.Length,Petal.Width)
# use GGplot 2 ----
ggplot(iris,aes(Sepal.Length,Sepal.Width,color = Species))+geom_point()
ggplot(iris,aes(Petal.Length,Petal.Width,color = Species))+geom_point()

# lets apply k means clustering----
#syntex for kmeans(dataset,centers=3,iter.max=10,num.seed=20)

set.seed(20)

iris_clustering = kmeans(iris[3:4],centers = 3,nstart = 20)
iris_clustering
# plotting with confusion matrix

table(iris_clustering$cluster,iris$Species)






       