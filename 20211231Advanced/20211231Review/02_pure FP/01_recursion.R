# linear search

is_empty <- function(x) length(x) == 0

first <- function(x) x[1]

rest <- function(x) {
    if(length(x) == 1) NULL else x[2:length(x)]
}

lin_search <- function(e, col) {
    if(is_empty(col)) FALSE
    else if(first(col) == e) TRUE
    else lin_search(e, rest(col))
}

x <- 1:5
lin_search(0, x)
lin_search(1, x)
lin_search(5, x)
lin_search(6, x)

bin_search <- function(e, col, first=1, last=length(col)) {
    if(first > last) FALSE

    middle <- (last - first) %/% 2 + first;
    if(e == col[middle]) {
        TRUE
    } else if (e < col[middle]) {
        bin_search(e, col, first, middle - 1)
    } else {
        bin_search(e, col, middle + 1, last)
    }
}

# the structure of recursion function
# it is crucial that you make sure that all recursive calls actually are working on a smaller problem.

# tail recursion

# you will essentially have to simulate the function call stack yourself
