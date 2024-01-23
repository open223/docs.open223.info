# Modeling Electricity

Specifying the electrical service on a wire or circuit warrants a bit of explanation. This guide shows the simple way to specify the electrical characteristics, 
and then goes into more detail about what is "under the hood" interms of modeling it.

## Using predefined electrical service
The 223 standard comes with a predefined vocabulary of common electrical service, so the easiest way to model is simply to pick the appropriate service from the controlled vocabulary. 
Shown below is a small excerpt of available AC electrical service.

![ACServiceExcerpt](images/guides-AC-service-excerpt.png)

There is a naming convention to help the human reader in understanding each option, but note that later in this guide we will show how all the 
properties of the service are queryable without resorting to parsing the name of the service. With that disclaimer, 
a human reader can interpret the service s223:AC-120VLN-1Ph-60Hz to mean "AC electricity, carrying 120 volts between Line and Neutral, single-phase, at 60Hz frequency".

A more complex example is s223:AC-220VLL-127VLN-3Ph-50Hz, meaning "three-phase, 50Hz AC electricity, with 220V line-line voltage and 127V line-neutral voltage".

Assuming your desired electrical service is listed in the vocabulary, the simplest way to model the electricity in the building is to use the s223:hasMedium relation, as shown below:

![ACServiceExample](images/guides-AC-service-example.png)

## The structure of the electricity vocabulary entries
Since 223 is a semantic standard, relying on the naming convention is not sufficient to allow for querying of a model. 
For those who need to go deeper, the following section explains the structure of each of the vocabulary entries for electricity. Shown below is a diagram of that structure:

![110Vstructure](images/guides-110V-60Hz-single-phase-structure.png)


