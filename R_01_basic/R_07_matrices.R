# what is Matrix?  combines two vectors into two dimensions table ----
m <- matrix(1:6, nrow=2, ncol=3, byrow=FALSE, 
            dimnames=list(c(1, 2), c("A", "B", "C")))
m

# there is other ways to create a matrix. they behaves like serials and columns in numpy array
rows <- rbind(c(1, 2, 3), c(4, 5, 6))
rows
cols <- cbind(c("B", "C", "D"), c("X", "Y", "Z"))
cols

# matrix recycling
m <- matrix(1:3, nrow=1, ncol=3, byrow=FALSE)
m <- matrix(1:3, nrow=1, ncol=4)
m <- matrix(1:3, nrow=2, ncol=3)
m

# mix. rbind(), cbind() work exactly as same as numpy array
m <- matrix(1:6, nrow=2, byrow=TRUE)
rbind(m, 7:9)
cbind(m, c(10, 11))

# other method to name matrix rows/columns using rownames() or colnames(). anyway, naming is not recycling in R
rownames(m) <- c("halo", "le monde")
colnames(m) <- c("nihao", "shiji", "hoho")
m

# coercion behaves same as vector
num <- matrix(1:8, ncol=2)
cha <- matrix(LETTERS[1:6], nrow=4, ncol=3)
num
cha
cbind(num, cha)

# how to retrieve element(s) inside of a matrix? ----
# just like numpy array, by name or index or mix
m <- matrix(1:6, nrow=2, ncol=3, byrow=FALSE, 
            dimnames=list(c(1, 2), c("A", "B", "C")))
m
m[1, 1]
# or rows
m[1, ]
# or columns
m[, 1]
# coma(,) is important here. ignoring a coma leads to a different result
# by default, matrix is filled by column from 1 to N.
m[4]

# matrix arithmetic ----
# colSums(), rowSums(), lotr_matrix()
fellowship <- c(316, 556)
towers <- c(343, 584)
king <- c(378, 742)

lotr_matrix <- cbind(fellowship, towers, king)
lotr_matrix

colnames(lotr_matrix) <- c("fellowship", "towers", "kings")
# R vector doesnt accept excess coma but Python does. Python is smart enough
#rownames(lotr_matrix) <- c("US", "non-US",)
rownames(lotr_matrix) <- c("US", "non-US")
lotr_matrix

# convert dollars to euro. matrix arithmetic behaves same as numpy array
rate <- 1.12 # assuming 1 dollar <= 1.2 euro
lotr_matrix / 1.12
lotr_matrix - 50
lotr_matrix + 100
lotr_matrix * 1.01

# matrix meets matrix. just like what numpy array does
theater_cut <- matrix(c(50, 80, 100), nrow=3, ncol=2, byrow=FALSE)
theater_cut
# transpose theater_cut
tmp <- t(theater_cut)
tmp
# subtract
lotr_matrix - tmp
# add
lotr_matrix + tmp
# multiply
lotr_matrix * tmp
# divide
lotr_matrix / tmp
# recycling when matrix +/-/*/div etc a vector. it means mirroring the vector and becoming two dimension.
lotr_matrix - c(10, 10, 10)
