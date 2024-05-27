(units-of-measure)=
# Units of Measure

Because this standard includes references to measurements of physical properties, it is necessary to provide a model representation of units of measure as well as what those units are quantifying (e.g. temperature, power, etc.). This standard builds upon the "Quantities, Units, Dimensions and Types" (QUDT) ontology which is the leading open-source model of units and related concepts expressed in RDF/SHACL. The QUDT model is documented at https://qudt.org. The key concepts used here are the classes Unit and QuantityKind. 

A useful resource for the modeler is the QUDT catalog found [here](https://www.qudt.org/2.1/catalog/qudt-catalog.html), where all the units, quantity kinds and other concepts are listed. Each concept is fully dereferenceable, so for example, the Ampere has the URI http://qudt.org/vocab/unit/A. Using content negotiation, this link resolves to an HTML page for a human reader, and to interpretable code for a machine.