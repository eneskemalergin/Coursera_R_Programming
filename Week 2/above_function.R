
above10 <- function(x){
    use <- x > 10
    x[use]
    
}

above <- function(x,n){
  use <- x > n
  x[use]
}

# we could specified the default value using

above <- function(x,n = 10){
  use <- x > n
  x[use]
}
