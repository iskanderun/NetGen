library(testthat)


test_that("we can create a mixed type network", {
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


test_that("we can create all types of network", {
        n_modav <- c(250,20)
        cutoffs <- c(15,5)
        net_type <- 0
        net_degree <- 10.0
        net_rewire <- c(0.07,0.2)
        mod_probs <- c(0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0)

        M <- netgen(n_modav,cutoffs,1,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,2,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,3,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,41,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,51,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,42,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")
        M <- netgen(n_modav,cutoffs,52,net_degree,net_rewire,mod_probs)
        expect_is(M, "igraph")

})
