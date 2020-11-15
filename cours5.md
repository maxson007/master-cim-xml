# Cours 5 XML Master CIM VCIEL


## Exercice
Vous allez concevoir un DTD qui modélise les données d’entrainement relatives à des sports d’endurance
comme la course à pied, la natation, le cyclisme, etc. Voici les informations qui doivent être associées à
chaque séance individuelle d’entrainement :
- **Date** : la date et l’heure de la séance d’entrainement ;
- **Type** : le type de séance d’entrainement (course, nage, vélo, etc.)
- **Rythme cardiaque** : le rythme cardiaque moyen enregistré au cours de la séance d’entrainement ;
- **Durée** : la durée de la séance d’entrainement ;
- **Distance** : la distance couverte pendant la séance d’entrainement (mesurée en kilomètres, mètres ou en
miles) ;
- **Lieu** : le lieu de la séance d’entrainement ;
- **Commentaires** : remarques générales sur la séance d’entrainement.

Ma réponse : 
```dtd
<!ELEMENT seance (date, type, rythme_cardiaque, duree,distance, lieu, commentaires)/>
<!ELEMENT date (#PCDATA)>
<!ELEMENT type EMPTY>
<!ATTLIST type value (course | nage | vélo) #REQUIRED>
<!ELEMENT rythme_cardiaque  (#PCDATA)>
<!ELEMENT duree (#PCDATA)>
<!ELEMENT distance EMPTY>
<!ATTLIST distance 
value CDATA
unite (kilometre, metre,miles) "miles"
 >
<!ELEMENT lieu (#PCDATA)>
<!ELEMENT commentaires (#PCDATA)>
```
> Ma réponse est correcte mais il manque l'élément racine
> de même que les autres solutions proposer par les étudiants

