require(testthat)
source("../calcStats.R")

testthat::test_that("tests", {
  
  # Testing for errors
  # data.table is null
  expect_error(calcStats(inDt = NULL, 
                         inMeasVar = "dummy"))
  
  # input is not a data.table
  expect_error(calcStats(inDt = data.frame(x = 1,
                                           y = 1),
                         inMeasVar = "dummy"))
  
  # input data.table has 0 rows
  expect_error(calcStats(inDt = data.table(),
                         inMeasVar = "dummy"))
  
  # input column name does not exist in the data.table
  expect_error(calcStats(inDt = data.table(x = 1,
                                           y = 1),
                         inMeasVar = "yy"))
  
  # inRobust is not logical
  expect_error(calcStats(inDt = data.table(x = 1,
                                           y = 1),
                         inMeasVar = "y",
                         inRobust = "a"))
  
  # Test calculations
  require(data.table)
  locDT = data.table(group = rep(c(1,2), each = 4),
                     meas = seq(1, 8, 1))
  
  # Calculate the mean for the entire table
  locResCalc = calcStats(inDt = locDT,
                         inMeasVar = "meas",
                         inRobust = F)
  locResTrue = data.table(meanMeas = 4.5)
  expect_equal(locResCalc, locResTrue)
  
  # Calculate the mean per group
  locResCalc = calcStats(inDt = locDT,
                         inMeasVar = "meas",
                         inGroupName = "group",
                         inRobust = F)
  locResTrue = data.table(group = c(1, 2),
                          meanMeas = c(2.5, 6.5))
  expect_equal(locResCalc, locResTrue)
  
  # Calculate the median per group
  locResCalc = calcStats(inDt = locDT,
                         inMeasVar = "meas",
                         inGroupName = "group",
                         inRobust = T)
  locResTrue = data.table(group = c(1, 2),
                          medianMeas = c(2.5, 6.5))
  expect_equal(locResCalc, locResTrue)
})