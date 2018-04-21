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
    affiliation: 1 # (Multiple affiliations must be quoted)
  - name: Erica A. Newman
    orcid: 0000-0001-6433-8594
    affiliation: "2, 3"
  - name: Mathias M. Pires
    orcid: 0000-0003-2500-4748
    affiliation: 4
  - name: Carl Boettiger
    orcid: 0000-0002-1642-628X
    affiliation: 5    
    
affiliations:
 - name: Universidade Estadual de Campinas: Campinas, SP, Brazil
   index: 1
 - name: University of Arizona
   index: 2
 - name: USDA Forest Service
   index: 3
 - name: Institution 4
   index: 4
 - name: University of California, Berkeley: Berkeley, CA, USA
   index: 5
date: 20 April 2018
bibliography: paper.bib
---

# Summary

The forces on stars, galaxies, and dark matter under external gravitational
fields lead to the dynamical evolution of structures in the universe. The orbits
of these bodies are therefore key to understanding the formation, history, and
future state of galaxies. The field of "galactic dynamics," which aims to model
the gravitating components of galaxies to study their structure and evolution,
is now well-established, commonly taught, and frequently used in astronomy.
Aside from toy problems and demonstrations, the majority of problems require
efficient numerical tools, many of which require the same base code (e.g., for
performing numerical orbit integration).

``EcoNetGen`` is an R package for generating networks with specified size, expected degree, 
and topological structure, and then sampling from these simulated networks with ...
This R package calls FORTRAN code for efficient generation of large networks.
Python
enables wrapping low-level languages (e.g., C) for speed without losing
flexibility or ease-of-use in the user-interface. The API for ``Gala`` was
designed to provide a class-based and user-friendly interface to fast (C or
Cython-optimized) implementations of common operations such as gravitational
potential and force evaluation, orbit integration, dynamical transformations,
and chaos indicators for nonlinear dynamics. ``Gala`` also relies heavily on and
interfaces well with the implementations of physical units and astronomical
coordinate systems in the ``Astropy`` package [@astropy] (``astropy.units`` and
``astropy.coordinates``).

``Gala`` was designed to be used by both astronomical researchers and by
students in courses on gravitational dynamics or astronomy. It has already been
used in a number of scientific publications [@Pearson:2017] and has also been
used in graduate courses on Galactic dynamics to, e.g., provide interactive
visualizations of textbook material [@Binney:2008]. The combination of speed,
design, and support for Astropy functionality in ``Gala`` will enable exciting
scientific explorations of forthcoming data releases from the *Gaia* mission
[@gaia] by students and experts alike. The source code for ``EcoNetGen`` is
archived to Zenodo with the linked DOI: [doi.org/10.5281/zenodo.1212558]

Citations to entries in paper.bib should be in
[rMarkdown](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html)
format.

Figures can be included like this: ![Example figure.](figure.png)

# Acknowledgements

Funding and support was provided by the National Institute for Mathematical and Biological Science.

# References
