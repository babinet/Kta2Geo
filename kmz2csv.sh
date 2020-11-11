#!/bin/bash

dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir

mkdir -p tmp output
for basekmz in ../*.kmz
do
fileout=$(echo "$basekmz" | sed 's/.kmz//g')
mkdir "$fileout"
python unzip_utf8 "$basekmz" "$fileout"/


if [ -f "$fileout"/CSV2DRUPALtmp.csv ]
then
rm "$fileout"/CSV2DRUPALtmp.csv
fi

for filekml in "$fileout"/*.kml
do
cat "$fileout"/*.kml | tr -d '\n' | sed -e 's/<Placemark>/\
<Placemark>/g' > "$fileout"/KML_tmp


while read -r line; do
# Name
echo "$line" | awk -F'<name>' '{print $2}' | awk -F'</name>' '{print $1}' > tmp/Name
# Coordinates
echo "$line" | awk -F'<coordinates>' '{print $2}' | awk -F'</coordinates>' '{print $1}' | tr -d ' ' | awk -F',' '{print $2"\|"$1}' > tmp/Coordinates
# WKT
echo "$line" | awk -F'<coordinates>' '{print $2}' | awk -F'</coordinates>' '{print $1}' | tr -d ' ' | awk -F',' '{print "Point\("$1","$2"\)"}' > tmp/WKT
# TimeStamp
echo "$line" | awk -F'<TimeStamp>' '{print $2}' | awk -F'</TimeStamp>' '{print $1}' | awk -F'<when>' '{print $2}' | awk -F'</when>' '{print $1}' | awk -F'+' '{print $1}' | sed 's/T/ /g' > tmp/TimeStamp
# image(s)
echo "$line" |tr -d '[]' | awk -F'<\!CDATA' '{print $2}' | sed 's/" \/><br \/>//g' | sed 's/<img src=\"images\///g'  | sed -e 's/.jpg/.jpg\
/g' | awk !'/><\/SimpleData>/' | sed 's/<img src=\"files\///g' > tmp/imgs

filejpeg=$(cat tmp/imgs)
nbrlignes=$(echo "$filejpeg" | wc -l  | tr -d ' ' | tr -d '\n')
if [ $nbrlignes -eq 1 ]
then
echo "Il n'y a qu'une seule image"
else
cat tmp/imgs | tr '\n' '@' | sed 's/\@$//'  > tmp/imgs1
mv tmp/imgs1 tmp/imgs

echo "Il y a plusieurs images"
fi
nme=$(cat tmp/Name)
imgs=$(cat tmp/imgs)
Coordinates=$(cat tmp/Coordinates)
TimeStamp=$(cat tmp/TimeStamp)
WKT=$(cat tmp/WKT)

echo "$nme|$imgs|$Coordinates|$TimeStamp|$WKT" | awk '!/Point\(,\)/' >> "$fileout"/CSV2DRUPALtmp.csv

done < "$fileout"/KML_tmp


done
echo "nme|imgs|Lat|Long|TimeStamp|WKT" > "$fileout"/CSV2DRUPAL.csv
cat "$fileout"/CSV2DRUPALtmp.csv >> "$fileout"/CSV2DRUPAL.csv
rm "$fileout"/CSV2DRUPALtmp.csv

done

cd -
