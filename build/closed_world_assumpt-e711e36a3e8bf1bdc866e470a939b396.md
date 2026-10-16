(closed-world)=
# Closed World Assumption

The 223 standard adopts a closed world assumption, which is believed by many to be more appropriate in an industrial or commercial application. Under this assumption, it becomes possible to reason about the absence of a piece of information. Accordingly, the 223 standard constrains the use of relations to those specifically declared as appropriate for any given class. 

The validation rule to enforce this informational constraint applies only to instances of s223: classes that use an s223: or qudt: property that lacks a relevant SHACL shape. 
Therefore, using a property with a namespace other than s223: or qudt: will not be flagged by the validation rule. A modeler is free to attach relations defined in other ontologies such as Brick, etc., assuming your application
imports the necessary definitions, or at least declares the non-s223 properties that are used.

Declaring these additional imports or explicitly declaring your non-s223 properties advertises to other parties how your applications deviate from strict conformance to s223, helping with interoperability issues.
