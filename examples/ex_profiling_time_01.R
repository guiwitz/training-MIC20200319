# Code profiling using interactive RStudio GUI
# The code creates a large matrix and subtracts from every column its mean.

library(profvis)

# Define data size
nRows = 4e5
nCols = 150

# Create data
# Random Gaussian numbers with mean = 5 , sd = 1
myData = matrix(rnorm(nRows * nCols, 
                      mean = 5),
                ncol = nCols)

# Start profiling
profvis({
  # Get column means: 2 methods
  # 1. Apply the mean function to every column
  locColMeans = apply(myData, 2, mean)
  
  # 2. use colMeans function on the entire matrix
  locColMeans = colMeans(myData)
  
  # Loop over each column.
  # subtract mean from each column.
  for (ii in seq_along(locColMeans)) {
    myData[, ii] <-
      myData[, ii] - locColMeans[ii]
  }
})
