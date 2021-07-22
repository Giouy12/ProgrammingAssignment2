
makeCacheMatrix <- function(m = matrix()) {
  x <- NULL
## setting the inverse property
  set <- function(matrix){
    m <<- matrix
    x <<- NULL
  }
## value matrix
  get <- function() {
## returns to matrix
    m
  }
## set the value of the inverse
  setInverse <- function(inverse) {
   x <<- inverse
  }
## value of the inverse
  getInverse <- function() {
## returns to the inverse property
    x
  }
## a list of returns of methods
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  
}

cacheSolve <- function(x, ...) {
## returning to a matrix that is the inverse of 'x'
  m <- x$getInverse()
## this applies to returning the inverse if its already set
  if(!is.null(m)) {
    message("currently getting cached data")
    return(m)
  }

## in this part, we are getting the matrix from our object
  data <- x$get()
## calculation of data using matrix multiplication
  m <- solve(data) %% data
## then we set the inverse of our object 
  x$setInverse(m)
## symbolizes returning to the matrix
  m
}
