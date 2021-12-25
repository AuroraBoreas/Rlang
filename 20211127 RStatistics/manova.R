# multivariate statistics
# ANOVA: test statistics of sample means BGMS, WGMS; anova = "signal" / "noise";

# MANOVA: test significant differences in multivariate means among more than two multivariate-normal samples;
# H0: samples from populatons with identical multivariate means;
# manova = "signal" / "noise";

### categories of variate:
# univariate: one variable
# bivariates: two variables
# multivariates: > 2 variables

### evaluating "extremeness"
# background: due to the multivariate nature, this is no signle, uniform solution for "extremeness";
# pillai's trace = Sum(1/(1+λk)): default in R, commonly said to be the most robust;
# wilks' = Product(1/(1+λk))
# hotelling-lawley trace = Sum(λk)
# roy's largets root = (λmax) / (1+λmax)

### what is eigen, eigenvalue and eigenvector?
# eigen: a person's name;
