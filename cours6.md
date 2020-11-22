# Cours 6 XML Master CIM VCIEL

## Limites des DTD 
- ne sont au format XML
- ne supportent par les espaces de nom
- Types de donnée très limités

## XSD : XML Schema Definition

Les schémas XSD sont plus puissant que les DTD 
et permettent un contrôle bien supérieur 
que les DTD mais ils sont un peu plus complexes

### Exemple
XML
```xml
<Personne>         
    <nom>David</nom>         
    <prenom>Matin</prenom>         
    <age>24</age> 
</Personne>   
```

DTD

```dtd
<!ELEMENT Personne (nom, prenom, age)> 
<!ELEMENT nom (#PCDATA)> 
<!ELEMENT prenom (#PCDATA)> 
<!ELEMENT age (#PCDATA)>   
```
### XSD 
- XSD est un **fichier XML** 
- Son élément **racine** est "**xs:schema**" 
- XSD se réfère à des types prédéfinies (String, boolean, sequence...) ==> **ces éléments sont définis dans un espace de nom**  

```xml
<?xml version="1.0"?> 

<xs:schema 
xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns="http://www.w3schools.com" 
targetNamespace="http://www.w3schools.com" 
elementFormDefault="qualified" >          

<xs:element name="Personne">                 
    <xs:complexType>                         
        <xs:sequence>                                
            <xs:element name = "nom" type="xs:string" />                                 
            <xs:element name = "prenom" type="xs:string" />                          
            <xs:element name = "age" type="xs:positiveInteger" />
        </xs:sequence>                 
    </xs:complexType>         
</xs:element> 
</xs:schema>
```

XML

```xml
<?xml version="1.0"?>         
<Personne                 
xmlns="http://www.w3schools.com"                 
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.w3schools.com personne.xsd">                          
    <nom>Sehaba</nom>                         
    <prenom>Karim</prenom>                         
    <age>24</age>
</Personne> 
```

### Exemple 2 
Le XML
```xml
<?xml version="1.0"?> 
<note>         
    <to>Tove</to>         
    <from>Jani</from>         
    <heading>Reminder</heading>         
    <body>Don't forget me this weekend!</body> 
</note>  
```

Le DTD
```dtd
<!ELEMENT note (to, from, heading, body)> 
<!ELEMENT to (#PCDATA)> 
<!ELEMENT from (#PCDATA)> 
<!ELEMENT heading (#PCDATA)> 
<!ELEMENT body (#PCDATA)>  
```

Le XSD ?

Solution Étudiant 1 : 

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns="http://www.w3schools.com" 
targetNamespace="http://www.w3schools.com" 
elementFormDefault="qualified" >
<xs:element name="note">
  <xs:complexType>
    <xs:sequence>
      <xs:element name="to" type="xs:string"/>
      <xs:element name="from" type="xs:string"/>
      <xs:element name="heading" type="xs:string"/>
      <xs:element name="body" type="xs:string"/>
    </xs:sequence>
  </xs:complexType>
</xs:element>
</xs:schema>
```
> Correct

Solution Étudiant 2 : 

```xml
<?xml version="1.0"?>
<xs:schema
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns="http://www.w3schools.com" targetNamespace="http://www.w3schools.com" elementFormDefault="qualified">
    <xs:element name="note">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="to" type="xs:string"/>
                <xs:element name="from" type="xs:string"/>
                <xs:element name="heading" type="xs:string"/>
                <xs:element name="body" type="xs:string"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```
> Correct


## Syntaxe de quelques types :
- Type chaine – **xsd:string** 
- Type booléen – **xsd:boolean** (true / false / 1 / 0)
- Type numérique 
    * **xsd:interger**,
    * **xsd:decimal** ,
    * **xsd:float** (sur 32 bits), 
    * **xsd:double** (64 bits)
- Type date/heure *
    * **xsd:time** (4 :40) ,
    * **xsd:timeInstant** (4:40 le 24 sep 2005), 
    * **xsd:duration** (3heures et 15 min), 
    * **xsd:date**,
    * **xsd:month** , 
    * **xsd:year**

Concernant la déclaration des **éléments/attributs**, il faut respecter cette syntaxe :
- Un élément simple : `<xs:element name= "…" type="…"/>`
- Un attribut simple : `<xs:attribut name= “…“ type=“…“/>`

### Exemple 3 
XML 
```xml
<lastname>Refsnes</lastname>
<age>36</age>
<dateborn>1970-03-27</dateborn>
```

Donner XSD ??
