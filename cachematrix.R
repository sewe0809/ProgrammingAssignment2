

# The code of the following functions relies on the deep assignment arrow, <<-.
# The deep assignment arrow causes a search through parent environments to find
# an existing definion of the variable. In case such a variable is found it is
# redifined. If <<- does not find such an existing variable it will creat the
# variable in the global environment.

makeCacheMatrix <- function(x = matrix()) {
        # This function, creates a special 'matrix', which is a list containing a
        # function to a) set the value of the matrix, b) get the value of the matrix, c)
        # set the value of the inverse, d) get the value of the inverse 
        # 
        # Args: 
        #   x: A matrix
        #
        # Returns: 
        #   A list of functions to set and get the matrix, and to set and get the
        #   inverse.
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}

cacheSolve <- function(x, ...) {
        # This function calculates the inverse of the special 'matrix' created with the
        # makeCacheMatrix function.  However, it first checks to see if the inverse has
        # already been calculated. If so, it gets the inverse from the cache and skips
        # the computation.  Otherwise, it calculates the inverse of the data and sets the
        # value of the inverse in the cache via the setinverse function. 
        # 
        # Args: 
        #   x: A makeCacheMatrix object 
        # 
        # Returns: 
        #   The inverse of the matrix in the makeCacheMatrix object.
        m <- x$getinverse()
        if (!is.null(m)) {
                # Checks if m is not empty, if not empty gets the cached data stored in m
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}