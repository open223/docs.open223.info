(qudt)=
# Using 223 with QUDT

Because this standard includes references to measurements of physical properties, it is necessary to provide a model representation of units of measure as well as what those units are quantifying (e.g. temperature, power, etc.). This standard builds upon the "Quantities, Units, Dimensions and Types" (QUDT) ontology which is the leading open-source model of units and related concepts expressed in RDF/SHACL. The QUDT model is documented at the [QUDT website](https://qudt.org). The key concepts used here are the classes Unit and QuantityKind. The 223 standard is compatible with Version 3.1.4 of QUDT and is expected to be compatible with 
all newer versions as well. It is a good idea to use the most recent version available. 

If a user wants control over which version of QUDT is used, they can download any specific version at the
[QUDT Github Release page](https://github.com/qudt/qudt-public-repo/releases) for use within their 
application. For users who do not want to worry about the internal structure of the QUDT ontologies, the easiest way to bring in QUDT is to load the file QUDT-all-in-one-SHACL.ttl, included in Release 3.1.4 or later. 

This is the recommended method because it ensures nothing changes without your knowledge. Alternatively, you can dynamically load the QUDT graphs into your application from the internet via the 
graph URIs identified in the import statements of the 223 standard, such as http://qudt.org/3.1.4/QUDT-all-in-one-SHACL 
for a specific version, or http://qudt.org/QUDT-all-in-one-SHACL for the latest version. 

The 223 standard contains an import statement to QUDT that looks like this:
```
<http://data.ashrae.org/standard223/1.0/model/all>
  a owl:Ontology ;
  owl:imports <http://qudt.org/3.1.4/shacl/qudt-all> ;
  .
```
It is important that the import statement points to the same version of QUDT that you download. If you want to just use the latest version, just replace the import triple with:
```
owl:imports <http://qudt.org/shacl/qudt-all> ;
```

Finally, a useful resource for a 223 modeler is the QUDT catalog found [here](https://www.qudt.org/catalog/qudt-catalog.html), where all the units, quantity kinds and other concepts are listed. Each concept is fully dereferenceable, so for example, the Ampere has the URI http://qudt.org/vocab/unit/A. Using content negotiation, this link resolves to an HTML page for a human reader, and to interpretable code for a machine.