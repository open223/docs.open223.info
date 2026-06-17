(related-standards)=
# Related Standards and Specifications

ASHRAE Standard 223P defines a semantic data model for building automation and control data. It does not address every aspect of the broader building data ecosystem. This page identifies related standards and specifications that practitioners may want to consult alongside 223P, organized by topic area. This is not an exhaustive list, but rather a starting point for practitioners to explore the broader landscape of building data standards.

```{note}
If you have suggestions for additional standards or specifications to include here, please submit an issue or pull request on the 223P GitHub repository.
We also welcome concrete examples of how practitioners have used these standards in conjunction with 223P and additional guidance on how to implement them together in practice.
```

## Building Information Modelling (BIM)

### ISO 19650: Information Management Using BIM

[ISO 19650](https://www.iso.org/standard/68078.html) is the international standard for organizing and digitizing information about buildings and civil engineering works using Building Information Modelling (BIM).
It governs the structured process by which building information is created, managed, and delivered across the project lifecycle, including the commissioning and handover milestone.

A 223P semantic model is most naturally initialized at the point when a building transitions from construction to operations.
ISO 19650 governs the information delivery milestones and the Common Data Environment (CDE) that produce BIM deliverables (including equipment schedules, spatial data, and system definitions) which are the natural source material for populating a 223P model.
Practitioners looking to establish a repeatable process for model initialization should consult ISO 19650 for guidance on information delivery at handover.

### ISO 16739: Industry Foundation Classes (IFC)

[IFC (Industry Foundation Classes)](https://www.buildingsmart.org/standards/bsi-standards/industry-foundation-classes/) is published as [ISO 16739-1:2024](https://www.iso.org/standard/84123.html) and is the international open standard for building data exchange.
IFC models contain spatial geometry, product properties, and system definitions.

IFC and 223P address complementary concerns.
IFC covers the geometry and product layer (spaces, systems, and equipment as physical objects with geometric representations).
223P covers the operational semantics layer (how data flows, what properties are observed, and how systems are connected for analytics and automation).
Organizations building digital twins will frequently work with both, and will need to develop their own mappings between IFC constructs (such as `IfcSpace`, `IfcZone`, and `IfcSystem`) and the corresponding 223P classes.
No standard guidance currently exists for this mapping; practitioners should consult the IFC specification directly.

## Facility Management

### ISO 41001: Facility Management Systems

[ISO 41001:2018](https://www.iso.org/standard/68242.html) specifies the requirements for a facility management (FM) system, with guidance for its use, for an organization that wants to demonstrate effective and efficient delivery of FM that supports the objectives of the demand organization.

We imagine that facility management organizations will be the users of 223P-enabled building models, and that 223P-derived data will be a key input to FM service delivery and performance management.
ISO 41001 addresses the management system requirements, including information and data management responsibilities, that govern how FM organizations operate.
Practitioners implementing building intelligence programs alongside an existing FM management system framework may find it useful to understand where 223P-derived data fits within the information management obligations ISO 41001 describes.

### OSCRE Industry Data Model

The [OSCRE Industry Data Model](https://oscre.org/) defines data exchange standards for real estate and facilities management business transactions, including lease data, maintenance transaction data, and FM service data.
OSCRE (Open Standards Consortium for Real Estate) operates as an industry consortium rather than a formal standards development organization.

223P addresses the building systems layer; OSCRE addresses the business and operational management layer above it (the organizational and financial context within which building systems operate).
Organizations implementing portfolio-scale building intelligence systems that need to connect building system data to real estate business intelligence, lease management, or FM service transactions should consult OSCRE to understand the data exchange standards that govern that layer.

## Data Quality

### ISO 8000: Data Quality

[ISO 8000](https://www.iso.org/standard/56025.html) is the international standard for data quality.
It defines a framework for data quality dimensions including accuracy, completeness, consistency, and timeliness.

SHACL conformance validation in 223P assesses *structural* validity (whether a model is correctly formed according to the ontology).
Structural validity is necessary but not sufficient for fitness for purpose in analytics applications.
A structurally conformant 223P model may still contain inaccurate sensor readings, an incomplete equipment inventory, or stale data that no longer reflects installed conditions.
ISO 8000 provides a framework for reasoning about these data quality dimensions independently of any specific standard, and practitioners should consult it when assessing whether a model is fit for its intended analytics purpose.

## Semantic Web Standards

### W3C PROV-O: Provenance Ontology

[W3C PROV-O](https://www.w3.org/TR/prov-o/) is a W3C standard that provides a set of classes, properties, and restrictions to represent provenance information about the origin, context, and history of data.

A 223P building model describes building systems at a point in time.
As buildings are modified, recommissioned, or retrofitted, the semantic model must be updated.
PROV-O is built on RDF (the same foundation as 223P), making it technically compatible for use alongside a 223P model to record provenance information: when the model was created or revised, what data sources were used (commissioning report, BIM model, field survey), and who performed the update.
Practitioners who need audit trails or who are managing model versions across a portfolio should consult PROV-O as a provenance framework.

## Other Building Ontologies

Several community-developed ontologies can be used alongside 223P to enrich building models with additional concepts and vocabularies.

### Brick Schema

[Brick](https://brickschema.org) is an open-source ontology for describing the equipment, points, locations, and metadata found in buildings.
Brick provides a large vocabulary of building management system (BMS) concepts that complement 223P.

### RealEstateCore

[RealEstateCore](https://realestatecore.io) is an ontology for describing real estate assets including buildings, rooms, and building systems, with a focus on the needs of real estate owners and operators.

See [Using 223 with Brick and RealEstateCore](../guides/brick-rec.md) for guidance on combining these ontologies with 223P models.
