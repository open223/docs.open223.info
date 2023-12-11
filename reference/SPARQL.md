# Querying Models

SPARQL (SPARQL Protocol and RDF Query Language) querying is a fundamental aspect of interacting with RDF-based semantic models. SPARQL provides a powerful and expressive language for querying RDF data, enabling users to retrieve specific information from semantic graphs, insert data into graphs, or construct new graphs based on query results. With SPARQL, users can construct queries to search, filter, and extract data based on the defined relationships and properties within the RDF model. These queries can range from simple requests for specific data points to complex inquiries involving multiple patterns and conditions. It plays a key role in extracting meaningful data from 223P models. Several tools support the use of SPARQL queries to interrogate 223P models. RDFLib supports querying and is used both by BuildingMOTIF and Bob. TopBraid Composer and GraphDB both support SPARQL queries, and provide a graphical user interface for exploring semantic models. 

SPARQL querying basics: The SPARQL querying language is used in SHACL graphs. While SHACL graphs use multiple subject-predicate-object expressions to describe complex relationships. SPARQL is used to query specific information from those complex relationships of SHACL graphs. For example, SPARQL can retrieve SHACL subject-predicate-object expressions with a specific subject, a specific predicate, a specific object, or any combinations of subject, predicate, and object. 

In the model usage section ___ below, a tutorial shows how to run SPARQL competency questions on 223P models. Open223 provides these example models and queries, and also allows users to upload their own building models and write their own SPARQL queries for further testing.

Several other query languages are often used for graph data models. These include the Cypher language employed by Neo4J and GraphQL. Unlike SPARQL, which is designed specifically for RDF, they can still be used on 223P models. 

In example ___ below, a tutorial 
