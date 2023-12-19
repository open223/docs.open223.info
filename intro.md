(landing-page)=
# ASHRAE Standard 223P User Documentation [![Jupyter Book Badge](https://jupyterbook.org/badge.svg)](https://open223.github.io/docs.open223.info/)

The purpose of this site is to provide documentation for users of the *proposed* ASHRAE Standard 223, ***Designation and Classification of Semantic Tags for Building Data***.

```{note}
This site is developed in conjunction with the ASHRAE Standard 223 project committee. However, it is not an official ASHRAE product or a part of the standard.
```

Standard 223 defines modeling constructs for use in creating a machine-readable representation of building systems, the building spaces that they serve, and the measurement and control points used to provide a safe and comfortable environment for the building occupants. The standard can be considered a toolkit of components and rules for using them to create a semantic model of a particular building or campus of buildings. The resulting model provides a way for software applications to determine the relationships between the mechanical equipment in the building (i.e., AHU 1 gets chilled water from CH 3 and provides conditioned air to VAV Boxes 12 through 15 serving rooms on the third floor) and the meaning of measurements that are available (i.e., T16 is a temperature sensor measuring the temperature of the air stream exiting AHU 1). This facilitates the implementation of advanced features in buildings like automated fault detection and diagnostics, supervisory controls, automated commissioning, and more.

````{margin}
```{important}
The proposed standard is not yet available for public review.
```
````

The documentation uses Diataxis[^1] as a framework for its structure, which is organized into the following sections.

[^1]: https://diataxis.fr/

## Table of Contents
```{tableofcontents}
```
