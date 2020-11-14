#Cours 4 XML Master CIM VCIEL
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
    <introduction></introduction>
    <loisirs></loisirs>
    <reference></reference> 
</CV>
```
XML2

```xml
<?xml version="1.0" encoding="ISO-8859-1"?> <!DOCTYPE CV SYSTEM "CV.dtd">
<CV>
    <introduction></introduction>
    <loisirs></loisirs>
    <reference></reference>
    <reference></reference> 
</CV>
```
## Le Ttype MIXED
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
    <introduction></introduction>
    <formation></formation>
    <experience></experience>
    <formation></formation>
    <loisirs>Je suis le contenu de l'élément... </loisirs>
    <reference></reference>
    <reference></reference>
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