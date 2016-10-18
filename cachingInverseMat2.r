##Function creates a special ¡°matrix¡± and provides function to set values,
##get values,set inverse, get inverse
makeCacheMatrix2 <- function(x = matrix()) {
    I <- NULL
    set <- function(y) {
        x <<- y
        I <<- NULL
    }
    get <- function() x
    setInverse <- function(solve) {
        I <<- solve
        ## store the matrix that resulted in getting inverse
        ## so we can compare next time for equality if we can reuse old inverse or
        ##recalculate
        stored <<- x
    }
    getInverse <- function() I
    getStored <- function() stored
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse,
         getStored = getStored)
}

## Below  Function will look into cache to see if inverse exist for matrix and 
##retrieve the value. if its the same matrix but will calculate if no inverse exist 
##or matrix is not same.
cacheSolve2 <- function(x,...) 
{
    ## Return a matrix that is the inverse of ¡®x¡¯
    I <- x$getInverse()
    if(!is.null(I))
    {
        ##check to see if nrow and ncol for new matrix is same as the one stored whose ##inverse is cached
        if((nrow(x$getStored()) == nrow(x$get())) && (ncol(x$getStored()) == ncol(x$get())))
        {
            ##check to see if the new matrix is identical to stored one
            ##after they are found to have same nrow and ncol
            if(identical(x$getStored(),x$get()))
            {
                message("getting cached data")
                return(I)
            }
        }
    }
    data <- x$get()
    I <- solve(data)
    x$setInverse(I)
    I
}
c(1,2)
