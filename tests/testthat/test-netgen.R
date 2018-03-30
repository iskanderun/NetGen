library(testthat)


test_that("we can create a nested network", {
n_modav <- c(500,30)
cutoffs <- c(15,5)
net_type <- 0
net_degree <- 10.0
net_rewire <- c(0.07,0.2)
mod_probs <- c(0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0)

M <- netgen(n_modav,cutoffs,net_type,net_degree,net_rewire,mod_probs)

expect_is(M, "igraph")
p1 <- adj_plot(M)
expect_is(p1, "ggplot")

})
