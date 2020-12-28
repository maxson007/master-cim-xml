# Cours 9 XML Master CIM VCIEL
## Rappel 
* Déclaration XSLT

* Création d'un lien entre XSLT et XML

```xml
<xsl:template match="/">
<xsl:for-each>
<xsl:value-of>
<xsl:if>

```
Opérateurs de comparaison qu'on peut utiliser :

* = (equal)
* != (not equal)
* &lt; less than
* &gt; greater than

## Suite du cours 8 

## Elément `<xsl:choose>` (équivalent de id then else)

```xml
<xsl:choose>
<xsl:when test="expression">
... some output 1...
</xsl:when>
<xsl:otherwise>
... some output 2 ....
</xsl:otherwise>
</xsl:choose>

```

Le code suivant va ajouter un fond de couleur rose à la colonne "artiste" Lorsque le prix du CD est
supérieur à 10. 

```xml
<xsl:choose>
<xsl:when test="price &gt; 10">
<td bgcolor="#ff00ff">
<xsl:value-of select="artist"/></td>
</xsl:when>
<xsl:otherwise>
<td><xsl:value-of select="artist"/></td>
</xsl:otherwise>
</xsl:choose>

```

## Résumé
* XML : bien formé
* DTD et XSD : validé les données selon modèle
* CSS et XSLT : recherche et la mise en forme des données XML
* => DOM : modèle d'objet de document

## ------- - DOM ; model Object Document --------------
«Le modèle d'objet de document (DOM) du W3C est une plate-forme et une interface indépendante du
langage qui permet aux programmes/scripts de mettre à jour de manière dynamique le contenu, la
structure et le style d’un document.

On distingue

* Le DOM HTML définit une méthode standard pour accéder et manipuler des documents HTML.
Il présente un document HTML sous forme d’arborescence.
*  Le DOM XML définit un moyen standard utilisé et de manipuler des documents XML. Il présente
un document XML sous forme d'arborescence.

Le DOM XML est:
*  Un modèle d'objet standard pour XML
*  Une interface de programmation standard pour XML
* Indépendant de la plaque-forme et du langage
* Une norme W3C

En d'autres termes: le DOM XML est un standard pour savoir comment obtenir, modifier, ajouter ou
supprimer des éléments XML.

## API DOM de PhP
3 classes principales
* DOMNode
* DOMElement (étend DOMNode)
* DOMDocument (étend DOMNode)

## Evaluation du module XML
- Projet à réaliser dont les modalités vous seront précisées la semaine prochaine
- QCM en ligne le vendredi 15 janvier 2021