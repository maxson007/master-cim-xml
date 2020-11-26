# Cours 7 XML Master CIM VCIEL

## Déclaration d’un élément : `<xsd:element name= "…" type="…"/>`
### Exemple
XSD : `<xs:element name="nom" type="xs:string"/>`

XML : `<nom>Martin</nom>`

## Déclaration d’un attributs : < xsd:attribut name= "…" type="…"/>
### Exemple 1
XSD
```xml
<xs:element name="nom">
 <xs:complexType>
 <xs:attribute name="age" type="xs:int" />
 </xs:complexType>
</xs:element>
```
XML
`<nom age="6" />`

### Valeur par défaut d'un attribut
```xml
<xs:attribute name="lang" type="xs:string" default="EN"/>
```
### Attribut obligatoire
```xml
<xs:attribute name="lang" type="xs:string" use="required"/>
```

### Question
XML

```xml
<lastname>Refsnes</lastname>
<age>36</age>
<dateborn>1970-03-27</dateborn>
```
XSD
```xml
<xs:element name="lastname" type="xs:string"/>
<xs:element name="age" type="xs:integer"/>
<xs:element name="dateborn" type="xs:date"/>
```
### Exemple 2

Reprenons le DTD :

```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT CV (introduction, formation, experience, loisirs, reference)>
<!ELEMENT introduction EMPTY >
<!ELEMENT formation EMPTY >
<!ELEMENT distance EMPTY >
<!ELEMENT experience EMPTY >
<!ELEMENT loisirs EMPTY >
<!ELEMENT reference EMPTY >
```

XSD ?

Proposition étudiant 1 
```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
xmlns="http://www.w3schools.com"
targetNamespace="http://www.w3schools.com"
elementFormDefault="qualified" >
    <xs:element name="CV">
        <xs:complexType>
        <xs:sequence>
            <xs:element name="introduction" type="xs:string"/>
            <xs:element name="formation" type="xs:string"/>
            <xs:element name="distance" type="xs:string"/>
            <xs:element name="experience" type="xs:string"/>
            <xs:element name="loisirs" type="xs:string"/>
            <xs:element name="reference" type="xs:string"/>
        </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```
XML

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<CV xmlns="http://www.w3schools.com"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.w3schools.com cv.xsd">
    <introduction></introduction>
    <formation></formation>
    <experience></experience>
    <loisirs></loisirs>
    <reference></reference>
</CV>

```


## Type personnalisé

Types prédéfinis :
- Type chaine – xsd:string
- Type booléen – xsd:boolean (true / false / 1 / 0)
- Type numérique – xsd:interger, xsd:decimal , xsd:float (sur 32 bits), xsd:double (64 bits)
- Type date/heure – xsd:time (4 :40) , xsd:timeInstant (4:40 le 24 sep 2005), xsd:duration (3heures et 15
min), xsd:date, xsd:month , xsd:year

XSD permet de créer des types personnalisés, ce qui permettrait d’adapter des types simples à vos propres
besoins.
Souvent, les types personnalisés représentent des contraintes sur des types simples.

## Restriction sur les valeurs

```xml
<xs:element name="age">
     <xs:simpleType>
        <xs:restriction base="xs:integer">
            <xs:minInclusive value="0"/>
            <xs:maxInclusive value="120"/>
        </xs:restriction>
    </xs:simpleType>
</xs:element>
```

## Restriction sur un ensemble de valeurs

```xml
<xs:element name="voiture">
    <xs:simpleType>
        <xs:restriction base="xs:string">
            <xs:enumeration value="Renault"/>
            <xs:enumeration value="Golf"/>
            <xs:enumeration value="Peugeot"/>
        </xs:restriction>
    </xs:simpleType>
</xs:element>
```

### Question
Modifier l’XSD de l'exemple précédent afin que le contenu de l’élément "loisirs" 
puisse avoir que trois valeurs possibles : sport, lecture et voyage.
```xml
<xs:element name="loisir">
     <xs:simpleType>
         <xs:restriction base="xs:string">
             <xs:enumeration value="Sport"/>
             <xs:enumeration value="Lecture"/>
             <xs:enumeration value="Voyage"/>
         </xs:restriction>
     </xs:simpleType>
</xs:element>
```

Réponse :

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="http://www.w3schools.com"
xmlns="http://www.w3schools.com"
elementFormDefault="qualified">
    <xs:element name="CV">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="introduction" type="xs:string"/>
                <xs:element name="formation" type="xs:string"/>
                <xs:element name="experience" type="xs:string"/>
                <xs:element name="loisirs">
                    <xs:simpleType>
                        <xs:restriction base="xs:string">
                            <xs:enumeration value="Sport"/>
                            <xs:enumeration value="Lecture"/>
                            <xs:enumeration value="Voyage"/>
                        </xs:restriction>
                    </xs:simpleType>
                </xs:element>
                <xs:element name="reference" type="xs:string"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```

