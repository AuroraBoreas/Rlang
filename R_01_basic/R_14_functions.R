calc_berries <- function(income, character, d=NULL, m=NULL){
  if (income < 0 | characters < 0 | d < 0 | m < 0) {
    return("Value Error. all values must be >= 0")
  }
  if (is.null(d) | is.null(m)) {
    return(0)
  } else {
    return(income * characters * d * m)
  }
}

income = 30
characters = 7
d = 30
m = 1
# daily
print(calc_berries(30, 7, 1, 1))
# monthly
print(calc_berries(30, 7, 30, 1))
# yearly
print(calc_berries(30, 7, 30, 12))