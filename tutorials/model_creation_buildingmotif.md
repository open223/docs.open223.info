---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: open223-book
  language: python
  name: open223-book
---

# Creating a Model with BuildingMOTIF

[BuildingMOTIF](https://github.com/NREL/BuildingMOTIF) is a Python SDK for creating, manipulating, and validating semantic building models.
Here, we will demonstrate how to create a simple ASHRAE 223P model using BuildingMOTIF.

We will create a model that includes a simple HVAC system with a VAV terminal unit serving a zone.
This will use BuildingMOTIF [Templates](https://buildingmotif.readthedocs.io/en/latest/explanations/templates.html), which are reusable components that encapsulate common patterns in building modeling.

## Setting up BuildingMOTIF

<details>
<summary>Downloading the NREL 223P templates library</summary>

```{code-cell}
!git clone --filter=blob:none --no-checkout https://github.com/NREL/BuildingMOTIF
!pushd BuildingMOTIF && git sparse-checkout init --cone
!pushd BuildingMOTIF && git sparse-checkout set libraries/ashrae/223p/nrel-templates
!pushd BuildingMOTIF && git checkout
```

</details>

The following code sets up a temporary (in-memory) BuildingMOTIF instance, loads the necessary libraries, and creates an (empty) model to hold our building data.

```{code-cell}
from rdflib import Namespace
from buildingmotif import BuildingMOTIF
from buildingmotif.dataclasses import Library, Model
from buildingmotif.model_builder import TemplateBuilderContext as ModelBuilder
import logging

# Create a BuildingMOTIF object. If you do not have Java installed, remove the "shacl_engine" parameter
bm = BuildingMOTIF('sqlite://', shacl_engine='topquadrant', log_level=logging.ERROR)

# load 223P library and some dependencies. We will load a recent copy from the open223.info
s223 = Library.load(ontology_graph="https://open223.info/223p.ttl")
unit = Library.load(ontology_graph="http://qudt.org/3.1.1/vocab/unit")
quantitykind = Library.load(ontology_graph="http://qudt.org/3.1.1/vocab/quantitykind")
templates = Library.load(directory="BuildingMOTIF/libraries/ashrae/223p/nrel-templates")

# create a Model to hold our building model
model = Model.create("urn:example")
BLDG = Namespace("urn:example/")
```

## Building the Model

Now, we load the templates into a `ModelBuilder` context, which allows us to use the templates to create our model.

```{code-cell}
builder = ModelBuilder(BLDG)
builder.add_templates_from_library(templates)
```

We will create a reheat VAV terminal unit serving a physical space

```{code-cell}
# Create a VAV terminal unit with reheat
vav = builder["vav-reheat"](name="my_vav")
# we can give names to the sensors inside the VAV
vav["sup-air-temp-sensor"] = "BLDG_VAV:SAT"
vav["sup-air-flow-sensor"] = "BLDG_VAV:SAF"

# create the physical space
zone = builder["hvac-space"](name="my_zone")

# connect the VAV terminal unit to the zone using a duct
duct2zone = builder["duct"](a=vav['air-out'], b=zone['in'], name="duct2zone")
```

When we are done, compile the "builder" into the model

```{code-cell}
model.add_graph(builder.compile())
print(f"Model has {len(model.graph)} triples")
```

The model is now ready and contains the VAV terminal unit and the physical space it serves:

<details>
<summary>223P model generated from templates</summary>

```{code-cell}
print(model.graph.serialize())
```

</details>

## Compiling the Model

The generated model is the "pre-inference" model, as described in [model_inference.md](model_inference.md).
To apply inference rules to this model, we will need to load the 223P ontology and apply the inference rules as described in that document.

```{code-cell}
compiled_model = model.compile([s223.get_shape_collection(), unit.get_shape_collection(), quantitykind.get_shape_collection()])
print(f"Compiled model has {len(compiled_model.graph)} triples")
```

<details>
<summary>223P model with all inferred triples</summary>

```{code-cell}
print(compiled_model.graph.serialize())
```

</details>
