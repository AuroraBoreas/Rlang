for(i in seq(1, 10, 1)) {
  print(i ^ 2)
}

num <- 0
while(num < 10) {
  num <- num + 1
  if (num %% 2 == 0) {
    print(num)
  } else {
    next
  }
}

a <- 1
repeat {
  print(a)
  a <- a + 1
  if (a > 5) {
    break
  }
}

