

#The following R file containes 2 functions.

#This first function: makeCacheMatrix creates a R matrix object that contains functions in order to get and set
#a matrix of numbers and to get and set its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {  #set function
    x <<- y
    m <<- NULL
  }
  get <- function() x  #get function
  
  setInverse <- function (inverse)  m<<-inverse  #setInverse function
  getInverse <- function () m   #getInverse function
  matrix(list(set=set,get=get,setInverse=setInverse, getInverse=getInverse)2,2)   #matrix with different elements
  
}



#This second function looks on the object returned by the first one and sees if the inverse matrix has been calculated.
#If so, it returns its value, otherwise it calculates it.

cacheSolve <- function(x, ...) {
  
  m<- x[[2,2]]()  #Element 2,2 has the getInverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x[[2,1]]()  #Get function to calculate the inverse
  m<-solve(data,...) #Inverse calculation
  x[[1,2]](m) #set the inverse object in the matrix
  m #return the inverse
}

