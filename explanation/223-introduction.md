# ASHRAE Standard 223

Standard 223 defines modeling constructs for use in creating a machine-readable representation of building systems, the building spaces that they serve, and the measurement and control points used to provide a safe and comfortable environment for the building occupants. The standard can be considered a toolkit of components and rules for using them to create a semantic model of a particular building or campus of buildings. The resulting model provides a way for software applications to determine the relationships between the mechanical equipment in the building (i.e., AHU 1 gets chilled water from CH 3 and provides conditioned air to VAV Boxes 12 through 15 serving rooms on the third floor) and the meaning of measurements that are available (i.e., T16 is a temperature sensor measuring the temperature of the air stream exiting AHU 1). This facilitates the implementation of advanced features in buildings 
<!-- like automated fault detection and diagnostics, supervisory controls, automated commissioning, and more. --> 

>1 PURPOSE
The purpose of this standard is to define formal knowledge concepts and a methodology to apply them to create interoperable, machine-readable semantic frameworks for representing building automation and control data, and other building system information
>
>2 SCOPE
This standard provides a comprehensive way to apply semantic formalisms to represent the context of building system data and relationships between the associated building mechanical system components so that software applications can find and understand the information in an automated way. It is intended to facilitate the development and implementation of building analytics tools and enterprise knowledge applications that can implement many building system functions, including:
>1. automated fault detection and diagnostics,
>2. building system commissioning,
>3. digital twins
>4. optimization of energy use, and
>5. smart grid interactions.



## Using Graph Data Concepts

Standard 223 is represented using the Resource Description Framework (RDF). RDF is a general method for representic semantic information in the form of a triple, which consists of a subject, a predicate, and an object. The subject and object define two entities, which are an instance of some class, and the predicate defines how they are related. A collection of these triples make up a graph. The ASHRAE 223 standard defines classes and relationships relevant to the building space that can then be used to build a multi-graph representing a specific building or group of buildings. For more information about RDF and the other semantic technologies used by the standard, please look at the [reference section](other-references).

To create a semantic model of your building using Standard 223, you create instances that represent the entities in your building, and define them using the classes and relationships defined or referenced by Standard 223. For example, you may be creating a model of a building in which your air handling unit (ahu-1) contains a fan (fan-1). Your air handling unit (ahu-1) would be modeled as an instance of the 223 class [`s223:AirHandlingUnit`](https://explore.open223.info/s223/AirHandlingUnit.html), which describes the general class of things resembling Air Handling Units. Similarly, your fan (fan-1) would be an instance of the 223 class [`s223:Fan`](https://explore.open223.info/s223/Fan.html). The idea of containment is defined using the 223 relationship [`s223:contains`](https://explore.open223.info/s223/contains.html), so your air handling unit would relate to your fan using the relationship `s223:contains`. The relationship between an instance and a class is defined using the RDF relationship rdf:type, so your ahu and fan would relate to `s223:AirHandlingUnit` and `s223:Fan` using the relation rdf:type. This example is shown in Figure 1. 

<div align="center">
    

<img src="../_static/ex-1.svg" alt="Alt text" style="max-width:100%; height:auto;">

<span style="font-size: medium;">Figure 1. 223 Modeling Example</span>

</div>
