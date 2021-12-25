### Correlation && Regression
# generalized least squares regression


### categories
# OLS: ordinary least squares
# GLS: generalized least squares

### autocorrelation
# a significant correlation btwn residuals at position x and "lagged" residuals at position x+1 (or x+2, x+3 etc.)


### GLS
# basic theory: the residuals can be "transformed" so that variances are equal and uncorrelated;

# OLS: minimize S(yi - xib)^2
# GLS: minimize distance relative to covariance of residuals (squared Mahalanobis distance)


### Mahalanobis distance
# A point p is closer than a point q if the contour that contains p is nested within the contour that contains q.

# how: minimize (Y-XB)^T * Ω^-1 (Y-XB)

### Autoregressive-moving average(ARMA) models
# autoregressive model: influenced by previous point(s)
# moving average model: influenced by previous error tem(s)
# autoregressive moving average model
