## Exercice 1
**Utilisation d’une DTD**
Créez la DTD carnet.dtd suivante :
```dtd
<!ELEMENT carnet (personne+)>
<!ELEMENT personne EMPTY>
<!ATTLIST personne
nom CDATA #REQUIRED
prenom CDATA #IMPLIED
telephone CDATA #REQUIRED>

```
Créez un document XML qui soit valide par rapport à cette DTD.

## Exercice 2
Création d’une DTD
Créez une DTD livre.dtd à partir du document livre2.xml créé dans le chapitre précédent.

## Exercice 3
Utilisation des entités paramétriques
Modifiez la DTD créée dans l’exercice 2 pour faire en sorte que la définition de l’attribut titre
soit unique à l’aide d’une entité paramétrique.