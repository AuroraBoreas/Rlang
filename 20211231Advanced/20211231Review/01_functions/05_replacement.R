# replacement functions
# data in R is immutable

x <- y <- 1:5 # integers

x[1] <- 6

x
y

# by default, numeric in R is float
# that's why member-wise copy occurred

class(6)
class(6L)

# install.packages('pryr')
x <- 1:5

x[1] <- 6L


# in R, any function we define whose name ends with <- become a replace function;
x <- 1:4
x
names(x) <- letters[1:4] # this is translated into: x <- `names<-`(x, letters[1:4])
x
names(x)

# write our own replacement functions using this syntax
# two requirements:
# 1) function name has to be end with <-, thus we need to quote the name when we assign to it
# 2) there so replacement functions can take more than two args
# replacement functions only look like they are modifying data.
# they are not
# they only reassign values to variables

