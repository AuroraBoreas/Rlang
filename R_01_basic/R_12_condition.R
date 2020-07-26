a <- 10
cond = FALSE
if (cond) {
  print("FALSE")
} else if (a > 5) {
  print("a is greater than 5")
} else {
  print(TRUE)
}

# logical operator: &, |, !
TRUE & FALSE
TRUE | FALSE
! TRUE

# works with vector
v1 <- c(TRUE, FALSE, TRUE, FALSE)
v2 <- c(FALSE, FALSE, TRUE, TRUE)
v1 & v2

# R also has &&, ||. they evaluate first part of expression.
v1 && v2