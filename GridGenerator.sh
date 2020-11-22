#!/bin/bash
# GridGenerator EPSG:27561
rm PLANCHES.csv
while read csvline
do
hauteur=$(echo 400)
largeur=$(echo 600)
# Origin
X="584400"
Y="145824"
# Abscissa / Ordinate
Abscissa=$(echo "$csvline"| awk '{print $2}')
Ordinate=$(echo "$csvline"| awk '{print $1}')
AbscissaMultiple=$(echo "$csvline"| awk '{print $1}')
OrdinateMultiple=$(echo "$csvline"| awk '{print $2}')
echo $Abscissa Abscissa
echo $Ordinate Ordinate
Positionx=$(echo "$X"+\($AbscissaMultiple*600\)|bc -l)
Positiony=$(echo "$Y"+\($OrdinateMultiple*-400\)|bc -l)
Centroidx=$(echo $Positionx+300|bc -l)
Centroidy=$(echo $Positiony+200|bc -l)
echo $Positiony
echo $Positionx
echo "$Positionx $Positiony" | awk -v largeur='$largeur' -v hauteur='$hauteur' -v largeur='$Positionx' -v Abscissa='$Abscissa' -v Ordinate='$Ordinate' -v Centroidx='$Centroidx' -v Centroidy='$Centroidy' '{print "\t\t"'$Ordinate'"\-"'$Abscissa',"\t" '$Centroidx'"\t"'$Centroidy', "\t""MULTILINESTRING (("'$Positionx','$Positiony'","'$Positionx'+'$largeur', '$Positiony'","'$Positionx'+'$largeur', '$Positiony'+'$hauteur'","'$Positionx', '$Positiony'+'$hauteur'","'$Positionx', '$Positiony'"))" }' >> PLANCHES.csv

echo $PosNW
done < ABSISORDO.csv
echo -e "OldNum\tPost1962\tNouvNum\tCentroidX\tCentroidY\tWKT" > temp
cat PLANCHES.csv >> temp && mv temp GRID_27561.csv
