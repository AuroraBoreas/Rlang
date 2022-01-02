# LEGB

## global environment
x <-2; y <- 2

quote(x + y)

eval(x + y)

eval(quote(x + y))

## new global environment
env <- new.env()
env$x <- 4

### shortcut
env <- list2env(list(x=4))

### unquote
eval(x + y, env)

### quoted
eval(quote(x + y), env)

# R compiler, environment chain
## when u call a function in R, you first create an environment for that function
## that environment is where its parameters will be stored,
## and any local variables the function assigns to it will go there as well;

## that environment is linked to another environment

# ["f -> function(x) 2 * x]
