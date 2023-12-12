# Semantic Web Technologies

ASHRAE 223P utilizes semantic information tools that provide explicit meaning to data to facilitate machine understanding and interaction. These Semantic Web technologies collectively empower the creation of machine-readable, interconnected, and interoperable data. By adopting RDF for data representation, SHACL for defining constraints, SPARQL for querying, and Turtle for human-friendly syntax, 223P enables automated understanding, integration, and analysis of information across diverse building systems. Each of these technologies are introduced below and described in greater depth in this section. 

## Resource Description Framework (RDF)

At the core of the Semantic Web is RDF, a standard for representing and exchanging data in a machine-readable format. RDF provides a simple, flexible model based on triples, where each triple consists of a subject, predicate, and object. This structure forms the foundation for expressing relationships and connections between resources on the web, creating a powerful graph-based data model.  This model allows us to define how different entities related to building systems (devices, data points, zones, ducts, etc) are related to each other. The subject and object define two entities and the predicate defines how they are related. For example, an air handling unit may contain a fan. This would be described in a 223P model as AHU (subject) contains (predicate) Fan (object) as shown in Figure 1. Please visit this RDF primer for more information (link). 

<!--- Mermaid is not fully supported by github pages and jupyterlab, but in the future it should be. We may be able to create figures like this 
```mermaid
---
title: Figure 1. Simple Triple
---
graph LR
    AHU-- contains - ->Fan
``` --->

## Shapes Constraint Language (SHACL)

SHACL is a language for describing and validating the structure and constraints of RDF graphs. It allows developers and data modelers to define rules, or "shapes," that specify the expected structure and characteristics of RDF data. SHACL plays a critical role in ensuring data integrity, providing a means to express and enforce constraints on RDF graphs, which is particularly valuable in the context of semantic modeling for building systems and related data.

Rules used in 223P are split into two types: inference rules and validation rules. Validation ensures that information within the model conforms to rules in the standard by checking properties, types, value ranges, patterns, and other aspects of data nodes against specified criteria in the SHACL shapes. If a node in the RDF graph violates any of these constraints, it is flagged as non-compliant. Inference adds information to the graph when a rule’s conditions are met. These rules can add valuable information to a 223P model and make implicit relationships explicit. 

For inference and validation rules 223P uses SHACL (ref. ) as well as SHACL Advanced Features (ref. https://w3c.github.io/shacl/shacl-af/).

## SPARQL (SPARQL Protocol and RDF Query Language)

SPARQL is a query language designed specifically for querying RDF data. It enables users to retrieve, manipulate, and analyze information stored in RDF graphs. SPARQL queries are expressive and powerful, allowing for the extraction of meaningful insights from complex and interconnected semantic data. SPARQL is widely used and supported by multiple platforms. To learn about SPARQL, we recommend looking at the SPARQL documentation (link).

SPARQL is the primary way that users will query data from 223P models. Query Open223 (link) provides an easy webpage to run queries. Tutorials on the use of this website are provided (link) as well as example models and queries (link) are provided.

## Terse RDF Triple Language (Turtle - TTL)

Turtle is a textual syntax for expressing RDF data in a compact and human-readable format. It provides a way to represent RDF triples more concisely than XML-based alternatives. Turtle is widely used for writing and sharing RDF data, providing a clear and efficient means of communication in both development and deployment scenarios. For more about the ttl format, please reference (link)

The 223P ontology (link) and various examples in this documentation use the ttl format to represent graph data. Graph data may also be provided in diagrams in this documentation. These diagrams should be read as a series of triples rather than as a flow chart. Figure 2 shows graph data both in ttl format and as a diagram, both of which you will encounter in this documentation. 

<div align="center">
    
<span style="font-size: larger;">Figure 2a. Triples as diagram</span>

</div>

```{mermaid}
graph LR
AHU-- contains -->Fan
AHU-- contains -->HeatingCoil
Fan-- connectedTo -->HeatingCoil
```

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

