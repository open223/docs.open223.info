## 223 Graph Structure

Standard 223 is represented using the Resource Description Framework (RDF). RDF is a general method for representic semantic information in the form of a triple, which consists of a subject, a predicate, and an object. The subject and object define two entities, which are a instances of some class, and the predicate defines how they are related. A collection of these triples make up a graph. The 223 standard defines classes and relationships relevant to the building space that can then be used to build a multi-graph representing a specific building or group of buildings. For more information about RDF and the other semantic technologies used by the standard, please look at the [reference section](other-resources).

To create a semantic model of your building using the 223 standard, you create instances that represent the entities in your building, and define them using the classes and relationships defined or referenced by the standard. For example, you may be creating a model of a building in which the air handling unit (ahu-1) contains a fan (fan-1). Your air handling unit (ahu-1) would be modeled as an instance of the 223 class [`s223:AirHandlingUnit`](https://explore.open223.info/s223/AirHandlingUnit.html), which describes the general class of things resembling Air Handling Units. Similarly, your fan (fan-1) would be an instance of the 223 class [`s223:Fan`](https://explore.open223.info/s223/Fan.html). The idea of containment is defined using the 223 relation [`s223:contains`](https://explore.open223.info/s223/contains.html), so your air handling unit would relate to your fan using the relation `s223:contains`. The relationship between an instance and a class is defined using the RDF relation `rdf:type`, so your ahu and fan would relate to `s223:AirHandlingUnit` and `s223:Fan` using that relation. This example is shown in Figure 1. 

```{image} images/ex-1.svg
:align: center
```

<div align="center">

<span style="font-size: medium;">Figure 1. 223 Modeling Example</span>

</div>