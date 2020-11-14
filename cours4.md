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