## Code template
# Author: ...
# Date: ...
# 
# Purpose of the code.
# Things the code needs as in input, e.g. format of input data.
# What does the code output and in which format.

## Load libraries ----
library(data.table)
library(ggplot2)

## Global variables ----
# Create lists with parameters for easy recall
lParRW = list(
  fileIn = "path-to-input-file.csv",
  fileOut = "path-to-output-file.csv",
)

lPar = list(
  nLengthOfMedianFilter = 11,
  sDistMeas = "euclidean"
)

# Column names
lCol = list(
  time = "Time_h",
  meas = "sensor_ch0",
  group = "Exp_cond"
)

## Custom functions ----

# Define custom functions or 
# load from an external file
locMyFunction = function(...) {
  ...
}

source("path-to/myFunctionLibrary.R")

## Read data ----

dt = fread(lParRW$fileIn)

## Calculations ----

...

## Save output data ----

fwrite(x = dt, 
       file = lParRW$fileOut)

## Save results ----
fwrite(dt, lPar$fileOut)

## Save plots ----
p1 = ggplot2(dt,
             aes(x = ...,
                 y = ...)) +
  geom_line(aes(color = group))

ggsave(filename = "myPlot.pdf", 
       plot = p1)