# accesses elements inside of a vector
remain <- c(spades=11, hearts=12, diamonds=11, clubs=13)

# index of array in R starts at 1
remain[1]
remain[-1]
remain[2]
remain[-2]
remain["spades"]

# slices
remain[c(2,3)]
remain[c(3,2)]
remain[c("spades", "clubs")]
remain[c("clubs", "spades")]

# index -1 means to return all but index 1
remain[-c(1)]
remain[-c(1, 2)]

# - not work on character index tho
remain[-"spades"]

# using logical vector. aha, just like numpy array
remain[c(FALSE, TRUE, FALSE, TRUE)]

# R recycles c(FALSE, TRUE) to c(FALSE, TRUE, FALSE, TRUE) when logical vector is shorter than original vector, so
remain[c(F, T)]
remain[c(F, T, F, T)]
remain[c(T, F, T)]
remain[c(T, F, T, T)]
remain[c(T)]
remain[c(T, T, T, T)]
