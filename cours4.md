# Cours 4 XML Master CIM VCIEL
**Exemple :**
DTD cv.dtd
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT CV (introduction, (formation | experience)*, loisirs, reference+)> <!ELEMENT introduction EMPTY >
<!ELEMENT formation EMPTY >
<!ELEMENT distance EMPTY >
<!ELEMENT experience EMPTY >
<!ELEMENT loisirs EMPTY >
<!ELEMENT reference EMPTY >
```

XML1
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE CV SYSTEM "CV.dtd"> 
<CV>
    <introduction> </introduction>
    <loisirs> </loisirs>
    <reference> </reference> 
</CV>
```
XML2

```xml
<?xml version="1.0" encoding="ISO-8859-1"?> <!DOCTYPE CV SYSTEM "CV.dtd">
<CV>
    <introduction> </introduction>
    <loisirs> </loisirs>
    <reference> </reference>
    <reference> </reference> 
</CV>
```
## Le type MIXED
Nous allons voir maintenant le type MIXED. Pour rappel, voici la syntaxe de la déclaration des éléments dans une DTD :
`<!ELEMENT nomElement Type> `

* **NomElement** : doit être unique dans la DTD. 
* Le **Type** peut être : **EMPTY**, un élément unique, **MIXED** ou **ANY**.

```dtd
<!ELEMENT loisirs (#PCDATA) > <!-- PCDATA (Parsed Character DATA) est une chaine de caractères -->
```
`<loisirs>` dans cet exemple est un élément dont le contenu est une chaine de caractères.
```xml
<loisirs> Je suis le contenu de l'élément...</loisirs>
```

### Exemple

