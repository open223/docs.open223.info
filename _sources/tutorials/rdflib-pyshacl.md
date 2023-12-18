---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# How to Load, Validate, Update, and Query 223P models

The purpose of this tutorial is to show a basic workflow for using 223P models. This workflow may be accomplished using a variety of tools, but to demonstrate these basic processes, the open-source python libraries RDFLib and PySHACL are used. This workflow assumes that you have basic familiarity with RDF graphs and 223P. 

## Creating or Loading a 223P Model

It is recommended that model developers use the (model building tools)[builder-tools] or potentially other existing (open-source or commercial products)[tools] to create 223P models. Creating a 223P model means representing the information present in a target buidling using 223P constructs. The result of each of these model building tools should be a 223P model in ttl or another format, that can be shared with other developers and used. 

For this tutorial an example equipment model for a Variable Air Volume Box is loaded into RDFLib (link G36 model) to show some of the key processes for using a 223P model. There are several key parts of creating a 223P model that are broken-down in this tutorial. For more on how to use RDFLib, please visit the RDFLib documentation. 

### Namespace definition 

Your model should be created with its own namespace. A namespace is a mechanism used to uniquely identify and distinguish terms, such as classes, properties, and individuals, within an RDF graph to avoid naming conflicts between terms from different sources.

The namespaces for any other vocabolaries or ontologies (such as 223P, RDFS, or QUDT) should also be defined or brought into the script so that these vocabularies can be easily used. Some namespaces, such as RDF and RDFS, are already defined in RDFLib and can be imported. 

```{code-cell}
from rdflib import Graph
from rdflib.namespace import RDF, RDFS, Namespace

# Define namespaces
EX = Namespace("urn:example/")
QUDT = Namespace("http://qudt.org/schema/qudt#")
S223 = Namespace('http://data.ashrae.org/standard223#')
```

### Creating a Graph and Loading the Model

Now a graph can be created and the example model can be loaded. Multiple models can easily be loaded into the same graph. For example, this graph can be loaded with the 223P ontology to allow inferencing and validation. If separate building models were made by different stakeholders, they could also be easily loaded together. Once a model and the ontology are loaded into the graph, the model may be validated, queried, or updated. 

```{code-cell}
# Create an RDF graph and load model
g = Graph()
g.parse('TODO Update Link', format = 'ttl')
g.parse('TODO Update Link for ontology', format = 'ttl')
```

## Validating the Model 


Now that the graph and ontology is loaded you can validate ... 


Validation helps ensures that the model has been constructed correctly. For example, ConnectionPoints have a validation rule that checks that they have been connected. This validation is just a warning, and does not have to be corrected for this tutorial as we are using a model snippet of an isolated system...

Inference also adds essential information such as the additional connection relationships shared between devices within the system... 

## Querying the Model

Now that the model is loaded and validated, SPARQL queries can be used to identify data within the model. RDFLib has many other methods of managing models in addition to SPARQL, these are detailed in the RDFLib documentatino (link)

## Updating the Model

SPARQL can not only be used to query, but it can be used to update. Here is an example of a query that updates the model ...






