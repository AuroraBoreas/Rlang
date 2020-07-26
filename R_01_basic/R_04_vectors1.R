# how to create a vector in R? ----
# c() means to combine all args inside of parenthesis
vector_cards <- c("hearts", "spades", "diamonds", "diamonds", "spades")
class(vector_cards)
vector_cards
is.vector(vector_cards)

remain <- c(11, 12, 11, 13)
remain

# or to use names() to name a vector
suits = c("spades", "hearts", "diamonds", "clubs")
names(remain) <- suits
remain

# To make a vector readable, c() also accepts k, v pairs.
# or
remain <- c(spades=11, hearts=12, diamonds=11, clubs=13)
remain
# or
remain <- c("spades"=11, "hearts"=12, "diamonds"=11, "clubs"=13)
remain

# displays attr: str()
str(remain)

# Single variable == vector
apple <- 11
orange <- 12
is.vector(apple)
is.vector(orange)
length(apple)
# Vectors are homogeneous, like array in C/C++, C#. coersion for elements/args automatically.
# list() in R behaves like linked-list in Python, C#
drawn_ranks1 <- c(7, 4, "A", 10, "K", 3, 2, "Q")
drawn_ranks1
class(drawn_ranks1)
drawn_ranks2 <- c("7", 4, "10", 3, "2")
drawn_ranks2
class(drawn_ranks2)
# length() returns how many elements inside of a vector
length(drawn_ranks1)
