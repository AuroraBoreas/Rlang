# matrix
# >> what: a container that has columns and rows
# >> how: matrix()
# >> concept: DataFrame in pandas, multidimensional array in C/C++, DataTable in C#
# >> note: all values in the matrix MUST be of the same type

m <- matrix(c(2,4,3,1,5,7), nrow=2, ncol=3, byrow=TRUE)
m
# name columns
colnames(m) <- c('POP2000', "POP2005", "POP2010")
m
# index
m[2, 3]
# row
m[2,]
# column
m[, 3]
# multiple columns
m[, c(1, 3)]
# access columns or rows by name after naming
m[,"POP2010"]
# builtin functions: colSums(), colMeans(), or rowSums(), rowMeans()
colSums(m)
colMeans(m)
rowSums(m)
rowMeans(m)


# builtin function: data(), it displays a list of all the sample datasets;
# >> purpose: sample datasets are good for learning purpose, but of limited usefulness beyond that;
data()

# USArrests
data("USArrests")
USArrests

# pull out the data fro all rows from Assault column
USArrests$Assault
# index
USArrests[50, 2]
# row
USArrests[50, ]
