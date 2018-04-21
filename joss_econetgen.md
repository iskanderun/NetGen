---
title: 'EcoNetGen: An R package for generating and sampling from ecological interaction networks'
tags:
  - R
  - networks
  - ecological interactions
  - network topology
  - ecology
authors:
  - name: Marcus A. M. de Aguiar
    orcid: 0000-0003-1379-7568
    affiliation: 1 
  - name: Erica A. Newman
    orcid: 0000-0001-6433-8594
    affiliation: "2, 3"
  - name: Mathias M. Pires
    orcid: 0000-0003-2500-4748
    affiliation: 1
  - name: Carl Boettiger
    orcid: 0000-0002-1642-628X
    affiliation: 4    
    
affiliations:
 - name: Universidade Estadual de Campinas, Unicamp; Campinas, São Paulo, Brazil
   index: 1
 - name: University of Arizona; Tucson, Arizona, USA
   index: 2
 - name: USDA Forest Service; Seattle, Washington, USA
   index: 3
 - name: University of California, Berkeley; Berkeley, California, USA
   index: 4
date: 20 April 2018
bibliography: paper.bib
---

# Summary

Ecological interactions are commonly modeled as interaction networks. Analyses 
of such networks may be sensitive to sampling biases and detection issues in both 
the interactors and interactions (nodes and links). Yet, statistical biases 
introduced by sampling error are difficult to quantify in the absence of full 
knowledge of the underlying network’s structure. XXX These allow the 
generation and sampling of several types of large-scale modular networks with 
predetermined topologies, representing a wide variety of communities and types 
of ecological interactions. Networks can be sampled according to designs 
employed in field observations. We demonstrate, through first uses of this software, 
that underlying network topology interacts strongly with empirical sampling design, 
and that constructing empirical networks by starting with highly connected species 
may be the give the best representation of the underlying network. 

``EcoNetGen`` is an R package for generating networks with specified size, expected degree, 
and topological structure, and then sampling from these simulated networks with ...
Simulations and sampling routines are implemented in FORTRAN, providing efficient 
generation times even for large networks.

``EcoNetGen`` was designed to xxx 
The source code for ``EcoNetGen`` is
archived to Zenodo with the linked DOI: [doi.org/10.5281/zenodo.1212558]


# Acknowledgements

This work was conducted as a part of the Ecological Network Dynamics Working Group at the National Institute for Mathematical and Biological Synthesis (NiMBIOS), sponsored by the National Science Foundation through NSF Award #DBI-1300426, with additional support from The University of Tennessee, Knoxville. MAMA was partly supported by FAPESP (grants #2016/06054-3 and # 2016/01343-7) and CNPq (grant #302049/2015-0). We thank NiMBIOS workshop organizers D.H. Hembry, J.L. O'Donnell, T. Poisot, and P. Guimarães, Jr.. 


# References

