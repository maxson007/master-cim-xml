# Cours personnel DTD du livre XML

## La définition d’un élément

L’élément (ou balise) est exprimé par l’instruction _ELEMENT_ suivie du nom de l’élément
que l’on souhaite décrire et de son contenu. Ce dernier n’englobe que les éléments situés
directement sous cet élément (les éléments fils).

**Voici une synthèse de cette syntaxe :**
`<!ELEMENT unNom DEF_CONTENU>`

**DEF_CONTENU** peut contenir :

 - **EMPTY** : l’élément n’a pas de contenu ; il est donc vide. Il peut cependant avoir des attributs.
 - **ANY** : l’élément peut contenir n’importe quel élément présent dans la DTD.
 - **(#PCDATA)** : l’élément contient du texte. Le caractère # est là pour éviter toute ambiguïté
avec une balise et indique au parseur qu’il s’agit d’un mot-clé. PCDATA signifie
Parsable Character DATA.
 - Un élément placé entre parenthèses comme (nom_element). 
   * Le nom d’un élément désigne une référence vers un élément décrit dans une autre partie de la DTD
 - Un ensemble d’éléments séparés par des opérateurs, le tout placé entre parenthèses.
   * **L’opérateur de choix**, représenté par le caractère "**|**", 
   indique que l’un ou l’autre de deux éléments (ou deux ensembles d’éléments) doit être présent. 
   * **L’opérateur de suite (ou séquence)**, représenté par le caractère **","**, indique que les deux éléments (ou les deux
ensembles d’éléments) doivent être présents. Des parenthèses supplémentaires
peuvent être utilisées pour lever les ambiguïtés.

>**Remarques**
>
>Les mots-clés **EMPTY** et **ANY** s’emploient sans parenthèse. Les opérateurs de choix ou de séquence
>s’appellent également des connecteurs (ils connectent les éléments).

**Quelques exemples avec l’opérateur de choix :**
```dtd
<!ELEMENT personne (nom_prenom | nom)>
<!ELEMENT nom_prenom (#PCDATA)>
<!ELEMENT nom (#PCDATA)>
```
Cela nous autorise deux documents XML, soit :
```xml
<personne>
    <nom_prenom>Brillant Alexandre</nom_prenom>
</personne>
```
ou bien :
```xml
<personne>
    <nom>Brillant</nom>
</personne>
```

**Autre cas avec l’opérateur de séquence.**
```dtd
<!ELEMENT personne(prenom,nom)>
<!ELEMENT prenom (#PCDATA)>
<!ELEMENT nom (#PCDATA)>
```
Ici, l’opérateur de séquence limite les possibilités à un seul document XML valide :
```xml
<personne>
    <prenom>Alexandre</prenom>
    <nom>Brillant</nom>
</personne>
```

Les contenus (élément ou groupe d’éléments) 
peuvent être quantifiés par les opérateurs "*", "+" et "?". 
Ces opérateurs sont liés au concept de cardinalité. 
Lorsqu’il n’y a pas d’opérateur, la quantification est de 1 (donc toujours présent).

**Voici le détail de ces opérateurs :**
 * '*' : 0 à n fois ;
 * '+' : 1 à n fois ;
 * '?' : 0 ou 1 fois.
 
 **Quelques exemples :**
 
` <!ELEMENT plan (introduction?,chapitre+,conclusion?)>`
 L’élément _**plan**_ contient un élément _**introduction**_ optionnel, 
 suivi d’au moins un élément **_chapitre_** 
 et se termine par un élément _**conclusion**_ optionnel également.
 
` <!ELEMENT chapitre (auteur*,paragraphe+)>`
 L’élément **_chapitre_** contient de 0 à n éléments **_auteur_** 
 suivi d’au moins un élément **_paragraphe_**.
 
` <!ELEMENT livre (auteur?,chapitre)+>`
 L’élément **_livre_** contient au moins un élément, 
 chaque élément, étant un groupe d’éléments
 où l’élément _**auteur**_, est optionnel 
 et l’élément **_chapitre_** est présent en un seul exemplaire.
 
 ## La définition d’un attribut
 Les attributs sont précisés dans l’instruction **ATTLIST**. 
 Cette dernière, étant indépendante de l’instruction **ELEMENT**,
 on précise à nouveau le nom de l’élément sur lequel s’applique le ou les attributs. 
 On peut considérer qu’il existe cette forme syntaxique :
 `nom TYPE OBLIGATION VALEUR_PAR_DEFAUT`
 
 ### Le **_TYPE_** peut être principalement :
 * CDATA : du texte (Character Data) ;
 * ID : un identifiant unique (combinaison de chiffres et de lettres) ;
 * IDREF : une référence vers un ID ;
 * IDREFS : une liste de références vers des ID (séparation par un blanc) ;
 * NMTOKEN : un mot (donc pas de blanc) ;
 * NMTOKENS : une liste de mots (séparation par un blanc) ;
 * Une énumération de valeurs : chaque valeur est séparée par le caractère |.
 
 ### L’_**OBLIGATION**_ ne concerne pas les énumérations qui sont suivies d’une valeur par défaut.
 Dans les autres cas, on l’exprime ainsi :
 * '**#REQUIRED**' : attribut obligatoire.
 * '**#IMPLIED**' : attribut optionnel.
 * '**#FIXED**' : attribut toujours présent avec une valeur. Cela peut servir, par exemple, à
 imposer la présence d’un espace de noms.
 
 La _**VALEUR_PAR_DEFAUT**_ est présente pour l’énumération ou lorsque la valeur est typée avec
 '#IMPLIED' ou '#FIXED'.
 
 **Quelques exemples :**
 ```dtd
 <!ATTLIST chapitre
 titre CDATA #REQUIRED
 auteur CDATA #IMPLIED>
 ```
 L’élément **_chapitre_** possède ici un attribut **_titre_** obligatoire 
 et un attribut **auteur** optionnel.
```dtd
 <!ATTLIST crayon
 couleur (rouge|vert|bleu) "bleu">
 ```
 L’élément _**crayon**_ possède un attribut **_couleur_** dont 
 les valeurs font partie de l’ensemble **rouge**, **vert**, **bleu**.