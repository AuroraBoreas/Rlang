library(datasets)
View(iris)

head(iris)

summaryØ‚(iris)

install.packages('psych')

??psych

psych::describe(iris)

par(mfrow=c(3,1)) # mfrow = multiple figure rows
hist(iris$Petal.Width[iris$Species=='setosa'],
     xlim=c(0,3),
     xlab='',
     main='hist of setosa',
     col='#ff0000')

hist(iris$Petal.Width[iris$Species=='versicolor'], #virginica
     xlim=c(0,3),
     xlab='',
     main='hist of versicolor',
     col='#ff00ff'
     )

hist(iris$Petal.Width[iris$Species=='virginica'],
     xlim=c(0,3),
     xlab='',
     main='hist of virginica',
     col='#00ffff')

par(mfrow=c(1,1))
