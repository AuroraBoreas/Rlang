# >> rants
# >> no multiline comment sucks af
# >> index starts with 1, wtf?

# var and assignment
# pass

# Vector
# >> what: vector is similar with array in C/C++, C#;
# >> how: using c() function to create a vetor object;

layers <- c('Parcel', 'Streets', 'Railroads', 'Streams', 'Buildings')
print(layers)
# length

print(length(layers))

# index
print(layers[3])

# sub-vector, or slice
print(layers[3:5])

# negative index is used to remove element
print(layers[-4])

# 2nd vector
layerIDs <- c(1, 2, 3, 4)

# combined vector
combindedVector <- c(layers, layerIDs)
print(combindedVector)

# vector arithmetic
x <- c(10, 20, 30, 40, 50)
y <- c(100, 200, 300, 400, 500)
# add
x + y
# sub
y - x
# multiply the value 10
x * 10
y * 20

# using builtin functions against vectors
sum(x)
mean(y)
median(y)
max(y)
min(y)

# Factor
# >> what: a vector but with categories; namedtuple in Python
# >> how:

land.type <- factor(c("Residential", "Commercial", "Agricultural", "Commercial", "Commercial", "Residential"), levels=c("Residential", "Commercial"))

table(land.type)

# ordering
mons <- c("March", "April", "January", "November", "January",
"September", "October", "September", "November", "August",  "January",
"November", "November", "February", "May", "August",  "July",
"December", "August", "August", "September", "November",  "February",
"April")

# mons <- factor(mons)
# table(mons)

# improve

mons <- factor(mons, levels=c('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'), ordered=TRUE)

table(mons)

# List
# >> what: is an ordered collection of elements
# >> difference btwn lists and vecors: list concept is similar with tuple in C++
my.list <- list("Streets", 2000, "Parcels", 5000, TRUE, FALSE)

# display
my.list
# index
my.list[2][[1]] # <-- why?: list[index] return another list object, list[[index]] return value
# index: single pair of []
my.list[2]
# index: double pair of []
my.list[[2]]
# sub-list
new.list <- my.list[c(1, 2)]
new.list
# length
length(new.list)
# using is.list() to check whether the var is a list obj
is.list(my.list)
