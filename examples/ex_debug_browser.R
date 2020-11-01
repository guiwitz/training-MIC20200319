## Count the number of event numbers in a vector
# Includes browser() function to enter
# an interactive environment and inspect the state
# of the program.

# Input vector with numbers
vX = c(7,2,8,1,3,17,6,34,37,67,101)

# Initialise counter
nCount = 0

# Loop over the vector
for (val in vX) {
  if(val %% 2 == 0) {
    nCount = nCount+1
    cat(val, "is an even number\n")
  }
  browser()
}

# Print the final result
cat(nCount, "even number(s) found.")
