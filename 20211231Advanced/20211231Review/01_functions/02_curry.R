# function currying
# curry is from Haskell Curry

f <- function(x) { function(y) { x + y } }

f(2)(3) # 5

# anatomy
g <- f(2)
class(g) # function

r <- g(3)
class(r) # numeric

# force evaluation in FP
f <- function(x) {
    force(a)
    function(y) { x + y }
}

# myth
p <- function(...) {
    eval(substitute(alist(...)))
}

r <- p(x=2)
class(r$x)
