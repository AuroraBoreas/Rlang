# infix operators in R are also functions
# user-defined infix operators are function with special names
# %func_name% will be considered an infix operator in R

# how
# there is no special syntax for creating a function to be used as an infix operator
# there is a special syntax for assigning variables with names starting and ending with %
# to work with special variables using syntx: `var`

`+`(2, 2)

`if`(2 > 3, "true", "false")

# infix syntax: exp1 %op% exp2
# R treats it like
# `op`(exp1, exp2)

# lesson learned: we can translate an operator name into a function name just by "quoting" it
# this is how to define new infix operators

add <- function(x, y) { x + y }
mul <- function(x, y) { x * y }

# the behavior of back-tick `` is alike function pointer in C++

`add`(2, 3) # 5
`mul`(2, 3) # 6

`%add%` <- add
`%mul%` <- mul
2 %add% 3
2 %mul% 3

`%sux%` <- function(x, y) { x + y * y }

2 %sux% 3 # 11

# simplify it: using `%op%` <- function(){} to translate a given function to infix operator

# abuse it

`%x%` <- function(expr, num) { replicate(num, expr) }
3 %x% 5

cat("this is ", "very " %x% 3, "much fun")

# notice that args are evaluated before and after infix operators
# lazy evaluation emoji :s
print("\n")

rnorm(1) %x% 4

# to make it lazy evaluation again

`%x%` <- function(expr, num) {
    m <- match.call() # get a representation of the current function call from which we can extract the expr w/o evaluating it
    replicate(num, eval.parent(m$expr))
}

rnorm(1) %x% 4