Réponse étudiant 1 :
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT Seance (Date(Jour,Heure),Type, Rythme, Durée, Distance, Lieu,Commentaires)>
<!ELEMENT Date #REQUIRED>
<!ELEMENT Jour #PCDATA>
<!ELEMENT Heure #PCDATA>
<!ELEMENT Type (#PCDATA)>
<!ATTLIST Type sport (Course|Nage|Velo)*>
<!ELEMENT Rythme EMPTY>
<!ELEMENT Durée EMPTY>
<!ELEMENT Distance (#PCDATA)>
<!ATTLIST Distance unites (kilometers | metres| miles)>
<!ELEMENT Lieu (#PCDATA)>
<!ELEMENT Commentaires (#PCDATA)>
```
>==> Pb : (Date(Jour,Heure)... est faux syntaxiquement


Réponse étudiant 2 :
```dtd
<?xml version="1.0" encoding="ISO-8859-1"?>
<!ELEMENT entrainement (date_entrainement, type_entrainement, rythme_cardiaque,
duree_entrainement, distance_entrainement, lieu, commentaires*)>
<!ELEMENT date_entrainement (#PCDATA)>
<!ELEMENT type_entrainement (#PCDATA)>
<!ELEMENT rythme_cardiaque (#PCDATA)>
<!ELEMENT duree_entrainement (#PCDATA)>
<!ELEMENT distance_entrainement (#PCDATA)>
<!ELEMENT lieu (#PCDATA)>
<!ELEMENT commentaires (#PCDATA)>
<!ATTLIST date_entrainement
date CDATA #REQUIRED
heure CDATA #REQUIRED
>
<!ATTLIST type_entrainement seance CDATA>
<!ATTLIST distance_entrainement unites (kilometers | metres | miles) "miles">

```
>==>Pb dans la modélisation de la date : 
> `<date_entrainement date =".." heure="">blablablabla....<date_entrainement>`, le contenu String (#PCDATA) est en trop !

### Correction
Il n’existe pas en réalité de réponse unique. Une solution possible est de considérer comme attributs :
Date, Type et Rythme cardiaque et comme éléments enfants : Durée, Distance, Lieu et Commentaires.
- Syntaxe de déclaration d'élément : `<!ELEMENT nomElement Type>`
- Syntaxe de déclaration d'attribut : `<!ATTLIST nomElement nomAtt TypeAtt Defaut>`

DTD
```dtd
<!ELEMENT journalseance (seance)+>
<!ELEMENT seance (duree, distance, lieu, commentaires)>
<!ATTLIST seance
date CDATA #IMPLIED
type (course | natation | cyclisme) "course"
rythmcard CDATA #IMPLIED
>
<!ELEMENT duree (#PCDATA)>
<!ATTLIST duree
unites (secondes | minutes | heures) "minutes"
>
<!ELEMENT distance (#PCDATA)>
<!ATTLIST distance
unites (miles | kilometres | tours) "miles"
>
<!ELEMENT lieu (#PCDATA)>
<!ELEMENT commentaires (#PCDATA)>
```

XML
```xml
<?xml version="1.0"?>
<!DOCTYPE journalseance SYSTEM "etml.dtd">
<journalseance>
    <seance date="11/19/05" type="course" rythmcard="158">
        <duree unites="minutes">50</duree>
        <distance unites="miles">5.5</distance>
        <lieu>Warner Park</lieu>
        <commentaires>Milieu de matinee, un peu venteux.</commentaires>
    </seance>
    <seance date="11/21/05" type="cyclisme" rythmcard="153">
        <duree unites="heures">1.5</duree>
        <distance unites="miles">26.4</distance>
        <lieu>Natchez Trace Parkway</lieu>
        <commentaires>Parcours en colline. Je me sens fort comme un boeuf.</commentaires>
    </seance>
    <seance date="11/24/05" type="course" rythmcard="156">
        <duree unites="heures">2.5</duree>
        <distance unites="miles">16.8</distance>
        <lieu>Warner Park</lieu>
        <commentaires>Apres midi. Sensation de force honnete.</commentaires>
    </seance>
</journalseance>
```

## Exercice 2
Modifier le DTD de façon à inclure un nouvel attribut de l’élément séance qui stocke une **note** pour la
séance d’entrainement. Cette note indique comment vous vous êtes senti pendant la séance sur une
échelle de 0 à 10

Ma réponse : 
```dtd
<!ELEMENT seance (date, type, rythme_cardiaque, duree,distance, lieu, commentaires)>
<!ATTLIST seance note (0|1|2|3|4|5|62|7|8|9|10)"5">
<!ELEMENT date (#PCDATA)>
<!ELEMENT type EMPTY>
<!ATTLIST type value (course | nage | vélo) #REQUIRED>
<!ELEMENT rythme_cardiaque  (#PCDATA)>
<!ELEMENT duree (#PCDATA)>
<!ELEMENT distance EMPTY>
<!ATTLIST distance 
value CDATA
unite (kilometre, metre,miles) "miles"
 >
<!ELEMENT lieu (#PCDATA)>
<!ELEMENT commentaires (#PCDATA)>
```

Correction prof : 
```dtd
<!ELEMENT seance (duree, distance, lieu, commentaires)>
<!ATTLIST seance
date CDATA #IMPLIED
type (course | natation | cyclisme) "course"
rythmcard CDATA #IMPLIED
note (1|2|3|4|5|6|7|8|9|10) "5"
>
...
```

Voici un XML valide :
```dtd
<?xml version="1.0"?>
<!DOCTYPE journalseance SYSTEM "etml.dtd">
<journalseance>
    <seance date="11/19/05" type="course" rythmcard="158">
        <duree unites="minutes">50</duree>
        <distance unites="miles">5.5</distance>
        <lieu>Warner Park</lieu>
        <commentaires>Milieu de matinee, un peu venteux.</commentaires>
    </seance>
    <seance date="11/21/05" type="cyclisme" rythmcard="153" note = "5">
        <duree unites="heures">1.5</duree>
        <distance unites="miles">26.4</distance>
        <lieu>Natchez Trace Parkway</lieu>
        <commentaires>Parcours en colline. Je me sens fort comme un boeuf.</commentaires>
    </seance>
    <seance date="11/24/05" type="course" rythmcard="156" note = "10">
        <duree unites="heures">2.5</duree>
        <distance unites="miles">16.8</distance>
        <lieu>Warner Park</lieu>
        <commentaires>Apres midi. Sensation de force honnete.</commentaires>
    </seance>
</journalseance>
```