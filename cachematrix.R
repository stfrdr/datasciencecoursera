## The makeVector function and cacheMean functions are both functions that store numeric vectors and cache their means. Specifically, the makeVector function sets and gets the value of the vector, as well as sets and gets the value of the mean. The cacheMean function calculates the mean of the vector created with the makeVector function and chekcs to see if the mean was calculated. If the mean was calculated, it receives it and skips the computational process which saves time. If the mean wasn't received, it uses the setmean function to calculate and set the value of the mean in the cache. 

## sets and gets the value of the vector, as well as sets and gets the value of the mean.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  
  set <- function(y) {
    x <<- y    
    m <<- NULL
  }
  get <- function() x

  setInverse <- function(inverse) m <<- inverse
  getInverse <- function() m
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}



## calculates the mean of the vector created with the makeVector function and chekcs to see if the mean was calculated

cacheSolve <- function(x, ...) {
  m <- x$getInverse() 
  if(!is.null(m)) { 
    message("getting cached data")
    return(m)
  }
  data <- x$get()  
  m <- solve(data) 
  x$setInverse(m)
  m                
}
