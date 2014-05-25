## These functions will enable the evauluation and caching of the inverse of a matrix.
## The matrix has to be invertible.

## I was able to validate the following code works using the test cases at:
## https://class.coursera.org/rprog-003/forum/thread?thread_id=650

## This function creates a list of functions.

makeCacheMatrix <- function(x = matrix()) {

 m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)

}


## This function tries first to find the already solved matrix inverse and returns it if available.
## If not it solves the inverse of a matrix and caches the result.

cacheSolve <- function(x) {

        ## Return a matrix that is the inverse of 'x'
	m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
}
