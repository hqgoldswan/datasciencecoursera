## Caching the inverse of matrix
## makeCacheMatrix function creates a special "matrix" object that can cache its inverse.
#1.  set the value of the matrix
#2.  get the value of the matrix
#3.  set the value of the inverse
#4.  get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {

	# inv will store the cached inverse matrix
	i <- NULL

	# Setter for the matrix
    set <- function(y) {
      x <<- y
      i <<- NULL
    }

    # Getter for the matrix
    get <- function() x

    # Setter for the inversed value
    setinv <- function(solve) i <<- solve

    # Getter for the inversed value
    getinv <- function() i

    # Return the matrix with our newly defined functions
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## `cacheSolve` function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. 
## If the inverse has already been calculated (and the matrix has not changed),
## then`cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i<- x$getinv()

    # In case inversed matrix is available, just return it
    if(!is.null(i)) {
      message("getting cached data")
      return(i)
    }

    # In case inversed matrix is not available, use solve to get it
    # In this case, we assume that the input matrix is square invertible
    data <- x$get()
    i <- solve(data, ...)
    x$setinv(i)
    i
}