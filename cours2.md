# Cours 2 XML Master CIM VCIEL

## Rappel 
Les règles qui doivent être respectées par un documenet XML :
  * Les documents XML doivent avoir un élément racine
  * Un élément XML doit avoir une balise d'ouvereture et de fermante
  * Les balises XML sont sensibles à la casse
  * Les éléments XML doivent être correctement imbriquées
    
Exemple 1: 

```xml
<cd>
    <titre>Empire Burlesque</Titre>
    <artiste>Bob Dylan</artiste>
    <pays>USA</pays>
    <maison_disque>Columbia</maison_disque> 
    <prix>10.90</prix>
    <annee>1985</annee>
</cd>

```
Exemple 2 :

```xml
<cd>
    <titre>Empire Burlesque</titre>
    <artiste>Bob Dylan</artiste>
    <pays>USA</pays>
    <maison_disque>Columbia</maison_disque>
    <prix>10.90</prix>
    <annee>1985</annee>
</cd>
<cd>
    <Titre>Hide your heart</Titre>
    <artiste>Bonnie Tyler</artiste>
    <pays>UK</pays>
    <maison_disque>CBS Records</maison_disque>
    <prix>9.90</prix>
    <annee>1988</annee>
</cd>

```
Exemple d'un commentaire :
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- ceci est correct -->
<elt> un peu de texte <!-- ceci est correct --> </elt>

```
Les commentaires sont autorisés par tout sauf dans le proglogue et dans une balise.


#### Exercice
Créer un document XML bien formé représentant la lettre suivante : http://liris.cnrs.fr/~ksehaba/Exo1_XML
![DESCRIPTION DE L'IMAGE](http://liris.cnrs.fr/~ksehaba/Exo1_XML)

Ma proposition:
```xml
<?xml version="1.0" encoding="utf8" ?>
<lettre>
    <en-tete>
        <adresse>
        Université Lyon lyon 2  ...
        </adresse>
        <date> 10 Octobre 2020</date>
    </en-tete>
    <destinataire> Liris bvd 11 nov villeurbanne</destinataire>
    <objet> Objet projet ddddd</objet>
    <salutation> Monsieur , madamme</salutation>
    <corps>
    Par cette lettre je vous addresse ........
    </corps>
    <signature> Alain Minard </signature>
    <pied>vellem .....</pied>
</lettre>
```

Correction du professeur :
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<lettre> 
    <en-tete>
        <nom-etab>Université Lyon 2</nom-etab> 
        <adresse>
            <numero>86</numero> 
            <rue>Rue Pasteur</rue> 
            <ville>Lyon</ville>
        </adresse> 
    </en-tete>
    <date>1/10/2010</date>
    <destinataire> 
        <nom-dest>Liris</nom-dest> 
        <adresse>
            <numero>43</numero> 
            <rue>Bvd 11 nov</rue>
            <ville>Villeurbanne</ville>
        </adresse>
    </destinataire>
    
    <objet> Projet...</objet> 
    <salut>Monsieur,</salut> 
    <corps>
        <para>Quam quidem... </para>
        <para>Optimi adulescentis... </para> 
    </corps>
    <sig/>
    <pied>...</pied> 
</lettre>
```
Représentation avec des attributs : 
`<date jour = "1" mois="10" année ="2010" />`

# Le DTD
### Introduction au DTD

Dans les exemples que nous avons vu jusqu’à présent,
on avait aucune contrainte sur la structures des éléments XML
Ceci peut poser problème dans certains cas, en particulier pour le traitement des donnée. 
Afin d'harmoniser la représentation des données,
on a créé des lanages qui permettent de définir le format et la structure des données XML. 

Il s’agit de : **Document Type Definition (DTD)** et XML Schéma (XSD).

### Définition de DTD : 
Un DTD permet de définir le format et la structure des données XML.
Ainsi, dans un fichier DTD, on peut définir les balises possibles et leurs attributs,
les balises qui sont autorisées à l’intérieur d’autres balises,
les balises et les attributs obligatoires/optionnelles...

Les règles DTD peuvent être définies dans le fichier xml lui même (DTD interne) 
ou dans un fichier différent (DTD externe).

#### Syntaxe d'une déclaration interne :
```xml
<?xml version="1.0" standalone="yes">
<!DOCTYPE racine[ <!--sous-ensemble de DTD interne --> ]>
<racine> 
... 
</racine>
```

**Exemple :** 

```xml
<?xml version="1.0" standalone="yes"?> 
<!DOCTYPE hello [<!ELEMENT helo (#PCDATA)>l ]>
```

```xml
<hello> Hello XML et hello chère lectrice! </hello>
```

Dans cette exemple, dans le bloc <!DOCTYPE ....>, 
on a déclaré un élément "hello" de type chaine de caractères 
(le code " (#PCDATA)" signifie une chaine de caractères)

#### Syntaxe d'une déclaration externe : 
Dans un DTD externe (règles définit dans un fichier séparé), 
l’association entre le fichier xml et DTD se fait dans le xml juste après la déclaration XML 
et le premier élément.

Voici la syntaxe :
```dtd
<!DOCTYPE RootElement SYSTEM ExernelDTDRef [InternelDTDRef] >
```

- RootElement : l’élément racine du document.
- ExernelDTDRef [InternelDTDRef] : 
  * La déclaration de type de document peut être interne ou externe. 
  * La première inclue des déclarations de balisage dans le document XML (elle est spécifique à chaque document donné).
  * La deuxième inclue des déclarations de balisage externe (dans un fichier ou sur une URI). 
  Elle décrit en principe la structure générale d’une classe de document.

**Exemple :**
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE note SYSTEM "Note.dtd">
<note>
<to>Tove</to>
<from>Jani</from>
<heading>Reminder</heading>
<body>Don't forget me this weekend!</body> 
```

Dans cet exemple, on déclare dans le XML un DTD externe : 
 - les règles sont définies dans un fichier appelé note.dtd. 
 - La racine du XML est "note" selon cette déclaration 

Concernant la déclaration des éléments dans un DTD, 
la syntaxe suivante doit être respectée : `<!ELEMENT nomElement Type>`

- **NomElement** doit être unique dans un DTD. 
- Le **Type** peut être : **EMPTY**, un élément unique, **MIXED** ou **ANY**. 
  * **EMPTY** signifie "élément vide" (ne possédant aucun contenu).

**Exemple :**  
`<!ELEMENT habit EMPTY>.`

Dans cet exemple, l'élément suivant est faux : `<habit>Jolit-shirt </habit>`
