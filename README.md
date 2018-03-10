
[![Travis-CI Build
Status](https://travis-ci.org/cboettig/NetGen.svg?branch=master)](https://travis-ci.org/cboettig/NetGen)
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
network <- netgen(n_modav = c(500, 10), 
                  cutoffs = c(50, 10), 
                  net_type = 3, 
                  net_degree = 10,
                  net_rewire = c(0.07,0.2),
                  mod_probs = c(0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0))
```

We can plot the resulting `igraph` as an adjacency matrix:

``` r
adj_plot(network)
```

![](README-unnamed-chunk-2-1.png)<!-- -->

Network `igraph` objects can also be plotted using the standard `igraph`
plotting routines, for example:

``` r
plot(network, vertex.size= 0, vertex.label=NA, 
     edge.color = rgb(.1,0,1,.05), vertex.shape="none", 
     edge.curved =TRUE)
```

![](README-unnamed-chunk-3-1.png)<!-- -->
