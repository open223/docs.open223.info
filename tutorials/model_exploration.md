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

# Model Exploration

```{note}
The purpose of this tutorial is to explore a model by learning the following:
1. Parsing (loading) an existing model
2. Querying an existing model.
```

For this tutorial, we'll use an existing equipment model of a variable air volume (VAV) terminal unit with cooling only from section 4.1 of ASHRAE Guideline 36-2021. This and other example models are available from [Open223 Models](open223-resources).

## Model Parsing

First, we'll create a new empty graph then parse (load) an existing graph into it using the Python RDFLib library.

```{code-cell}
from rdflib import Graph

# Create a Graph
g = Graph()

# Parse in an RDF file hosted on the Internet
g.parse("https://models.open223.info/guideline36-2021-A-1.ttl", format="ttl")
```

Next, we'll explore the model's size by printing the number of triples in it.

```{code-cell}
# Print the number of "triples" in the Graph
print(f"Graph g has {len(g)} statements.")
```

Finally, we'll print the contents of the model since it's not that large.

```{code-cell}
# Print out the entire Graph in the RDF Turtle format
print(g.serialize(format="turtle"))
```

## Model Querying

After exploring the model to get a sense for what it contains, let's query the model using RDFLib (this can also be done with [Open223 Query](open223-resources)). For this tutorial, we'll query the model for all the VAV terminal's points, which are instances of the following classes:

[Open223 Explore links](open223-resources):
- [QuantifiableActuatableProperty](https://explore.open223.info/s223/QuantifiableActuatableProperty.html)
- [QuantifiableObservableProperty](https://explore.open223.info/s223/QuantifiableObservableProperty.html)

```{code-cell}
# Query the data in g using SPARQL
q = """
PREFIX s223: <http://data.ashrae.org/standard223#>

SELECT ?obj WHERE {
  { ?obj a s223:QuantifiableActuatableProperty . }
  	UNION
  { ?obj a s223:QuantifiableObservableProperty . }
}
"""

# Apply the query to the graph and iterate through results
for r in g.query(q):
    print(r)
```
