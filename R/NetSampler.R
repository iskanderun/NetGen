# Network Sampling program

# R code that calls Fortran

# specify all parameter values
# import and run FORTRAN subroutine SubSamping.so
# output files are:
#       out_name -- main output file with info on the sunetwork
#       abund.txt / degree.txt / module.txt
#       subnet.txt  -- sampled network
#       netnodes.txt -- nodes in red or blue if belong subnet or not
#       netlinks.txt --  links in red or blue if connect subnet or not

# network name
#
net_name = 'network.txt'

# output file name (see details below)
#
out_name = 'degsamp5.txt'

# sampling criteria for key nodes and neighbors
#
# criterion for key nodes
# 0 for random
# 1 for lognormal
# 2 for Fisher log series
# 3 for exponential
# 4 for degree
# 5 for module
#
# criterion for neighbors
# 0 = random
# 1 = weighted according to exponential distribution
#
crit = c(4,0)


# number of key nodes to sample, from mi to mf at steps of delta-m
# and number of realizations nr
# [mi,mf,delta-m,nr]
#
key_nodes = c(10, 50, 10, 1000)


# number of first neighbors or fraction of first neighbors to include
# if 0 < anfn <= 1 it is interpreted as a fraction of the total number of neighbors
# otherwise as the number of neighbors
# to add all neighbors use 1.0
# to add 1 neighbor per node use 1.1
# to add 2 neighbours use 2, etc
#
anfn = 0.5


# number of modules to exclude
#
numb_hidden = 0

# list of modules to exclude (max 10 modules; only the first numb_hidden are used)
#
hidden_modules = c(1,5,6,0,0,0,0,0,0,0)

#.Fortran("subsampling", net_name,out_name,crit,key_nodes,anfn,numb_hidden,hidden_modules)


# the output file has eleven columns with the following results:
# m  ssn  slc  rslc  hn  ncomp  V-ssn  V-slc   V-rslc  V-hn  V-ncomp
#
#where
#
# m = number of key nodes
# ssn = average size of sampled network
# slc = average size of largest connected component
# rslc = average size of largest connected component / ssn
# hn = average number of hidden nodes found
# ncomp = average number of components of sampled networks
# V-ssn = variance of size of sampled network
# V-slc = variance of size of largest connected component
# V-rslc = variance of size of largest connected component / ssn
# V-hn = variance of number of hidden nodes found
# V-ncomp = variance of number of components of sampled networks

