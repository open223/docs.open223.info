# Modeling Design Patterns

TODO Section on design patterns here
This could also be reference, if we just want to treat them as examples of how 223P models are constructed

Several modeling tools such as BuildingMOTIF and Bob enable modelers to easily reuse design patterns in their models. Both of these tools have pre-existing templates that allow developers to model at a higher level. However, buildings are unique and developers may need to model pieces of equipment that are not already represented in 223P model creation tools. 

This section guides developers on modeling connectivity and describing the topology between equipment. The topology diagram below illustrates various concepts and relations relevant to establishing connections. Building upon this general diagram, the following sections will detail incremental changes and provide examples to illustrate the progression of complexity. As shown in the topology diagram, predicates are defined at different levels of abstraction. This diagram demonstrates how various concepts in the standard describe connectivity between two Connectables. Some predicates are exclusive to connections between Connectable and ConnectionPoints, such as hasConnectionPoint, while others only apply between ConnectionPoints and Connections, like connectsAt. However, the generic "cnx" relation can describe connectivity between any concept involved, including Connectable, Connection, and ConnectionPoint. It's crucial to note that all other predicates can be inferred from the "cnx" predicate.

![TopologyDiagram](images/guides-TopologyDiagram.png)
![Connection1](images/guides-Connection1.png)
![Connection2](images/guides-Connection2.png)
![BasicCnx](images/guides-BasicCnx.png)
![Containment](images/guides-Containment.png)
![UserSwitch](images/guides-UserSwitch.png)
![DumbSwitch](images/guides-DumbSwitch.png)




