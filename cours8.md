# Cours 8 XML Master CIM VCIEL
## La déclaration d'une feuille de style XSLT est comme suit :

`<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">`

ou

`<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">`

## Association entre XML et XSLT

`<?xml-stylesheet type="text/xsl" href="fichier.xsl"?>` 
 (A mettre dans le document XML)
 
### Exemple
XML
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<?xml-stylesheet type="text/xsl" href="exemple1.xsl"?>
<catalogue>
     <cd>
         <titre>Empire Burlesque</titre>
         <artiste>Bob Dylan</artiste>
         <pays>USA</pays>
         <maison_disque>Columbia</maison_disque>
         <prix>10.90</prix>
         <annee>1985</annee>
     </cd>
     <cd>
         <titre>Hide your heart</titre>
         <artiste>Bonnie Tyler</artiste>
         <pays>UK</pays>
         <maison_disque>CBS Records</maison_disque>
         <prix>9.90</prix>
         <annee>1988</annee>
     </cd>
     <cd>
         <titre>Greatest Hits</titre>
         <artiste>Dolly Parton</artiste>
         <pays>USA</pays>
         <maison_disque>RCA</maison_disque>
         <prix>9.90</prix>
         <annee>1982</annee>
     </cd>
</catalogue>

```
XSLT
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
             <body>
                 <h2>My CD Collection</h2>
                 <table border="1">
                     <tr bgcolor="#9acd32">
                         <th>Titre</th>
                         <th>Artiste</th>
                     </tr>
                     <xsl:for-each select="catalogue/cd">
                         <tr>
                             <td><xsl:value-of select="titre"/></td>
                             <td><xsl:value-of select="artiste"/></td>
                         </tr>
                     </xsl:for-each>
                 </table>
             </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

```

* L’élément <xsl:stylesheet> indique qu’il s’agit d’un document XSLT
* L’élément <xsl:template> définit un template. L’attribut match=“/“ associe le template avec l’élément
root du document source (soit l'élément catalogue dans notre exemple)
* L'élément <xsl:for-each> est utilisé pour sélectionner tous les éléments d'un noeud spécifié
* L'élément de <xsl:value-of> permet d'extraire la valeur d'un élément XML et l'ajouter dans le flux de
sortie de la transformation

### Opérateurs de comparaison qu'on peut utiliser :

* = (equal)
* != (not equal)
* &lt; less than
* &gt; greater than

Exemple : https://www.w3schools.com/xml/xsl_intro.asp

### Question 1
Modifier le code afin d'afficher tous les éléments "cd" dont l'artiste est différent de "Dolly Parton"
### Solution
`<xsl:for-each select="catalog/cd[artist!='Dolly Parton']">`

### Question 2
Modifiez l'exemple précédent pour trier le résultat par ordre alphabétique (par rapport aux artistes)
### Solution
```xml
<xsl:for-each select="catalog/cd[artist!='Dolly Parton']">
<xsl:sort select="artist"/>
```

### Question 3
Afficher tous les CD dont le prix est supérieur à 10
### Solution
L'élément <xsl:if test="expression">
```xml
<xsl:if test="price &gt; 10">
    <tr>
        <td>
            <xsl:value-of select="title"/> 
        </td>
        <td>
            <xsl:value-of select="artist"/>
        </td>
        <td>
            <xsl:value-of select="country"/>
        </td>
        <td>
            <xsl:value-of select="price"/>
        </td>
    </tr>
</xsl:if>

```