# function
# how: func_name <- function(T...Args) { #body }

# builtin functions: sum(), means(), median(), max(), min()
# colSum(), colMeans(), rowSum(), rowMeans()
# length()
# print(), ls(), rm(), getcwd(), setcwd()

add <- function(x, y) { return (x + y) }

add(1, 2)

myFactorial <- function(n)
{
    if(n < 2)
    { return (1) }
    else
    {
       return (n * myFactorial(n-1))
    }
}

myFactorial(3)

