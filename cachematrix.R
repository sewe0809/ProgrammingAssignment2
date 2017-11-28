## Put comments here that give an overall description of what your
## functions do

<<<<<<< HEAD

# The code of the following functions relies on the deep assignment arrow, <<-.
# The deep assignment arrow causes a search through parent environments to find
# an existing definion of the variable. In case such a variable is found it is
# redifined. If <<- does not find such an existing variable it will creat the
# variable in the global environment.
<<<<<<< HEAD
#
=======
## Write a short comment describing this function

>>>>>>> parent of 340993c... 2017-02-17
=======

>>>>>>> parent of 88842c5... a
makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse) 
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}


mdat <- matrix(rnorm(10*10), nrow = 10, ncol =10)
#
a <- makeCacheMatrix(mdat)
cacheSolve(a)




