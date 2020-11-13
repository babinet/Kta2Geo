#!/bin/bash
orange=`tput setaf 11`
bg_orange=`tput setab 178`
purple=`tput setaf 13`
Line=`tput smul`
bold=`tput bold`
black=`tput setaf 0`
red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 15`
reset=`tput sgr0`
bg_red=`tput setab 1`
bg_green=`tput setab 2`
bg_white=`tput setab 7`
bg_blue=`tput setab 4`
lightblue=`tput setaf 45`
lightgreen=`tput setaf 46`
bleuetern=`tput setaf 45`
ilghtpurple=`tput setaf 33`
lightred=`tput setaf 161`
darkblue=`tput setaf 19`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd $dir

mkdir -p tmp ../Output
for basekmz in ../*.kmz
do
fileout=$(echo "$basekmz" | sed 's/.kmz//g' | sed 's/..\///g')
mkdir ../Output/"$fileout"
python unzip_utf8 "$basekmz" ../Output/"$fileout"
echo fileout $fileout

if [ -f ../Output/"$fileout"/CSV2DRUPALtmp.csv ]
then
rm ../Output/"$fileout"/CSV2DRUPALtmp.csv
fi

for filekml in ../Output/"$fileout"/*.kml
do
cat ../Output/"$fileout"/*.kml | tr -d '\n' | sed -e 's/<Placemark>/\
<Placemark>/g' >  ../Output/"$fileout"/KML_tmp


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
#Long=$(cat "tmp/Coordinates" | awk -F'\|' '{print $2, $1}')
Coords=$(cat "tmp/Coordinates" | awk -F'\|' '{print $0}')

#echo $Coords

while read -r Imageslist
do
echo $Imageslist Imageslist
Lat=$(echo "$Coords" | awk -F'|' '{print $1}')
Long=$(echo "$Coords" | awk -F'|' '{print $2}')
echo "${white}---> Geotaging output image file "$Imageslist""
echo "${bg_red}${white}---> -GPSLongitudeRef=E Property is set to East of Geenwich ${reset}"
echo "${reset}${white}---> To chage -GPSLongitudeRef to West edit the file kmz2csv.sh & change -GPSLongitudeRef=E to -GPSLongitudeRef=W ${reset}"
ImgFolder=$( echo "$line" | awk -F'<img src=\"' '{print $2}' | awk -F'\/' '{print $1"\/"}' )
exiftool -imagedescription="$nme" -GPSLongitudeRef=E -GPSLongitude="$Long" -GPSLatitudeRef=N -GPSLatitude="$Lat" "../Output/$fileout"/"$ImgFolder$Imageslist"

#echo "exiftool -GPSLongitudeRef=E -GPSLongitude=$Lat -GPSLatitudeRef=N -GPSLatitude=$Long ../Output/"$fileout"/"$ImgFolder$Imageslist"
#      exiftool -GPSLongitudeRef=E -GPSLongitude=2.32803117647848 -GPSLatitudeRef=N -GPSLatitude=48.83583666893819
#"
#echo "$ImgFolder/$Imageslist"
#echo $red$Long
#echo $purple$Lat
#echo "$Imageslist"
done < tmp/imgs
echo "$nme|$imgs|$Coordinates|$TimeStamp|$WKT" | awk '!/Point\(,\)/' >> ../Output/"$fileout"/CSV2DRUPALtmp.csv
echo "${red}ImgFolder "$ImgFolder""

done < ../Output/"$fileout"/KML_tmp
rm ../Output/"$fileout"/"$ImgFolder$Imageslist"/*.jpg_original

done
echo "nme|imgs|Lat|Long|TimeStamp|WKT" > ../Output/"$fileout"/CSV2DRUPAL.csv
cat  ../Output/"$fileout"/CSV2DRUPALtmp.csv >> ../Output/"$fileout"/CSV2DRUPAL.csv
rm ../Output/"$fileout"/CSV2DRUPALtmp.csv

done

cd -
