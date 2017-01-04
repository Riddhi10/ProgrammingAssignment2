## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#function1 : makeCacheMatrix

#This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  #define the inv for matrix inverse from cache
  inv <- NULL
  #set the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  #getting from cache
  get <- function() x
  setInverse <- function(solutionMatrix) Inv <<- solutionMatrix
  getInverse <- function() inv
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}

#function 2 :cacheSolve
#This function computes the inverse of the special "matrix" returned
#by makeCacheMatrix above. If the inverse has already been calculated
#(and the matrix has not changed), then the cachesolve should retrieve
#the inverse from the cache.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  
  #if inverse of matrix is already cached or not 
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv) #return a matrix which is inverse of 'x'
  }
  data <- x$get()
  # Compute the inverse of matrix
    inv <- solve(data)
    # inv <- solve(data) %*% data
  #cache the inverse matrix
  x$setInverse(inv)
 inv
}
