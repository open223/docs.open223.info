(223-overview)=
# 223 Overview 

This standard allows users to create semantic models that describe the many entities in their buildings that are relevant to advanced features and applications such as fault detection and diagnostics, demand flexibility, and real time optimization. 

There is a huge amount of information about the many entities within a building that you may want to model. This section will explain what information you should represent in a 223 model and the 223 modeling constructs you will use to do so. Descriptions assume you have some familiarity with RDF graph data and know the [definitions of key terms used in this section](definitions). 

## Type

This standard provides well defined classes used to describe entities relevant to building system information. Entities in 223 models will generally be instances of the many classes defined or referred to by the standard. The classes in the standard provide 'names' for the fundamental building blocks used in 223 models (e.g. a fan will be an instance of the class [`s223:Fan`](https://explore.open223.info/s223/Fan.html)) and also have rules defining how they are used (e.g. a fan must convey air).

## Topology

This standard can be used to describe the topology of the equipment and spaces in a building, but not the geometric details. Topology refers to the way entities are connected and how some media (e.g. water, air, or electricity) is conveyed between them. There are several different classes used to describe which entities participate in connections and how they connect: [Connectables](https://explore.open223.info/s223/Connectable.html), which include the entities that are capable of connecting to each other; [ConnectionPoints](https://explore.open223.info/s223/ConnectionPoint.html), which model where Connectables can be connected; and [Connections](https://explore.open223.info/s223/Connection.html), which describe physical things through which the medium is conveyed, like pipes or ducts. These [Mediums](https://explore.open223.info/s223/Substance-Medium.html) (e.g. gas, electricity, water) are defined as an [EnumerationKind](https://explore.open223.info/s223/EnumerationKind.html) in the standard. There are also multiple relations used to describe the details of these connections, and how the multiple entities involved in a connection relate to each other. Figure 1 summarizes these relations. Though there are many relations to describe different perspectives of a connection, only [`s223:cnx`](https://explore.open223.info/s223/cnx.html) needs to be manually added to the model, and the rest can be automatically added to the model through the process of [inference](model-inference). 


```{image} images/connection-relationships.png
:align: center
:width: 700px
```

<div align="center">
<span style="font-size: medium;">Figure 1. Relations expressing different perspectives of connection </span>
</div>

## Composition

Composition is about what entities make up what other entities. For example, a piece of mechanical equipment like a VAV may in fact be made up of other pieces of mechanical equipment, such as a damper and a reheat coil. Additionally, a zone may be made up of several different spaces that receive a similar building service, or a floor may be made up of different rooms, corridors, or offices. Several different modeling constructs use the idea of composition. These modeling constructs include include [Equipment](https://explore.open223.info/s223/Equipment.html), which may contain other equipment (e.g. VAV containing a Damper); [Zones](https://explore.open223.info/s223/Zone.html), which may have [DomainSpaces](https://explore.open223.info/s223/DomainSpace.html) that receive a similar building service; [ZoneGroups](https://explore.open223.info/s223/ZoneGroup.html), which group together similarly controlled Zones; [Systems](https://explore.open223.info/s223/System.html) that represent a collection of interrelated Equipment; or [PhysicalSpaces](https://explore.open223.info/s223/PhysicalSpace.html), which may contain other PhysicalSpaces as a floor contains multiple rooms. PhysicalSpaces may also enclose DomainSpaces, indicating that the DomainSpace is completely within the PhysicalSpace. For example, an auditorium (a PhysicalSpace) may enclose several different areas served by independently controlled lights (DomainSpaces). 

## Telemetry 

A 223 model does not directly provide telemetric data about the real-time operation or past operation of the building systems.
It does provide information about the meaning or context of a given data point and it can link to a source of the data values so that an analytics application can find them.
If the building has a BACnet building automation and control system, the model can provide the necessary information for analytics or controls software to learn which BACnet object and BACnet property corresponds to the desired piece of information.

In 223, *Properties* are representations of some quality or characteristic of the building which might be observable, quantifiable, and/or actuatable.
Properties may have an *external reference* which indicates where the information (i.e., data) corresponding to that property may be found -- this is commonly a BACnet object, but other types of external references are possible.
There are multiple types of [Properties](https://explore.open223.info/s223/Property.html), such as control points that can be written to ([ActuatableProperties](https://explore.open223.info/s223/ActuatableProperty.html)), sensor points that are observed ([ObservableProperties](https://explore.open223.info/s223/ObservableProperty.html)), either of which can refer to enumerated ([EnumerableProperty](https://explore.open223.info/s223/EnumerableProperty.html)) or quantified ([QuantifiableProperty](https://explore.open223.info/s223/QuantifiableProperty.html)) values. Properties may also be used for mathematical operations, including those that are common in a building such as control logic. This idea is represented using [FunctionBlocks](https://explore.open223.info/s223/FunctionBlock.html). Properties also have many different characteristics which are described by a vocabulary of [EnumerationKinds](https://explore.open223.info/s223/EnumerationKind.html). 

Unlike other ontologies like [SSN/SOSA](https://www.w3.org/TR/vocab-ssn), Properties are *not* associated with the inherent phenomena.
In 223, Properties are associated with a *single* sensor or actuator.
Think of 223's Properties as the source of the measurement or value which eventually becomes exposed in the building management system as a "Point".

## Characteristics

A model can also describe the characteristics of the entities in a building. These characteristics express details about entities that are not otherwise expressed by the type, topology, or composition of the entity. Often, these characteristics are linked to specific instances in a model. For example, a characteristic of a pump would be its rated flow. Another pump in the same 223 model may have a different rated flow, but it will use the same 223 class (i.e. [`s223:Pump`](https://explore.open223.info/s223/Pump.html)). These types of characteristics are modeled using [Properties](https://explore.open223.info/s223/Property.html). 

Properties also have various characteristics including their units, quantity kinds, enumeration kinds, and aspects. [Units](https://www.qudt.org/doc/DOC_VOCAB-UNITS.html) describe the unit (e.g. Fahrenheit) of a [QuantifiableProperty](https://explore.open223.info/s223/QuantifiableProperty.html) and [quantity kinds](https://www.qudt.org/doc/DOC_VOCAB-QUANTITY-KINDS.html) describe the type of quantity that may be stated by means of units (e.g. temperature). These are modeled using [qudt ontologies](https://qudt.org/). [EnumerableProperties](https://explore.open223.info/s223/EnumerableProperty.html) do not have units, but they have enumerated values that can be described by [EnumerationKinds](https://explore.open223.info/s223/EnumerationKind.html). Aspects establish the context of a Property. For example, if a Property has a Temperature value of 80.6, aspects are used to state what that represents, such as a Temperature limit during working hours, etc. A Property can have any number of aspects, as needed to establish the context. Any [EnumerationKind](https://explore.open223.info/s223/EnumerationKind.html) can be used as an aspect.
