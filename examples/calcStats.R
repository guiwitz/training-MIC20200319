#' Calculates stats of a data frame
#'
#' @param inDt Input data table in the long format
#' @param inMeasVar Name of the measurement column
#' @param inGroupName Name of the grouping column (default NULL)
#' @param inRobust If true, the function calculates median instead of the mean (default False)
#'
#' @return Data table with summary stats
#' @export
#' @import data.table
#'
#' @examples
#' # example usage 

calcStats = function(inDt, inMeasVar, inGroupName = NULL, inRobust = F) {
  require(data.table)
  
  if (is.null(inDt))
    stop("input data.table is NULL")
  
  if(!is.data.table(inDt))
    stop("input is not a data.table")
  
  if(nrow(inDt) == 0)
    stop("input data.table has 0 rows")
  
  if(!(inMeasVar %in% names(inDt)))
    stop("column name does not exist in the data.table")
  
  if(!is.logical(inRobust))
    stop("argument inRobust must be logical, TRUE or FALSE")
  
  if (inRobust) {
    outDt = inDt[, .(medianMeas = median(get(inMeasVar))), by = inGroupName]
  } else {
    outDt = inDt[, .(meanMeas = mean(get(inMeasVar))), by = inGroupName]
  }
  
  return(outDt)
}