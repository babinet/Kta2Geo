# Kta2Géo

* *Environement : #/bin/bash!*
* *Requirement : gdal exiftool wget imagemagick*

###### Usage :

Start program > then choose menu

```
Folder/Kta2Geo/Start_Program.sh
```

#### GeoRefIGC :

* Georeference maps in EPSG:3857 from source maps in Lambert1 EPSG:27561 based on filename.

NTF (Paris) / Lambert Nord France  EPSG:27561 

#### kmz2csv :

* Convert KMZ to CSV & Geotag images

#### Feuilles2Planches :

* Convert name Old "feuille 281" to "25-50"

#### Geoserver_operations

* Create a Workspace on Geoserver
* Post Geotif files to geoserver and set-up layers.

#### Observatoire_*Long_*Lat-Converter

* Conversion Long/Lat from Paris meridian - unit : métre

### Name convention :

##### Maps pict format .jpg, .tif, and  .kmz  files. 

Original .jpeg or .tif files must be stored in :

###### I.G.C post 1968 E.g : 25-50

```
Folder/25-50_Whatever_1971.tif
```

```
Folder/[Absis]-[Ordoné]_Whatever_version-numéro_Whatever_l'année.l'extenssion
```

```
Folder/25-50_plan des carrièrres Denfert_V-1_Source_BHVP_1971.tif
```

Output :

```
Folder/_Output/25-50-V1-1971.tif
```

###### I.G.C pre 1968 E.g : Feuille 281

```
Folder/281_V1-1931.tif
```

```
Folder/_Output/281_V1-1931.tif
```

###### Département de la Seine

```
Folder/26Y_V1-1951.tif
```

output :

```
Folder/_Output/26Y_V1-1951.tif
```

###### De Fourcy 1858

```
Folder/P9_1957.tif
```

Otput :

```
Folder/_Output/P9_1957.tif
```

##### Kmz files

```
Folder/WhateverName.kmz
```

Ouput images & .csv

```
Folder/_Output/WhateverName(Folder)
```

#### Special case :

INSPECTION GÉNÉRALE DES CARRIÈRES DE LA SEINE

ATLAS DES CARRIÈRES SOUTERRAINES DU DÉPARTEMENT - 1962

TABLEAU DASSEMBLAGE

Echelle: 1 :50000.

```
"Folder/_Atlas_des_Carrière_du_département_1962.tif"
```