DTD
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT CV (introduction, (formation | experience)*, loisirs, reference+)> 
<!ELEMENT introduction EMPTY >
<!ELEMENT formation EMPTY >
<!ELEMENT distance EMPTY >
<!ELEMENT experience EMPTY >
<!ELEMENT loisirs (#PCDATA) >
<!ELEMENT reference EMPTY >

```

Voici un code XML valide
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE CV SYSTEM "CV.dtd"> 
<CV>
    <introduction> </introduction>
    <formation> </formation>
    <experience> </experience>
    <formation> </formation>
    <loisirs>Je suis le contenu de l'élément... </loisirs>
    <reference> </reference>
    <reference> </reference>
</CV>
```

### Exercice

Soit le DTD suivant :
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT CV (introduction, (formation | experience)*, loisirs, reference+)> 
<!ELEMENT introduction EMPTY >
<!ELEMENT formation EMPTY >
<!ELEMENT distance EMPTY >
<!ELEMENT experience EMPTY >
<!ELEMENT loisirs (#PCDATA | filsDeLoisirs)* >
<!ELEMENT filsDeLoisirs EMPTY >
<!ELEMENT reference EMPTY >
```

Le XML est il valide ?
```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE CV SYSTEM "CV.dtd"> 
<CV>
    <introduction> </introduction>
    <formation> </formation>
    <experience> </experience>
    <formation> </formation>
    <loisirs> 
    <filsDeLoisirs>
    </filsDeLoisirs>
    </loisirs>
    <reference> </reference>
</CV>
```
>Reponse:
>Le xml est valide au regard du dtd
>


Et celui là ?

```xml
<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE CV SYSTEM "CV.dtd"> 
<CV>
    <introduction> </introduction>
    <formation> </formation>
    <experience> </experience>
    <formation> </formation>
    <loisirs>
        Hi!! 
        <filsDeLoisirs> </filsDeLoisirs>
        By!
    </loisirs>
    <reference> </reference>
</CV>
```
>Réponse :
>Le xml est valide au regard du dtd 
>

## Syntaxe de déclaration des _**attributs**_ d'un élément :

`<!ATTLIST nomElement nomAtt TypeAtt Defaut>`

**Exemple :**
```dtd
<!ELEMENT distance (#PCDATA)>
<!ATTLIST distance unites (miles | kilometers | tours) "miles">
```

L'élément `<distance>` ici possède un contenu de type chaine de caractères 
et un attribut "_**unites**_" qui peut avoir comme valeur : miles, kilometers ou tours. 
La valeur par défaut est "**miles**".

**Exemple XML**
```xml
<?xml version="1.0" encoding="ISO-8859-1"?> 
<!DOCTYPE distance SYSTEM "Exemple.dtd"> 
<distance unites = "miles"> </distance>
```
### Types d'attributs :
* **CDATA** : chaine de caractères
* **Enumération** : une séquence de valeurs
* **Notation** : une notation déclarée quelque part dans la DTD 
* **ENTITY** : une entité externe

**Exemple:**
```dtd
<!ATTLIST formation etablissement CDATA #REQUIRED>
```
L'attribut "**etablissement**" de l'élément "**formation**" est de type chaine de caractères.

Je peux ainsi avoir dans le xml ceci :
```xml
<formation etablissement="valeur de l'attribut..." >
```
```xml
<formation>blabla...</formation>
```
### Defaut
Syntaxe de déclaration d'un attribut : 
`<!ATTLIST nomElement nomAtt TypeAtt Defaut>`

**Defaut :** fait référence à une valeur ou un symbole qui indique l’emploi de l’attribut. 
Ses valeurs peuvent être :

* **REQUIRED** : l’attribut est obligatoire
* **IMPLIED** : l’attribut est facultatif
* **FIXED** : l’attribut possède une valeur fix
* **DEFAUT** : valeur par défaut de l’attribut.

#### Exercice
**DTD**
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT distance (#PCDATA)>
<!ATTLIST distance unites (miles | kilometers | tours) "miles">
```

XML
```xml
<?xml version="1.0" encoding="ISO-8859-1"?> <!DOCTYPE distance SYSTEM "Exemple.dtd"> 
<distance unites = "miles"> </distance>
```

**Question :** modifier le DTD afin de prendre en compte la ville de départ et la ville d'arrivée
 dans l'élément distance. Les deux attributs sont obligatoires.
 
 Ma réponse : 
 ```dtd
 <?xml version="1.0" encoding="ISO-8859-1"?>
 <!ELEMENT distance (#PCDATA)>
 <!ATTLIST distance unites (miles | kilometers | tours) "miles">
 <!ATTLIST distance ville_depart CDATA #REQUIRED>
 <!ATTLIST distance ville_arrivee CDATA #REQUIRED>
 ```
 >Reponse Correct


 Correction du prof: 
```dtd
 <?xml version="1.0" encoding="ISO-8859-1"?> 
 <!ELEMENT distance (#PCDATA)>
 <!ATTLIST distance
 unites (miles | kilometers | tours) "miles" 
 ville_depart CDATA #REQUIRED 
 ville_arrivee CDATA #REQUIRED
 >
```
> Une autre façon de faire 

Donnez un exemple de XML valide au regard du DTD: 

Ma réponse : 
```xml
 <?xml version="1.0" encoding="ISO-8859-1"?> 
<!DOCTYPE distance SYSTEM "Exemple.dtd"> 
<distance unites="miles" ville_depart="paris" ville_arrivee="borara"/>
```


## Exercice
Informations qu’on souhaite associer à une séance d’entrainement :
* **Date** : la date et l’heure de la séance d’entrainement ;
* **Type** : le type de séance (course, nage, vélo, etc.)
* **Rythme** cardiaque : le rythme cardiaque moyen enregistré au cours de la séance d’entrainement ; 
* **Durée** : la durée de la séance d’entrainement ;
* **Distance** : la distance couverte pendant la séance d’entrainement (mesurée en kilomètres, mètres ou en miles) ; 
* **Lieu** : le lieu de la séance d’entrainement ;
* **Commentaires** : remarques générales sur la séance d’entrainement.
