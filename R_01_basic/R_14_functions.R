# normal function in R ----
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

# anonymouse function in R is like ----
nums = 1:10
nums2 = (function(x){x * 2})(nums)
print(nums)
print(nums2)

# params function in R is like ----
getSum <- function(...) {
  params <- list(...)
  sum <- 0
  for(param in params) {
    sum <- sum + param
  }
  return(sum)
}

print(getSum(1,2,3))

# function inside a function ----
power <- function(exp) {
  return(function(x) {
    x ^ exp
  })
}

cubed = power(3)
print(cubed)
print(cubed(2))

# function as object ----
func_list = list(
  addOne <- function(x){ x + 1 },
  addTwo <- function(x){ x + 2 },
  triple <- function(x){ x * 3 },
  divTen <- function(x){ x / 10 }
)

x = 100
for(func in func_list){
  print(func(x))
}
















