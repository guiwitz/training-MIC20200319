# MIC training: Modern data analysis in R/RStudio

Presentation, the code, and exercises to accompany the [MIC training](https://ilias.unibe.ch/goto_ilias3_unibe_crs_1713478.html) at UniBe, 19 March, 2020 (postponed to an unkown date!).

## File description

- `presentation-main.Rpres` and `html` R presentation with workshop lecture and exercises.

## Required packages

The workflow is written in R and takes advantage of RStudio notebooks. Please download the latest RStudio from [here](https://www.rstudio.com/products/rstudio/download/#download).

The analysis uses the following packages that need to be present in your RStudio installation:

- `data.table` for fast processing of large datasets
- `readxl` for reading Excel files
- `R.utils` for directly reading comressed files
- `imputeTS` for data imputation such as interpolation of NA's
- `ggplot2` for plotting
- `plotly` for interactive plots
- `pheatmap` for heatmap
- `heatmaply` for interactive heatmaps
- `RColorBrewer` for extended colour palettes
- `scales` for percentages on y-axis in ggplots
- `dtwclust` for dynamic time warping distance measure
- `magrittr` for pipes (typically loaded by other packages)
- `factoextra` for extracting and visualisation of the results of multivariate data analyses
- `cluster` for extended cluster analysis
- `NbClust` for determining the best number of clusters

Install these packages by typing:

```
install.packages(c(
					"data.table", "tidyverse",
					"readxl", "R.utils",
					"ggplot2", "plotly",
					"pheatmap", "heatmaply",
					"dendextend", "RColorBrewer", "scales",
					"imputeTS", 
					"dtwclust", "factoextra", "cluster", "NbClust")) 
```