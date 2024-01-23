# Using 223 with Brick and RealEstateCore

The [Brick](https://brickschema.org) and [RealEstateCore](https://realestatecore.io) ontologies can be used to augment 223 models with a richer vocabulary of concepts, which offer the following benefits. 

1. The Brick and RealEstateCore ontologies define a much larger set of concepts than 223, so using these ontologies can provide a 223 model with more specific and higher-level information helpful to consumers of the model
2. The governance structures of the Brick and RealEstateCore ontologies mean they can evolve much faster than 223 and thus standardize descriptions of new concepts, e.g. as new products emerge onto the market

Importantly, a choice to model a building with 223 neither obviates nor requires the use of the Brick or RealEstateCore ontologies.
These can serve as another "layer" on top of the rich semantics provided by 223.

## Using Brick `Point`s with 223

Brick's [`Point`](https://explore.open223.info/brick/Point.html) class and its subclasses provide a large vocabulary of data sources (e.g., "Input/Output points") within a building management system (BMS).
These can be used as annotations on 223 [`Property`](https://explore.open223.info/s223/Property.html) instances.

Consider the following (partial) 223 model with a Brick annotation:

```turtle
@prefix bldg: <urn:ex/> .
@prefix s223: <http://data.ashrae.org/standard223#> .
@prefix qudt: <http://qudt.org/schema/qudt/> .
@prefix qudtqk: <http://qudt.org/vocab/quantitykind/> .
@prefix unit: <http://qudt.org/vocab/unit/> .
@prefix brick: <https://brickschema.org/schema/Brick#> .

bldg:damper a s223:Damper ;
    s223:cnx bldg:damper-out .

bldg:sensor a s223:Sensor ;
    s223:hasObservationLocation bldg:damper-out ;
    s223:hasPhysicalLocation bldg:damper ;
    s223:observes bldg:air-temp .

bldg:damper-out a s223:OutletConnectionPoint ;
    s223:cnx bldg:out-connection ;
    s223:hasMedium s223:Medium-Air ;
    s223:hasProperty bldg:air-temp .

bldg:air-temp a s223:QuantifiableObservableProperty,
                brick:Supply_Air_Temperature_Sensor ;
    qudt:hasQuantityKind qudtqk:Temperature ;
    s223:hasAspect s223:Role-Supply ;
    qudt:hasUnit unit:DEG_C .
```

By stating that the `bldg:air-temp` entity is also a [`brick:Supply_Air_Temperature_Sensor`](https://explore.open223.info/brick/Supply_Air_Temperature_Sensor.html), Brick-based applications can more easily find the data they are looking for.
223 requires multiple annotations be combined in order to model this concept.

The Brick class also clearly states the role of the entity.
The use of the QUDT annotations and Brick types means that this 223 model is also a valid Brick model!

Using Brick can simplify some queries against the model.
For example, finding the `bldg:air-temp` entity without Brick would require this query:

```sparql
PREFIX bldg: <urn:ex/>
PREFIX s223: <http://data.ashrae.org/standard223#>
PREFIX qudt: <http://qudt.org/schema/qudt/>
PREFIX qudtqk: <http://qudt.org/vocab/quantitykind/>
SELECT ?damper ?temp WHERE {
    ?damper a s223:Damper ;
        s223:hasProperty ?temp.
    ?temp a s223:QuantifiableObservableProperty ;
        qudt:hasQuantityKind qudtqk:Temperature ;
        s223:hasAspect s223:Role-Supply .
}
```

With Brick, the query above can be simplified to the following where the `brick:hasPoint` relationship is inferred automatically.

```sparql
PREFIX bldg: <urn:ex/>
PREFIX s223: <http://data.ashrae.org/standard223#>
PREFIX brick: <https://brickschema.org/schema/Brick#>

SELECT ?damper ?temp WHERE {
    ?damper a s223:Damper ;
        brick:hasPoint ?temp .
    ?temp a brick:Supply_Air_Temperature_Sensor .
}
```


## Using Brick `Equipment`s with 223

Brick's extensive [`Equipment`](https://explore.open223.info/brick/Equipment.html) classes can also be used with 223.
Any 223 [`Equipment`](https://explore.open223.info/s223/Equipment.html) can also be annotated with a Brick [`Equipment`](https://explore.open223.info/brick/Equipment.html) class as shown in the example below

```turtle
@prefix bldg: <urn:ex/> .
@prefix s223: <http://data.ashrae.org/standard223#> .
@prefix brick: <https://brickschema.org/schema/Brick#> .

bldg:damper a s223:Damper, brick:Supply_Damper .
```

## Using RealEstateCore `Space`s with 223

RealEstateCore's extensive [`Space`](https://dev.realestatecore.io/ontology/Space/Space) classes can also be used with 223 to provide human-facing annotations to 223 [`PhysicalSpace`](https://explore.open223.info/s223/PhysicalSpace) instances.
Simply add the RealEstateCore space type as another type of the desired 223 [`PhysicalSpace`](https://explore.open223.info/s223/PhysicalSpace) entity.
This can provide a 223 model with much more descriptive and *machine-readable* information about the role and purpose of physical spaces in the model.

Consider the following example:

```turtle
@prefix bldg: <urn:ex/> .
@prefix s223: <http://data.ashrae.org/standard223#> .
@prefix qudt: <http://qudt.org/schema/qudt/> .
@prefix qudtqk: <http://qudt.org/vocab/quantitykind/> .
@prefix unit: <http://qudt.org/vocab/unit/> .
@prefix rec: <https://w3id.org/rec#> .

bldg:my_space a s223:PhysicalSpace, rec:Kitchenette ;
    s223:hasProperty bldg:temp .

bldg:temp a s223:QuantifiableObservableProperty ;
    qudt:hasQuantityKind qudtqk:Temperature ;
    qudt:hasUnit unit:DEG_C .
```
