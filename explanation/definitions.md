(definitions)=
# Definitions 
````{margin}
```{note}
This is referency, but these definitions are specifically to help explain in the explanation section, should stay here?

```
````
Understanding this explanation section depends on knowing the defintions of several concepts. More can be learned about these concepts from the resources linked in the reference section (link)


## Graph Data Concepts
````{margin}
```{note}
Borrowed from brick. I remember finding this very helpful.
```
````
 - **Entity:** An entity is an abstraction of any physical, logical or virtual item; the actual "things" in a building. Examples are mechanical equipment such as air handling units, luminaires, spatial elements like rooms, or the area of these rooms served by certain mechanical equipment. Virtual and logical entities may represent the various data points in a BAS system, such as sensing and actuation points, as well as basic representations of controls.

 - **Class:** A named category with intensional meaning (a definition) used for grouping entities.
Classes are organized into a hierarchy, and entities are an instance of a given class. Classes are defined using SHACL shapes ensuring that they are instantiated correctly.

 - **Relationship:** Defines the nature of a link between two related entities.
Examples of relationships are *encapsulation* (one entity is contained within another), *sequence* (one entity takes effect before another in some process) and *instantiation* (one entity's type is given by another entity).

- **Relation:** A predicate (RDF property) used to describe a given relationship.
Examples of a relation are the s223 relation s223:contains, which relationship between two pieces of equipment in which one contains another.  

 - **Graph:** An abstract organizational data structure representing a set of entities (nodes) and relationships (edges) described in triple-structure. 223P models are represented by a directed, labeled graph, and use the RDF standard. We recommend reading the [Wikipedia page on the abstract graph data structure](https://en.wikipedia.org/wiki/Graph_(abstract_data_type)) for more information.

 - **A 223P Semantic Model:** A 223P model is a digital representation of a building in RDF graph structure that utilizes the 223P standard. This means that elements of a particular buidling are represented using instances of the classes defined by the 223P standard and use relationships as defined by the rules present in the standard. 223P leverages the semantic web technologies, allowing easy integration with other types of models that utilize RDF.

## 223P Top Level Classes
````{margin}
```{note}
A little referency, but it's hard to understand any of the explanation without these things.
Perhaps we can just put it in reference though. 

```
````
The 223P standard defines a hierarchy of classes used to define the entities within a buidling. This section provides a basic definitino of the classes at the top level of the hierarchy to help users understand what the standard aims to represent, which is described in the next section (link). 

 - **Connectable:** An abstract class representing a thing that can be connected via ConnectionPoints and Connections.

 - **Connection:** A modeling construct for representing a physical thing (e.g., pipe, duct, wire) that connects and conveys a medium between two Connectable things.

 - **ConnectionPoint:** An abstract modeling construct representing the point where one Connectable thing connects to another.

 - **Domain:** A categorization of building service or specialization used to characterize equipment or spaces (e.g., HVAC, lighting, plumbing).

 - **Connectable:** This is the top level entity that defines the classes that may be connected via ConnectionPoints and Connections. There are three major sub-classes of connectable

    - **DomainSpace:** A portion or entirety of a PhysicalSpace associated with a Domain. Often a DomainSpace is served by a particular piece of equipment, like a single VAV Box, and thus they can be connected to equipment. Multiple DomainSpaces controlled similarly can be grouped together, forming a Zone.

    - **Equipment:** A modeling construct used to represent a mechanical device designed to accomplish a specific task (e.g. pump, fan, heat exchanger, luminaire, temperature sensor, flow meter). Equipment may contain and connect to other equipment, allowing detailed modeling of mechanical systems. Certain pieces of equipment (i.e. Sensors, Actuators, Controllers) may have unique relationships to properties to define how they act on the properties of other entities.

    - **Junction:** A Junction is a modeling construct used to represent important branching points within a Connection.

 - **PhysicalSpace:** An architectural concept representing a room, floor, or any physical space in a building. These PhysicalSpaces (e.g. a floor) can contain other PhysicalSpaces (e.g. a room).

 - **System:** A task-oriented collection of interacting or interrelated Equipment defined by the modeler.

 - **Zone:** A collection of DomainSpaces grouped together based on building services or controls.

 - **Properties:** Properties often represent the actuation and measurement points within a buidling. They may be associated with real-time data. They also may define the attributes of other entities (e.g. Equipment, DomainSpaces, Zones). They can be further contextualized using enumerations.

 - **Enumerations:** The standard uses enumerations to convey groups of useful values for describing attributes of Properties, Equipment, and other things in the model. For example, the enumeration `Role-Cooling` describes that the equipment in question provides cooling.

 - **FunctionBlock:** Is used to model transfer and/or transformation of information (e.g. control algorithms). It has relations to input properties and output properties, that represent input and output data. The actual algorithms that perform the transformations are not described in 223P, and can be described using standard 231P.

