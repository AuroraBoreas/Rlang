library(psych)
# library(ggplot2)

d1 <- rnorm(500, mean=1, sd=0.3)
d2 <- rnorm(500, mean=1, sd=0.5)
d3 <- rnorm(500, mean=1, sd=0.8)

df <- data.frame(d1, d2, d3)

describe(df)
