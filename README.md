[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/guiwitz/training-MIC20200319/master?urlpath=rstudio)

# MIC training: Modern data analysis in R/RStudio

Presentation, the code, and exercises to accompany the [MIC training](https://ilias.unibe.ch/goto_ilias3_unibe_crs_1713478.html) at UniBe, November 3, 2020.

## File description

- `presentation-main.Rpres` and `html` - the main presentation with workshop lecture and exercises,
- `examples` - code snippets and examples for the presentation,
- `practicals` - data, presentation, and code for the practical session.

## Required software

Please download the **latest** versions of the following:

- R for macOS/Linux/Windows from [here](https://stat.ethz.ch/CRAN/), version 4.0x.
- The latest RStudio from [here](https://www.rstudio.com/products/rstudio/download/#download), version 1.3.x.

## Required R packages

The workflow is written in R and takes advantage of RStudio notebooks. The analysis uses the following packages that need to be present in your RStudio installation:

- `R.utils` for directly reading comressed files
- `magrittr` for pipes (typically loaded by other packages)
- `data.table` for fast processing of large datasets
- `readxl` for reading Excel files
- `ggplot2` for plotting
- `imputeTS` for data imputation such as interpolation of NA's
- `ggthemes` for additional color schemes in ggplot
- `plotly` for interactive plots
- `RColorBrewer` for extended colour palettes
- `pheatmap` for heatmap
- `heatmaply` for interactive heatmaps
- `scales` for percentages on y-axis in ggplots
- `factoextra` for extracting and visualisation of the results of multivariate data analyses
- `NbClust` for determining the best number of clusters
- `testthat` for unit testing
- `profvis` for profiling
- `foreach` with extension of the `for` loop
- `doParallel` for parallel computations
- `optparse` for command-line parameters


Install these packages by typing the following line in the R command-line interface:

```{r}
install.packages(c(
  "data.table", "tidyverse",
  "readxl", "R.utils",
  "ggplot2", "plotly",
  "pheatmap", "heatmaply",
  "dendextend", "RColorBrewer", "scales",
  "imputeTS", 
  "factoextra", "NbClust",
  "testthat", "profvis",
  "foreach", "doParallel",
  "optparse")) 
```

Alternatively, you can install packages using RStudio GUI by going to Tools > Install packages...
