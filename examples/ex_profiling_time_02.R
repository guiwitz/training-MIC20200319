# Code profiling using microbenchmark package
# The code creates a large matrix and subtracts from every column its mean.

require(microbenchmark)
require(data.table)
require(ggplot2)

## Define data size
nRows = 4e5
nCols = 150

# Create data
# Random Gaussian numbers with mean = 5 , sd = 1
myData = matrix(rnorm(nRows * nCols, 
                      mean = 5),
                ncol = nCols)

myColMeans = colMeans(myData)

# Prepare separate datasets for manipulation
data1 = myData
data2 = as.data.table(myData)
data3 = as.data.table(myData)

# Store column names
myColNames = names(data2)

# Perform benchmarking on 3 approaches to center columns:
# 1. using base R, loop over columns and subtract precomputed means,
# 2. using data.table with lapply,
# 3. using data.table, loop over columns and use set() function
mbm = microbenchmark(
  base_r = for (ii in seq_along(myColMeans)) {
              data1[, ii] <-
                data1[, ii] - myColMeans[ii]},
  
  dt_lapply = data2[, 
                    (myColNames) := lapply(.SD, 
                                         function(x) x - mean(x)), 
                    .SDcols = myColNames],
  
  dt_for_set = for (ii in myColNames) 
    set(data3, 
        j = ii, 
        value = data3[[ii]] - mean(data3[[ii]])),
  
  times = 100L)

# Display benchmark table
mbm

# Plot results
ggplot(mbm) +
  geom_violin(aes(x = expr, y = time)) +
  coord_flip()
