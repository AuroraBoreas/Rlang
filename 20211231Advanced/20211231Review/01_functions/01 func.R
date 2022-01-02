
# canonical
square <- function(x) { return(x * x); }
square(2) # usage: single arity of one
square(1:5) # usage: apply on a seq

# take off curry brackets when function body has only one statement
square <- function(x) x * x;
square(2)

# Parameter category:
# args vs kwargs
rescale <- function(x, is.even=FALSE) {
    if (is.even) { return(x); }
    return(x*x);
}
rescale(1:5)
rescale(1:5, TRUE)

# paramarray
rescale <- function(x, ...) {
    m <- mean(x, ...)
    s <- sd(x, ...)
    return((x - m) / s);
}

x <- c(NA, 1:3)
rescale(x, na.rm=TRUE)

my.sum <- function(...) { return(sum(...)) }
my.sum(1:5)

# anonymous, it is default in R
(function(x) x**2)(3)

# lazy evaluation in R

(function(a, b) {a})(2, stop('error if evaluated'))
(function(a, b) {a})(stop('error if evaluated'), 2)
