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
(model-inference)=
# Model Inference

```{note}
The purpose of this tutorial is to show how SHACL inference applied to a 223 model can
make models easier to write and query. Specifically, this tutorial will teach the following:
1. How to load SHACL inference rules defined in the 223 ontology into memory
2. How to apply SHACL inference rules to a 223 model to add all "implied" triples
```

For this tutorial, we'll use an existing equipment model of a variable air volume (VAV) terminal unit with cooling only from section 4.1 of ASHRAE Guideline 36-2021.
This and other example models are available from [Open223 Models](open223-resources).

## What are SHACL Rules?

[SHACL rules](https://www.w3.org/TR/shacl-af/#rules) add implied information to graphs if certain conditions are met, i.e. if certain triples exist in the source graph.
The process of applying rules to an input model to generate new information (triples) is called *inference*.
Inference makes models easier to write because the model author does not have to manually include all the triples necessary to support the desired queries;
instead, some of those useful triples can be added "automatically" to the model through the use of inferencing.
One way to think of inference is a way of normalizing a 223 model.
Inference assures that the expected properties, types, and other annotations are present so that consumers of the model can make assumptions about what information will be contained within the graph.

## Model Parsing

First, we'll create a new empty graph then parse (load) an existing graph into it using the Python RDFLib library.

```{code-cell}
from rdflib import Graph
# Create a Graph
model = Graph()
# Parse in an RDF file hosted on the Internet
model.parse("https://models.open223.info/guideline36-2021-4-1.ttl", format="ttl")
print(f"The model contains {len(model)} triples")
```

<details>
<summary>Turtle representation of the model (pre-inference)</summary>

```{code-cell}
print(model.serialize())
```

</details>

### Testing the Model (Failed Query)

Below, we try to run a simple query on our model which asks what the damper in the terminal unit is connected to.
The `s223:connected` relationship does not exist in the pre-inference model, so this query will not return results.

```{code-cell}
parts_query = """
PREFIX bldg: <urn:ex/>
PREFIX s223: <http://data.ashrae.org/standard223#>
SELECT ?parts WHERE {
    bldg:vav-cooling-only s223:contains ?damper .
    ?damper s223:connected ?parts
}"""

for row in model.query(parts_query):
    print('\t'.join(row))
```

## Loading the 223 Ontology

The 223 ontology contains the rules we will use for inference.
We will load the 223 ontology into a separate graph from the model.
This is mostly for maintenance: it is easy enough to merge two graphs together into one, but it is much harder to factor them out again.
By keeping the ontology graph separate from the model graph, we can more easily maintain and version those graphs individually.

```{code-cell}
from rdflib import Graph
# Create a Graph
s223 = Graph()
# Parse in a recent copy of the 223 ontology
s223.parse("https://query.open223.info/ontologies/223p.ttl")
```

## Applying Inference Rules

To apply inference rules, we need an *inference engine*.
This is a piece of software which knows how to properly interpret and apply the SHACL rules defined in an ontology.
There are multiple closed-source and open-source implementations of SHACL available; some of these are listed on [this page](other-resources)
Below, we will be using the open-source [PySHACL](https://github.com/RDFLib/pySHACL) library.

We import the PySHACL library and then invoke the `validate` function on our model graph (*data graph* in PySHACL parlance)
and our 223 graph (*shape graph* in PySHACL parlance).

```{code-cell}
import pyshacl

# skolemizing the s223 graph lets us remove blank nodes after inference
skolemized_s223 = s223.skolemize()

pyshacl.validate(model,
    shacl_graph=skolemized_s223,     # pass in the 223 graph object here
    ont_graph=skolemized_s223,       # pass in the 223 graph object here
    allow_infos=True,     # don't fail if we get an INFO message
    allow_warnings=True,  # don't fail if we get a WARNING message
    abort_on_first=False, # allow errors to happen during execution
    advanced=True,        # allow SHACL rules to execute
    inplace=True          # update the 'model' object with the inferred triples
)
# remove the skolemized s223 graph from the model
model -= skolemized_s223
# de-skolemize the ret of the model
model = model.de_skolemize()
print(f"The model now contains {len(model)} triples")
```

This may take a few minutes to run, depending on the size of your model.
If the PySHACL library is too slow, we recommend looking at alternate open-source implementations
like [TopQuadrant's Java-based implementation](https://github.com/TopQuadrant/shacl).

We can see from the print statement that several triples have been added to the model.

```{note}
The `pyshacl.validate` function actually returns a SHACL validation report which can be used to fix
the model and make it compatible with the 223 ontology. See the [Model Validation](model_validation)
tutorial for how to access and interpret this report.
```

<details>
<summary>Turtle representation of the model (post-inference)</summary>

```{code-cell}
print(model.serialize())
```

</details>

## Using the New Model

To demonstrate that the model contains new triples, we can try re-running the query from before.
We can see that the query returns results this time.

```{code-cell}
query = """
PREFIX bldg: <urn:ex/>
PREFIX s223: <http://data.ashrae.org/standard223#>
SELECT ?damper ?part WHERE {
    bldg:vav-cooling-only s223:contains ?damper .
    ?damper s223:connected ?part
}"""

for row in model.query(query):
    print(f"{row.get('damper')} connected to {row.get('part')}")
```
