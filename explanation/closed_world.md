(closed-world)=
# Closed World Assumption

The 223 standard adopts a closed world assumption, which is believed by many to be more appropriate in an industrial or commercial application. Under this assumption, it becomes possible to reason about the absence of a piece of information. Accordingly, the 223 standard constrains the use of relations to those specifically declared as appropriate for any given class. The validation rule to enforce this informational constraint applies only to instances of s223: and qudt: that use a property for which a SHACL shape has not been defined for the defining class (or superclass). The intention is not to stop users from attaching additional properties defined in other ontologies. Such occurrences will be flagged as informational SHACL notifications, not SHACL violations.

It is best practice to explicitly declare those additional properties to be used by a target s223 class by providing a SHACL shape stating that as an extension for your applications. It can be as simple as the following example for two externally defined properties:
```
myPrefix:MyPropertyShapes
sh:property [
sh:path myPrefix:myProperty1 ;
] ;
sh:property [
sh:path myPrefix:myProperty2 ;
] ;
sh:targetClass s223:Concept ;
.
```
Doing this will eliminate the notifications for the two externally defined properties. A further advantage of explicitly declaring your properties is these definitions advertise to other parties how your applications deviate from strict conformance to s223, helping with interoperability issues.
