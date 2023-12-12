# Open223 Documentation [![Jupyter Book Badge](https://jupyterbook.org/badge.svg)](https://open223.github.io/docs.open223.info/)

ASHRAE standard 223P is a proposed standard that formally defines knowledge concepts for representing building system information such as the connections between (pieces of) mechanical equipment, spaces within a building, and their measurement and control points. It is a metadata schema (semantic ontology?) that defines the modeling constructs and rules needed to construct semantically interoperable, machine-readable semantic models that provide software applications the ability to determine essential information about the meaning and context of building data to support the deployment of various advanced features such as advanced building controls, fault detection and diagnostics, and automated commissioning. 

For more information about the standard itself, check the 223p publication document (will this be available?) and website (link). 
Maybe mention external references/bacnet, though that has a section later
Beyond just the RDF representation, Standard 223 uses the SHACL (Shapes Constraint Language) (ref. https://www.w3.org/TR/shacl/) to specify the conformance requirements for using the defined classes and predicates in allowed ways. These requirements are specified using SHACL validation rules.

Using Diataxis Framework: https://diataxis.fr/

TODO: Delete this in favor of table of contents

Document Flow
- Main Page
  - Purpose of User Guide 
- Explanation
  - Introduce 223P and classes at a high level
  - Supporting Technologies
     - RDF
     - SHACL (inference and validation)
     - SPARQL
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
  - may want substructure
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
