(qudt)=
# Using 223 with QUDT

Because this standard includes references to measurements of physical properties, it is necessary to provide a model representation of units of measure as well as what those units are quantifying (e.g. temperature, power, etc.). This standard builds upon the "Quantities, Units, Dimensions and Types" (QUDT) ontology which is the leading open-source model of units and related concepts expressed in RDF/SHACL. The QUDT model is documented at the [QUDT website](https://qudt.org). The key concepts used here are the classes Unit and QuantityKind. The 223 standard is compatible with Version 3.1.1 of QUDT and is expected to be compatible with 
all newer versions as well. 

If a user wants control over which version of QUDT is used, they can download any specific version at the
[QUDT Github Release page](https://github.com/qudt/qudt-public-repo/releases) for use within their 
application. This is the recommended method because it ensures nothing changes without the knowledge of the 
user. Alternatively, one can dynamically load the QUDT graphs into an application from the internet via the 
graph URIs identified in the import statements of the 223 standard, such as https://qudt.org/3.1.1/vocab/unit 
for a specific version, or https://qudt.org/vocab/unit for the latest version. 
Note that dynamically loading graphs from the internet by resolving the URIs loads the OWL schema 
for QUDT rather than the SHACL schema. As described in the 
[Protege Users instructions](https://github.com/qudt/qudt-public-repo#protege-users), the imports
specified in the "facade" file that is resolvable on the web (http://qudt.org/schema/facade/qudt for the latest, or http://qudt.org/3.1.1/schema/facade/qudt for an example of a specific version) is configured to load the OWL schema rather than the SHACL schema. To use the SHACL schema in the dynamic loading method, a local copy of the facade file must be downloaded first and edited as follows:
```
Change this line:
  owl:imports <http://qudt.org/3.1.1/schema/qudt> ;  
To:
  owl:imports <http://qudt.org/3.1.1/schema/shacl/qudt> ;
```

When using the SHACL version of QUDT, it is also worthwhile reviewing the [configuration instructions](https://github.com/qudt/qudt-public-repo#configuration-for-qudt-users-versus-qudt-developers) to speed up the validation step if QUDT is simply being used
as an imported resource.

Finally, a useful resource for a 223 modeler is the QUDT catalog found [here](https://www.qudt.org/2.1/catalog/qudt-catalog.html), where all the units, quantity kinds and other concepts are listed. Each concept is fully dereferenceable, so for example, the Ampere has the URI http://qudt.org/vocab/unit/A. Using content negotiation, this link resolves to an HTML page for a human reader, and to interpretable code for a machine.