# Network Generator program
# Python code that calls Fortran

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


#  --------  network generation ---------
#
#
import FortranNetGen

# network name
name = 'nested003'

# network size and average module size
n_modav = [500,30]


# module and submodule minimum sizes
# (submodules are used only for bipartite and tripartite networks)
cutoffs = [15,5]

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
net_rewire = [0.07,0.2]

# module probabilities for types 1 to 51
# used for constructing mixed networks, net_type = 0
mod_probs = [0.2, 0.0, 0.3, 0.3, 0.2, 0.0, 0.0]


# Call FORTRAN routine
FortranNetGen.subnetgen(name,n_modav,cutoffs,net_type,net_degree,net_rewire,mod_probs)
#
#
#  -------- end network generation ---------




#  -------- plot network and adjacency matrix  -----------
#
#
import networkx as nx
import matplotlib.pyplot as plt
import numpy as np

plt.close('all')

G=nx.Graph()
array = np.loadtxt("./output_gen/"+name+"_net.txt")
G.add_edges_from(array)


# node color is set to blue in commands nx.draw_spring and plt.scatter
# example of available colors are
# 'b' = blue
# 'r' = red
# 'k' = black
# 'g' = green
# 'c' = cyan
# 'm' = magenta
# 'y' = yellow
# 'w' = white

color_net = 'b'

plt.figure(1)
nx.draw_spring(G,node_size=40,node_color=color_net)
plt.show()
plt.title("Network")
plt.savefig("./output_gen/"+name+"_net.png")



# plot adjacency matrix and save image
plt.figure(2)
plt.show()
adjx, adjy = np.loadtxt("./output_gen/"+name+"_net.txt",dtype = [('a','int'), ('b','int')], unpack=True)
plt.scatter(adjx,adjy,s=3,color=color_net)
plt.scatter(adjy,adjx,s=3,color=color_net)
plt.axis([0,max(adjy),0,max(adjy)])
plt.title("adjacency matrix")
plt.savefig("./output_gen/"+name+"_adj.png")
#
#
#  -------- end plotting  -----------
