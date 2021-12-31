library(datasets)

par(mfrow=c(1,1))
View(lynx)

hist(lynx)

hist(lynx,
     breaks=14,
     freq=FALSE,
     col='thistle')

curve(dnorm(x, mean=mean(lynx), sd=sd(lynx)),
      col='#0000ff',
      lwd=2,
      add=TRUE)

lines(density(lynx),
     col='#ff00ff',
     lwd=2)

lines(density(lynx, adjust=3),
      col='thistle2',
      lwd=2)
