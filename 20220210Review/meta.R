# variable
## pattern: T N V
## type theory: CSIL FD BBD; 
## type cast: conversion;
## reflection: is.xx.xx

x = 3.1415926
toString(x)
strtoi('24', base = 10)
is.integer(x)
is.double(x)
is.atomic(x)
is.finite(x)

# function
## pattern: T N P
## regular
## anonymous
## lambda
## immediate
## nested
## HOF
## function pointer

fac <- function(n, rv=1) {
  if (n < 2) return(rv)  # guard
  return(fac(n-1, n*rv)) # accumulator -> tail recursion
}

fac(5) # 120

nested <- function(x) {
  inner <- function(x) {
    return(x ^ 2)
  }
  return(inner(x))
}

nested(10)

(function(x, y){ return(x ^ 2 + y ^ 2) })(3, 4) # 25

# data structure
## vector
## list
## matrix
## data.frame
## table

v <- c(1,2,3)
is.vector(v)

l <- list(1,2,3)
is.list(l)
l

f <- factor(letters[1:9], labels="letter")
f
is.factor(f)

s <- seq(1, 100, by=2)
s

t <- as.table(v)
t
