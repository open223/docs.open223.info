(tools)=
# Tools for Working with ASHRAE 223P

The standard is built on Semantic Web technology, and there are many open-source and proprietary tools available to enable creation and validation of 223P models. A selection of several tools are as follows:
BuildingMOTIF:
* **SI-builder (Bob)**: This tool has been developed in Python and used in the development of the standard to simplify the creation of 223P building models. It uses an extensive class structure defining data points, equipment, and spaces in terms of 223P modeling constructs, and enables the creation of models using python scripts.
* **RDFLib/PySHACL**:  BuildingMOTIF and SI-builder provide user-friendly methods to build and validate 223P models. They both utilize the python libraries RDFLib and PySHACL. RDFLib is a Python library for working with RDF, and it provides functionalities for creating, parsing, querying, and manipulating RDF graphs. PySHACL is a Python library that provides implementation for SHACL validation and inference.
* **TopBraid Composer**:TopBraid Composer is a comprehensive Semantic Web modeling tool that supports the development and visualization of RDF-based ontologies and semantic models. It has been used in the development of the standard and offers both free and paid versions. It also provides an API for utilizing its SHACL validation, which is based on Apache Jena. Apache Jena also provides other tools for interacting with graph data
* **GraphDB**: GraphDB is a triplestore that provides storage and query capabilities for RDF data. It provides support for SPARQL querying as well as visualization and exploration of semantic models.
* **Neo4J**: TODO Should reach out to christian about that
* **pyVis**: TODO What other visualization tools are available?

There are other tools available, but the above list may serve as a place to start.

(builder-tools)=
# Using Model Building Tools

Link to Bob with description (and note that it's not yet complete)

Link to BMOTIF