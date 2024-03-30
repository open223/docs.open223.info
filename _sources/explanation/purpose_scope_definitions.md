(purpose-scope)=
# Purpose, Scope, and Definitions

The Purpose, Scope, and Definitions from the current Standard are provided below to introduce it to users. For more information about the Standard, please see the draft[^1].

[^1]: https://osr.ashrae.org/

## 1 Purpose
>The purpose of this standard is to define formal knowledge concepts and a methodology to apply them to create interoperable, machine-readable semantic frameworks for representing building automation and control data, and other building system information.

## 2 Scope
>This standard provides a comprehensive way to apply semantic formalisms to represent the context of building system data and relationships between the associated building mechanical system components so that software applications can find and understand the information in an automated way. It is intended to facilitate the development and implementation of building analytics tools and enterprise knowledge applications that can implement many building system functions, including:
>1. automated fault detection and diagnostics,
>2. building system commissioning,
>3. digital twins,
>4. optimization of energy use, and
>5. smart grid interactions.

## 3 Definitions
>**Connectable**: an abstract class that represents a thing (Equipment or DomainSpace) that can be connected via ConnectionPoints and Connections.
>**Connection**: the modeling construct used to represent a physical thing (e.g., pipe, duct, or wire) that is used to convey some Medium (e.g., water, air, or electricity) between two Connectable things.
>**ConnectionPoint**: an abstract modeling construct used to represent the fact that one Connectable thing can be connected to another Connectable thing using a Connection. It is the abstract representation of the flange, wire terminal, or other physical feature where a connection is made.
>**Domain**: a categorization of building service or specialization used to characterize equipment or spaces in a building. Example domains include HVAC, lighting, and plumbing.
>**DomainSpace**: a portion or the entirety of a PhysicalSpace that is associated with a Domain, such as lighting, HVAC, or physical security. DomainSpaces can be combined to form a Zone.
>**Duct**: a subclass of Connection that represents a conduit through which air is conveyed.
>**ElectricWire**: a subclass of Connection that represents one or more electrical conductors used to convey electricity.
>**Equipment**: the modeling construct used to represent a mechanical device designed to accomplish a specific task that one might buy from a vendor. Examples include a pump, fan, heat exchanger, luminaire, temperature sensor, or flow meter. A piece of equipment can contain another piece of equipment. For example, an air handling unit can contain a cooling coil.
>**PhysicalSpace**: an architectural concept that can represent a room, a collection of rooms such as a floor, a part of a room, or any physical space that might not even be thought of as a room, such as a patio.
>**Pipe**: a subclass of Connection that represents a hollow cylinder of metal or other material used to convey a Medium.
>**System**: a task-oriented collection of interacting or interrelated Equipment defined by the modeler. Examples of possible systems are an air distribution system, or a hot water system. Systems can contain other Systems.
>**Zone**: a collection of DomainSpaces of a specific domain that are grouped together from the perspective of building services or controls.