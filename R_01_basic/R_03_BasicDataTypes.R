# Introduction ----
# this script displays the basic data types in R-lang

# logical ----
TRUE
FALSE
T
F

# numeric ----
# integer
2
# float
2.5
# integer
2L

# check is numeric ----
is.numeric(2)
is.numeric(2.5)
is.numeric(2L)
# integer is numeric, but numeric is not always integer
is.integer(2)
is.integer(2L)

# check is numeric ----
class(2)
class(2L)

# character ----
"I love data science"
class("I love data science")

# other atomic types
# double
# complex
# raw: store raw bytes

# coercion ----
as.numeric(TRUE)
as.numeric(FALSE)
as.character(4)
as.numeric("4.5")
as.integer("4.5")
as.numeric("Hello")
