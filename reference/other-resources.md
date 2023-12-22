(other-resources)=
# Other Resources

## Semantic Web Technologies

ASHRAE 223P utilizes semantic information tools that provide explicit meaning to data to facilitate machine understanding and interaction. These Semantic Web technologies collectively empower the creation of machine-readable, interconnected, and interoperable data. By adopting RDF for data representation, SHACL for defining constraints, SPARQL for querying, and Turtle for human-friendly syntax, 223P enables automated understanding, integration, and analysis of information across diverse building systems. Each of these technologies are introduced below and described in greater depth in this section.

### Resource Description Framework (RDF)

At the core of the Semantic Web is RDF, a standard for representing and exchanging data in a machine-readable format. RDF provides a simple, flexible model based on triples, where each triple consists of a subject, predicate, and object. This structure forms the foundation for expressing relationships and connections between resources on the web, creating a powerful graph-based data model.  This model allows us to define how different entities related to building systems (devices, data points, zones, ducts, etc) are related to each other. The subject and object define two entities and the predicate defines how they are related. For example, an air handling unit may contain a fan. This would be described in a 223P model as AHU (subject) contains (predicate) Fan (object) as shown in Figure 1. Please visit this [RDF documentation](https://www.w3.org/TR/rdf11-concepts/) for more information.

<div align="center">

<span style="font-size: larger;">Figure 2a. Triples as diagram</span>

```{mermaid}
graph LR
AHU-- contains -->Fan
```

</div>

<!--- Mermaid is not fully supported by github pages and jupyterlab, but in the future it should be. We may be able to create figures like this
```mermaid
---
title: Figure 1. Simple Triple
---
graph LR
    AHU-- contains - ->Fan
``` --->

### Shapes Constraint Language (SHACL)

SHACL is a language for describing and validating the structure and constraints of RDF graphs. It allows developers and data modelers to define rules, or "shapes," that specify the expected structure and characteristics of RDF data. SHACL plays a critical role in ensuring data integrity, providing a means to express and enforce constraints on RDF graphs, which is particularly valuable in the context of semantic modeling for building systems and related data.

Rules used in 223P are split into two types: inference rules and validation rules. Validation ensures that information within the model conforms to rules in the standard by checking properties, types, value ranges, patterns, and other aspects of data nodes against specified criteria in the SHACL shapes. If a node in the RDF graph violates any of these constraints, it is flagged as non-compliant. Inference adds information to the graph when a rule’s conditions are met. These rules can add valuable information to a 223P model and make implicit relationships explicit.

For validation SHACL is used and for inference SHACL Advanced Features is used. To learn more about these technologies, please reference the [SHACL documentation](https://www.w3.org/TR/shacl/) and the [SHACL Advanced Features documentation](https://w3c.github.io/shacl/shacl-af/).

### SPARQL (SPARQL Protocol and RDF Query Language)

SPARQL is a query language designed specifically for querying RDF data. It enables users to retrieve, manipulate, and analyze information stored in RDF graphs. SPARQL queries are expressive and powerful, allowing for the extraction of meaningful insights from complex and interconnected semantic data. SPARQL is widely used and supported by multiple platforms. To learn about SPARQL, we recommend looking at the [SPARQL documentation](https://www.w3.org/TR/sparql11-query/).

SPARQL is the primary way that users will query data from 223P models. [Query Open223](https://query.open223.info/?url=ontologies%2F223p.ttl) provides an easy webpage to run queries. [Reference](../reference/223-query) on the use of this website are provided as well as [example models and queries](example-models) that users can experiment with.

#### Querying Models

SPARQL (SPARQL Protocol and RDF Query Language) querying is a fundamental aspect of interacting with RDF-based semantic models. SPARQL provides a powerful and expressive language for querying RDF data, enabling users to retrieve specific information from semantic graphs, insert data into graphs, or construct new graphs based on query results. With SPARQL, users can construct queries to search, filter, and extract data based on the defined relationships and properties within the RDF model. These queries can range from simple requests for specific data points to complex inquiries involving multiple patterns and conditions. For more information, please view [the SPARQL specification](https://www.w3.org/TR/sparql11-query/). SPARQL plays a key role in extracting meaningful data from 223P models. Several tools support the use of SPARQL queries to interrogate 223P models. RDFLib supports querying and is used both by BuildingMOTIF and Bob. TopBraid Composer and GraphDB both support SPARQL queries, and provide a graphical user interface for exploring semantic models. [Open 223](open223-query) also provides a SPARQL querying tool for use with 223 models.

Several other query languages are often used for graph data models, and can thus be used on 223P models. These include the Cypher language employed by Neo4J and GraphQL. Unlike SPARQL, they are not specifically for RDF.

### Terse RDF Triple Language (Turtle - TTL)

Turtle is a textual syntax for expressing RDF data in a compact and human-readable format. It provides a way to represent RDF triples more concisely than XML-based alternatives. Turtle is widely used for writing and sharing RDF data, providing a clear and efficient means of communication in both development and deployment scenarios. For more about the ttl format, please reference the [ttl documentation](https://www.w3.org/TR/turtle/).

The 223P ontology and various examples in this documentation use the ttl format to represent graph data. Graph data may also be provided in diagrams in this documentation. These diagrams should be read as a series of triples rather than as a flow chart. Figure 2 shows graph data both in ttl format and as a diagram, both of which you will encounter in this documentation.

<div align="center">

<span style="font-size: larger;">Figure 2a. Triples as diagram</span>

</div>

<div align="center">

```{mermaid}
graph LR
AHU-- contains -->Fan
AHU-- contains -->HeatingCoil
Fan-- connectedTo -->HeatingCoil
```

</div>

<div align="center">

<span style="font-size: larger;">Figure 2b. Triples as TTL textual format</span>

</div>

```
@prefix ex: <urn:example/> .
@prefix s223: <http://data.ashrae.org/standard223#> .

    ex:AHU s223:contains ex:Fan .
    ex:AHU s223:contains ex:HeatingCoil .
    ex:Fan s223:connectedTo ex:HeatingCoil .
```

## Tools for Working with ASHRAE 223P

The standard is built on Semantic Web technology, and there are many open-source and proprietary tools available to enable creation and validation of 223P models. A selection of several tools are as follows:
BuildingMOTIF:
* **SI-builder (Bob)**: This tool has been developed in Python and used in the development of the standard to simplify the creation of 223P building models. It uses an extensive class structure defining data points, equipment, and spaces in terms of 223P modeling constructs, and enables the creation of models using python scripts.
* **RDFLib/PySHACL**:  BuildingMOTIF and SI-builder provide user-friendly methods to build and validate 223P models. They both utilize the python libraries RDFLib and PySHACL. RDFLib is a Python library for working with RDF, and it provides functionalities for creating, parsing, querying, and manipulating RDF graphs. PySHACL is a Python library that provides implementation for SHACL validation and inference.
* **Apache Jena**: An open-source Java-based framework for building semantic web and linked data applications. Jena includes a triplestore and supports RDF processing, SPARQL querying, and reasoning.
* **TopBraid Composer**:TopBraid Composer is a comprehensive Semantic Web modeling tool that supports the development and visualization of RDF-based ontologies and semantic models. It has been used in the development of the standard and offers both free and paid versions. It also provides an API for utilizing its SHACL validation, which is based on Apache Jena. Apache Jena also provides other tools for interacting with graph data
* **GraphDB**: GraphDB is a triplestore that provides storage and query capabilities for RDF data. It provides support for SPARQL querying as well as visualization and exploration of semantic models.
* **Protégé**: An open-source ontology editor and framework that supports the creation and editing of RDF data. It is widely used in the development of ontologies and semantic web applications.
* **Neo4J**: Neo4j is a graph database. While not an RDF triplestore, it represents graph data in a triple-like structure, and has extensions that enable RDF-specific functionality. It uses the Cypher query language to express relationships and patterns.

There are other tools available, including many graph databases, but the above list may serve as a place to start.
