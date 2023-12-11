# Creating a Model

There are several tooling options available to create ASHRAE 223P models. BuildingMOTIF and Bob both have been used in the development of the standard to create models. They encapsulate 223P design patterns into higher level components that simplify the process of building 223P models and enable the use of scripts to build and edit models. Bob uses python classes, while BuildingMOTIF uses templates. Both of these tools have tutorials to help users get started.

* BuildingMOTIF: link
* Bob: link

There are several other free tools available to manually create 223P models. For example RDFLib is a widely used tool for working with RDF data in python. This tool is also often used to query and edit models. Alternatively, the tool TopBraid composer can be used to create building models in a graphical environment 

* RDFLib
* TopBraid Composer



The 223P documentation and website (Open223) TODO will also help model developers identify the correct classes and relationships to use when constructing or reading a 223P model. 223P defines each class using SHACL rules, which also automate validation of models to ensure they have been made in accordance with the standar.
