The standard will offer a mechanism to link to external data sources using the relation "hasExternalReference". The following example illustrates a property with a BACnet external reference. The following example uses BACnet schema as well.

```

[] a s223:BACnetExternalReference,
        s223:ExternalReference ;
    bacnet:device-identifier "device,12345" ;
    bacnet:object-identifier "analog-value,6" ;
    bacnet:property-identifier bacnet:PropertyIdentifier.present-value 

```