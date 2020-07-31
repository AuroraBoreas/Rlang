divide <- function(x, y){
  tryCatch(
    x / y,
    error <- function(e){
      if(is.character(x) | is.character(y)){
        print("Cant do it")
      }
    }
  )
}

divide(10, "a")