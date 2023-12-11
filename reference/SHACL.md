# Basics of SHACL

ASHRAE Standard 223P utilizes SHACL for validation and inference. Both validation and inference play a role in creating complete and correct models. Validation ensures that information within the model conforms to rules in the standard, while inference adds information to the graph when a rule’s conditions are met. 

## SHACL Validation Rules

_Technical Description:_ These rules are constraints defined in a SHACL shape that are applied to RDF data to ensure it adheres to specific structural and semantic requirements. They are essentially conditions the data must satisfy to be valid according to the defined shape.

_Process:_ Validation rules involve checking properties, types, value ranges, patterns, and other aspects of data nodes against specified criteria in the SHACL shapes. If a node in the RDF graph violates any of these constraints, it is flagged as non-compliant.

_Example:_ Suppose you have a SHACL shape that defines a Person class. The validation rules might specify that each Person must have a name (of datatype string) and an age (of datatype integer and greater than 0). The validation process will check each instance of Person in your RDF data against these rules and identify any instances that don't conform.

Further, Standard 223 uses SHACL inference rules (both TripleRules and SPARQLRules, part of SHACL Advanced Features)(ref. https://w3c.github.io/shacl/shacl-af/).

## SHACL Inference Rules

_Technical Description:_ SHACL inference rules are used to derive or infer new RDF triples based on existing data that is logically implied but not explicitly stated.

_Process:_ Inference rules typically use conditions to match certain patterns in the data, and new triples are created when these conditions are met. These rules can add valuable information to a dataset, make implicit relationships explicit, and enhance data interconnectivity.

_Example:_ Consider a dataset describing books and authors. You might have a rule stating, "If a person has written a book, they can be inferred to have the role of an author." In SHACL, this could be a rule that, upon finding a triple like [:hasWritten :someBook], automatically adds a new triple [:hasRole :Author]. Thus, if John has written "Book A" (expressed as [:John :hasWritten :BookA]), the rule would infer and add [:John :hasRole :Author].
One important example of SHACL inferencing is in deriving the family of relations between Equipment, ConnectionPoints, and Connections from the base s223:cnx relation (see section on Connections in the standard). It is worth noting that in the S223 standard, SHACL inference rules are used only to add new relations between existing entities and not to define new entities. This avoids the complex issue of ensuring unique identifiers (URIs) for new entities. 
Models can be validated using BuildingMOTIF and TopBraid Composer. The SHACL reasoners that power these tools, PySHACL and the TopBraid reasoner, are also available for use independently of the platforms.
