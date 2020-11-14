# Kta2Géo

* *Environement : #/bin/bash!*
* *Requirement : gdal exiftool wget imagemagick*

###### Usage :

Start program > then choose menu

```
Folder/Kta2Geo/Start_Program.sh
```

#### GeoRefIGC :

Georeference in EPSG:3857 from source Lambert1 EPSG:27561 maps based on filename.

#### kmz2csv :

Convert KMZ to CSV & Geotag images

#### Feuilles2Planches :

Convert name Old "feuille 281" to "25-50"

#### Geoserver_operations

1. Create a Workspace on Geoserver
2. Post Geotif files to geoserver and set-up layers.

\---> ################################### <---

## Name convention:

Original .tif files must be stored  in  :

```
Folder/25-50_Whatever_1971.tif
```

Or

```
Folder/25-50_plan des carrièrres Denfert_V-1_Source_BHVP_1971.tif
```

```
Folder/[Absis]-[Ordoné]_Whatever_version-numéro_Whatever_l'année.l'extenssion
```

Kmz files

```
Folder/WhateverName.kmz
```

Maps pict format .tif files

```
Folder/25-50_plan des carrièrres Denfert_V-1_Source_BHVP_1971.tif
```

Output :

```
Folder/Output/25-50-V1-11971.tif
```

```
Folder/Output/Processed_KMZ_folder/csv
```

```
Folder/Output/25-50-V1-11971.tif
```