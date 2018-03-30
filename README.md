
[![Travis-CI Build
Status](https://travis-ci.org/cboettig/NetGen.svg?branch=master)](https://travis-ci.org/cboettig/NetGen)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/cboettig/NetGen?branch=master&svg=true)](https://ci.appveyor.com/project/cboettig/NetGen)
[![Coverage
Status](https://img.shields.io/codecov/c/github/cboettig/NetGen/master.svg)](https://codecov.io/github/cboettig/NetGen?branch=master)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/NetGen)](https://cran.r-project.org/package=NetGen)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

<!-- README.md is generated from README.Rmd. Please edit that file -->

# NetGen

## Installation

You can install NetGen from github with:

``` r
# install.packages("devtools")
devtools::install_github("cboettig/NetGen")
```

## Example

This is a basic example which generates a network. See `?netgen` for
documentation describing the parameter arguments.

``` r
library(NetGen)
network <- netgen(n_modav = c(250, 20), 
                  cutoffs = c(50, 5), 
                  net_type = 41, 
                  net_degree = 10,
                  net_rewire = c(0.07,0.2),
                  mod_probs = c(0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0))
#> 
#> module count = 4 
#> average degree = 8.716 
#> average module size = 62.5 
#> number of components = 1 
#> size of largest component = 250
```

We can plot the resulting `igraph` as an adjacency matrix:

``` r
adj_plot(network)
```

![](README-unnamed-chunk-2-1.png)<!-- -->

Network `igraph` objects can also be plotted using the standard `igraph`
plotting routines, for example:

``` r
library(igraph)
#> 
#> Attaching package: 'igraph'
#> The following objects are masked from 'package:stats':
#> 
#>     decompose, spectrum
#> The following object is masked from 'package:base':
#> 
#>     union
plot(network, vertex.size= 0, vertex.label=NA, 
     edge.color = rgb(.22,0,1,.02), vertex.shape="none", 
     edge.curved =TRUE, layout = layout_with_kk)
```

![](README-unnamed-chunk-3-1.png)<!-- -->

And we can compute common statistics from igraph as well. Here we
confirm that clustering by “edge betweeness” gives us the expected
number of modules:

``` r
community <- cluster_edge_betweenness(as.undirected(network))
length(groups(community))
#> [1] 4
```

We can check the size of each module as well:

``` r
module_sizes <- sapply(groups(community), length)
module_sizes
#>  1  2  3  4 
#> 60 71 55 64
mean(module_sizes)
#> [1] 62.5
```

``` r
mean(degree(as.undirected(network)))
#> [1] 8.744
```
