# Network Generator program
# R code that calls Fortran
# specify all parameter values
# import and run FORTRAN subroutine SubGen.so
#
# output files are written to ouput_gen subdirectory:
#
#     name_net.txt
#     name_prop.txt
#     name_adj.txt
#     name_net.png
#     name_adj.png
#
# where "name" is specified by user

# a list of all networks created, along with the most important parameters are saved in the log file
#     log_net.txt

# network name
name = 'nested003'
# network size and average module size
n_modav = c(500,30)
# module and submodule minimum sizes
# (submodules are used only for bipartite and tripartite networks)
cutoffs = c(15,5)
# network type
# 0 = mixed
# 1 = random
# 2 = scalefree
# 3 = nested
# 41 = bi-partite nested
# 42 = bi-partite random
# 51 = tri-trophic bipartite nested-random
# 52 = tri-trophic bipartite nested-bipartite nested
net_type = 3
# average degree
net_degree = 10.0
# global and local  network rewiring probabilities
net_rewire = c(0.07,0.2)
# module probabilities for types 1 to 51
# used for constructing mixed networks, net_type = 0
mod_probs = c(0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0)

netgen(name,n_modav,cutoffs,net_type,net_degree,net_rewire,mod_probs)
