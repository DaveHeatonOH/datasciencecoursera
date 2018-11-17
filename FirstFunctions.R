#Add 2 numbers
add2 <- function(x, y) {
  x + y
}

#return numbers from a vector that are > 10
above10 <- functions(x) {
  use <- x > 10
  x[use]
}

#return numbers from a vector that are > user defined input or 10 default
above <- function(x, n = 10) {
  use <- x > n
  x[use]
}

#Retun means of each column
columnMean <- function(x, removeNA = TRUE) {
    nc <- cnol(x)
    means <- numeric(nc)
    
    for(i in 1:nc){
      means[i] <- mean(x[, i], na.rm = removeNA)
    }
    means
}


