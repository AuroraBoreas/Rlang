# expressions in R are vectorized
# even simple expressions that only involve numbers really are vector operations
# they are just vectors of length 1;

# vectorization
# it relates with CPU instruction
# morden CPU instruction supports operations on 4 elements of an array at same time;
# 4 is the most supported
# loop unroll vs vectorization

# for(int i=0; i<16; i++) {
#     C[i] = A[i] + B[i]
#     C[i+1] = A[i+1] + B[i+1]
#     C[i+2] = A[i+2] + B[i+2]
#     C[i+3] = A[i+3] + B[i+3]
# }

# for(int i=0; i < 16; ++i) {
#     addFourThingsAtOnceAndStoreResults(&C[i], &A[i], &B[i])
# }

# default behavior in R
# operation on v1 and v2
# if length differs, R keep repeating the shortest vector

x <- 1:3
y <- 1:6
length(x)
length(y)
x + y

# vectorized function
log(1:3)
sqrt(1:3)

f <- function(a, b) {
    log(a) - sqrt(b)
}

f(1:3, 1:3)

# a function that uses control flow usually will not be vectorized
# workaround: using ifelse

compare1 <- function(x, y) {
    if(x < y) {
        -1
    } else if(y < x) {
        1
    } else {
        0
    }
}

compare2 <- function(x, y) {
    ifelse(x < y, -1, ifelse(y < x, 1, 0))
}

# compare1(1:6, 1:3) # compiler error
compare2(1:6, 1:3)

# things are not always so simple
# whence we cannot, we can instead use the function `Vectorize`
# Vectorize(f): takes a function and translate it into a function that can work component-wise on vectors

compare3 <- Vectorize(compare1)
compare3(1:6, 1:3)

# by default, Vectorize() will vectorize on all args of a function
# namely reveal the whole vectors to function body
# but we may contrain it by explicitly telling Vectorize() which args should be vectorized

scale1 <- function(x, y) {
    (x - mean(y)) / sd(y)
}

scale1(1:6, 1:3)

scale2 <- Vectorize(scale1)
scale2(1:6, 1:3)

scale3 <- Vectorize(scale1, vectorize.args='x') # explicit determine vectorized args
scale3(1:6, 1:3)
