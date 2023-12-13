# Open223 Documentation [![Jupyter Book Badge](https://jupyterbook.org/badge.svg)](https://open223.github.io/docs.open223.info/)

ASHRAE standard 223P is a proposed standard that formally defines knowledge concepts for representing building system information such as the connections between mechanical equipment, spaces within a building, and their measurement and control points. It is a metadata schema and semantic ontology that defines the modeling constructs and rules needed to construct semantically interoperable, machine-readable semantic models that provide software applications the ability to determine essential information about the meaning and context of building data to support the deployment of various advanced features such as advanced building controls, fault detection and diagnostics, and automated commissioning. 

````{margin}
```{note}
Publication document is not yet publicly published
```
````
For more information about the standard itself, please use the published standard document. 

The purpose of this user guide is to serve as a brief overview on how to interact with ASHRAE Standard 223P. The guide is designed to prime users with a basic understanding of the standard and several essential processes to 223P usage including building, validating, and querying 223P models. It also introduces some relevant tools and sample use cases to enable individuals to begin experimenting with the proposed standard.

Using Diataxis Framework: https://diataxis.fr/

TODO: Delete when complete 

Document Flow
- Main Page
  - Purpose of User Guide 
- Explanation
    - Introduce 223P and classes at a high level
    - Supporting Technologies
- Tutorials 
    - Using 223 Explore
    - Using Query 223
    - Tutorials for Model Creation Tools
        - Link to BMotif
        - link to Bob 
        - TopBraid Composer 
    - Using RDFLib and PySHACL (or topbraid) to Create, Query, and Validate
- Guides
    - How to Model
        - Connectivity
            - Mediums 
        - Containment
        - FunctionBlocks and Controllers
        - Sensors and Actuators
        - Properties and Aspects
    - How to Access Telemtry Data
    - BACnet as example
    - How to Extend the Standard
        - Describing G36
- Reference
    - Supporting Technologies References
        - Links documentation to SHACL, RDFS, RDF, SPARQL, etc.
    - Publication document? 
    - Available Tools
    - Open 223
        - Explore 223
        - Query 223
 - Example Models
        - Bullets with quick description of each model and a link

## Table of Contents
```{tableofcontents}
```
