## the goal of this function is to cache results from the original syntax in order to save
## compute resources when those results will need to be used for a following syntax.

## the first part of the assignment sets the value of the matrix and retrieves the results

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## the second part of this assignment returns the inverse of the matrix, but first
## checks to see if it had been created and if it can be fetched from cache

cacheSolve <- function(x, ...) {
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("retrieving cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data)
    x$setinverse(inv)
    inv
}

