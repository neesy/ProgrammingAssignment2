## Create a cached matrix

## You must first create a matrix that will run using the file
## Tested using my_data <- matrix(rnorm(10000, 5, 1), nrow=10, ncol=10) 

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
    set <- function(y = matrix()) {
    x <<- y
    m <<- NULL
}
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## Now create the inverse of the cached matrix

cacheSolve <- function(x) {
  m <- x$getsolve()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data)
  x$setsolve(m)
  m
}
