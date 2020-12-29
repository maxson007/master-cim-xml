# Cours 1 XML Master CIM VCIEL
## Plan du cours XML
### II. STRUCTURE D’UN DOCUMENT XML
### III. DOCUMENT BIEN FORME/VALIDE
### IV. DOCUMENT TYPE DEFINITION (DTD)
### V. XSD : XML SCHEMA
### VI. XML CSS
### VII. XML XSLT  
### VIII. XML NAMESPACE
### IX.  XML DOM

## Introduction
XML signifie langage de balisage extensible (eXtensible Markup Language).

Comme HTML, il s'agit d'un langage de balisage.
Il a été conçu pour stocker et transporter des données.
XML est une recommandation du W3C (https://www.w3.org)
Exemple d'un document XML
 ```xml
<?xml version="1.0" encoding="ISO-8859-1"?> 
<biblio>
    <livre>
        <titre> Les Misérables </titre> 
        <auteur> Victor Hugo </auteur>
    </livre>
    <livre>
        <titre> L'Assommoir </titre> 
        <auteur> Émile Zola </auteur>
    </livre> 
</biblio>
```

## Composants d'un document XML
1. Un proglogue 
2. Un élément racine 
3. Un arbre

#### Prologue
Le **prologue** contient des informations de traitement pour le processeur XML. 
Sa syntaxe est la suivante :
```
<?xml version="1.0" [encoding = "encodage"] [standalone = "yes|no"] ?>
```

Ainsi, le prologue contient trois informations :
1. **Version** : conformité du document à une version de la norme XML (généralement 1.0)
2. **Encoding** : codage de caractères utilisé (par défaut « UTF-8 »)
3. **Standalone** : La présence ou non de références externes (DTD par exemple. Par défaut « no »)

#### Racine
Exemple d'une **racine** 

```xml
<?xml version="1.0" encoding="ISO-8859-1"?> 
<biblio>
    <livre>
        <titre> Les Misérables </titre> 
        <auteur> Victor Hugo </auteur>
    </livre>
    <livre>
        <titre> L'Assommoir </titre> 
        <auteur> Émile Zola </auteur>
    </livre> 
</biblio>
```
Dans cet exemple, l'élément racine est `<biblio>`


 #### L'arbre d'éléments
 Le troisième composant est **l'arbre d'éléments**.
 Un élément est défini par une paire de balises 
 (balise ouvrante et balise fermante) et de son contenu.
 Exemple : `<titre>` Les Misérables `</titre>`
 est un élément, sa balise ouvrante est `<titre>` 
 et sa balise fermante est `</titre>` et son contenu est "Les Misérables"
 
 Exemple d'un élément avec deux attributs :
` <chapitre version="provisoire" date="16/06/03">` Structure d'un document XML `</chapitre>`

 Les attributs doivent être définis dans la balise ouvrante.
 
 Cet élément ainsi contient deux attributs : 
 le premier est "version" qui a comme valeur "provisoire" 
 et le deuxième est "date" qui a comme valeur "16/06/03"
 
 Exemple d'un élément avec deux sous-élements :
```xml
<livre>
    <titre> Les Misérables </titre>
    <auteur> Victor Hugo </auteur> 
</livre>
```
Dans cet exemple, l''élément `<livre>` contient deux sous éléments : 
titre et auteur dont les contenus sont "Les Misérables" et "Victor Hogo" respectivement 

#### Règles syntaxiques d'XML :

1. Un document XML doit contenir un seul élément racine.
2. Chaque élément est définit par une balise ouvrante et une balise fermante.
3. Les éléments doivent être imbriqués correctement (sans chevauchement).
4. Les balises sont sensibles à la casse. // Le nom d'un élément donné ne peut pas commencer par un chiffre et ne peut comporter que des chiffres, des lettres, des traits d'union, des points, des double points ou des soulignés.

Un document xml est bien formé s'il respecte ces règles syntaxiques.

Exemple 1: 
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<biblio>
 <livre>
   <titre> Les Misérables </titre>
   <auteur> Victor Hugo </auteur>
 </livre>
 <livre>
  <titre> L'Assommoir </titre>
  <auteur> Émile Zola </auteur>
 </livre>
</biblio>
<PoleAudioVis>
         
</PoleAudioVis>
```
==> Ce document n'est pas bien formé : il possède deux éléments racine

Exemple 2
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<biblio>
      <livre>
            <titre> Les Misérables </titre>
            <auteur> Victor Hugo </auteur>
      </livre>
      <livre>
            <titre> L'Assommoir </titre>
            <auteur> Émile Zola </auteur>
            <couverture couleur="rouge" />
      </livre>
</biblio>
```
==> Ce document est bien formé