## Restriction sur une chaine de caractères

* **xs:length** --> nombre de caractères
* **xs:minlenght** --> minimum autorisé
* **xs:maxlength** --> maximum autorisé

### Question
Modifiez le schéma XSD pour que l’introduction ne dépasse pas 50 caractères.
Solution
```xml
<xs:element name="introduction">
     <xs:simpleType>
         <xs:restriction base="xs:string">
            <xs:maxlength value="50"/>
         </xs:restriction>
     </xs:simpleType>
</xs:element>
```

## Différence entre Types simples et complexe ?
- **Simple** `<xs:simpleType>` : pas de sous élément, pas d’attribut
- **Complexe** `<xs:complexType> `: peut contenir des sous-éléments et des attributs

### Question
Modifier l'XSD pour que le contenu de l'introduction soit entre 10 et 50 caractères.

Solution
```xml
<xs:element name="introduction">
     <xs:simpleType>
         <xs:restriction base="xs:string">
             <xs:minlength value="10"/>
             <xs:maxlength value="50"/>
         </xs:restriction>
     </xs:simpleType>
</xs:element>
```
### XSD complet

```xml
<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema"
targetNamespace="http://www.w3schools.com"
xmlns="http://www.w3schools.com"
elementFormDefault="qualified">
    <xs:element name="CV">
        <xs:complexType>
            <xs:sequence>
                <xs:element name="introduction">
                    <xs:simpleType>
                        <xs:restriction base="xs:string">
                            <xs:maxLength value="50" />
                            <xs:minLength value="10" />
                        </xs:restriction>
                    </xs:simpleType>
                </xs:element>
                <xs:element name="formation" type="xs:string"/>
                <xs:element name="experience" type="xs:string"/>
                <xs:element name="loisirs">
                    <xs:simpleType>
                        <xs:restriction base="xs:string">
                            <xs:enumeration value="Sport"/>
                            <xs:enumeration value="Lecture"/>
                            <xs:enumeration value="Voyage"/>
                        </xs:restriction>
                    </xs:simpleType>
                </xs:element>
                <xs:element name="reference" type="xs:string"/>
            </xs:sequence>
        </xs:complexType>
    </xs:element>
</xs:schema>
```

XML

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<CV xmlns="http://www.w3schools.com"
xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.w3schools.com cv.xsd">
    <introduction></introduction>
    <formation></formation>
    <experience></experience>
    <loisirs>Sport</loisirs>
    <reference></reference>
</CV>
```

## Mise en forme des données
La mise en forme des données xml peut se faire à travers deux langages :
- CSS : Cascading Style Sheets et
- XSLT : eXtensible Stylesheet Language Transformations

### CSS
#### Déclaration
Pour appliquer la mise en forme d’un fichier CSS sur un document XML, 
il faut déclarer dans le prologue XML : 
#### Exemple
```xml
<?xml-stylesheet type="text/css" href="nom_fichier.css"?>
<?xml version = "1.0"?>
<lettre>
    <nom>Dubois</nom>
    <prenom>Bernard</prenom>
    <date>12/10/1993</date>
    <adresse>13, rue Victor Hugo, Paris</adresse>
    <nom>Mortreux</nom>
    <prenom>Celine</prenom>
    <date>02/06/1983</date>
    <adresse>126, boulevard Henri IV, Lille</adresse>
    <nom>Bricot</nom>
    <prenom>Judas</prenom>
    <date>04/07/1988</date>
    <adresse>125 Baume Strasse, Franckfurt</adresse>
    <nom>Martin</nom>
    <prenom>Christelle</prenom>
    <date>23/01/1990</date>
    <adresse>Appt n°3, 13 avenue des capucines, Tours</adresse>
    <nom>Dubois</nom>
    <prenom>Paul</prenom>
    <date>30/12/1991</date>
    <adresse>1234, Promenade des anglais, Nice</adresse>
</lettre>
```
Solution CSS
```css
nom {
    display : block;
    color:red;
    font-size:18pt;
    left : 250px;
    top: 200px;
}
prenom {
    display : block;
    color:green;
    font-size:18pt;
}

date {
     display : block;
     color:blue;
     font-size:14pt;
}
adresse {
     display : block;
     color:brown;
     font-size:14pt;
}
```