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
cd "$dir"
echo "${bg_red}${white}---> -GPSLongitudeRef=E Property is set to East of Geenwich ${reset}"
echo "${reset}${white}---> To chage -GPSLongitudeRef to West edit the file kmz2csv.sh & change -GPSLongitudeRef=E to -GPSLongitudeRef=W ${reset}"

mkdir -p tmp ../_Output
for basekmz in ../*.kmz
do
fileout=$(echo "$basekmz" | sed 's/.kmz//g' | sed 's/..\///g')
mkdir ../_Output/
unar "$basekmz"
echo mv "$fileout" ../_Output/

mv "$fileout" ../_Output/
if [ -f ../_Output/"$fileout"/CSV2DRUPALtmp.csv ]
then
rm ../_Output/"$fileout"/CSV2DRUPALtmp.csv
fi

for filekml in ../_Output/"$fileout"/*.kml
do
cat ../_Output/"$fileout"/*.kml | tr -d '\n' | sed -e 's/<Placemark>/\
<Placemark>/g' >  ../_Output/"$fileout"/KML_tmp

while read -r line; do
# Name
echo "$line" | awk -F'<name>' '{print $2}' | awk -F'</name>' '{print $1}' > tmp/Name
# Coordinates
echo "$line" | awk -F'<coordinates>' '{print $2}' | awk -F'</coordinates>' '{print $1}' | tr -d ' ' | awk -F',' '{print $2"\|"$1}' > tmp/Coordinates
# WKT 27561
echo "$line" | awk -F'<coordinates>' '{print $2}' | awk -F'</coordinates>' '{print $1}' | tr -d ' ' | awk -F',' '{print "Point\("$1" "$2"\)"}' > tmp/WKT


# TimeStamp
echo "$line" | awk -F'<TimeStamp>' '{print $2}' | awk -F'</TimeStamp>' '{print $1}' | awk -F'<when>' '{print $2}' | awk -F'</when>' '{print $1}' | awk -F'+' '{print $1}' | sed 's/T/ /g' > tmp/TimeStamp
# image(s)
echo "$line" | tr -d '[]' | awk -F'<\!CDATA' '{print $2}' | sed 's/" \/><br \/>//g' | sed 's/<img src=\"images\///g'  | sed -e 's/.jpg/.jpg\
/g' | awk !'/><\/SimpleData>/' | sed 's/<img src=\"files\///g' > tmp/imgs

filejpeg=$(cat tmp/imgs)
nbrlignes=$(echo "$filejpeg" | wc -l  | tr -d ' ' | tr -d '\n')
if [ $nbrlignes -eq 1 ]
then
echo "---> 1 image file"
else
cat tmp/imgs | tr '\n' '@' | sed 's/\@$//'  > tmp/imgs1
mv tmp/imgs1 tmp/imgs

echo "---> Several image files"
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
#echo "${purple}$Imageslist" Imageslist
Lat=$(echo "$Coords" | awk -F'|' '{print $1}')
Long=$(echo "$Coords" | awk -F'|' '{print $2}')

ImgFolder=$( echo "$line" | awk -F'<img src=\"' '{print $2}' | awk -F'\/' '{print $1"\/"}' )
Postion27561=$(echo "$Long $Lat" | gdaltransform -s_srs EPSG:4326 -t_srs EPSG:27561)
Lat27561=$(echo "$Postion27561" | awk '{print $2}'| xargs printf "%.2f")
Long27561=$(echo "$Postion27561" | awk '{print $1}'| xargs printf "%.2f")

# WKT 3858
Postion3857=$(echo "$Long $Lat" | gdaltransform -s_srs EPSG:4326 -t_srs EPSG:3857)
Lat3857=$(echo "$Postion3857" | awk '{print $2}'| xargs printf "%.2f")
Long3857=$(echo "$Postion3857" | awk '{print $1}'| xargs printf "%.2f")
WKT3857=$(echo "Point($Long3857 $Lat3857)")
#echo $WKT3857



#echo "$line" | awk -F'<coordinates>' '{print $2}' | awk -F'</coordinates>' '{print $1}' | tr -d ' ' | awk -F',' '{print "Point\("$1" "$2"\)"}' > tmp/WKT3857


echo -e "${white}---> EPSG:${green}27561            ${white}Long : ${orange}$Long27561 ${white}             Lat : ${orange}$Lat27561"
#echo $Postion27561 Postion27561
#echo $Lat27561 Lat27561
#echo $Long27561 Long27561
#echo $Long27561
echo -e "${white}---> EPSG:${green}4326             ${white}Long : ${orange}$Long ${white}      Lat : ${orange}$Lat"
echo "$Imageslist" | tr '@' '\n' > tmp/imgList.txt
#FS=\n
while read ImageTextLine
do
#echo "$green ImageTextLine $ImageTextLine"
echo "${white}####################################################################################################
---> Geotaging output image file ${orange}"$ImgFolder$ImageTextLine"${white} Name : ${orange}$nme${white}

####################################################################################################"

exiftool -imagedescription="$nme|$Long27561, $Lat27561|$WKT3857" -GPSLongitudeRef=E -GPSLongitude="$Long" -GPSLatitudeRef=N -GPSLatitude="$Lat" "../_Output/$fileout"/"$ImgFolder$ImageTextLine"
done < tmp/imgList.txt

#echo "$Imageslist" | tr '@' '\n'
#echo "exiftool -GPSLongitudeRef=E -GPSLongitude=$Lat -GPSLatitudeRef=N -GPSLatitude=$Long ../_Output/"$fileout"/"$ImgFolder$Imageslist"
#      exiftool -GPSLongitudeRef=E -GPSLongitude=2.32803117647848 -GPSLatitudeRef=N -GPSLatitude=48.83583666893819
#"
#echo "$ImgFolder/$Imageslist"
#echo $red$Long
#echo $purple$Lat
#echo "$Imageslist"
done < tmp/imgs
echo "$nme|$Long27561, $Lat27561|$imgs|$Coordinates|$TimeStamp|$WKT|$WKT3857" | awk '!/Point\(\ \)/' >> ../_Output/"$fileout"/CSV2DRUPALtmp.csv
#echo "${red}ImgFolder "$ImgFolder""
rm ../_Output/"$fileout"/"$ImgFolder"/*.jpg_original 2>&1 &>/dev/null

done < ../_Output/"$fileout"/KML_tmp


done
echo "nme|Long, Lat EPSG:27561|imgs|Lat|Long|TimeStamp|WKT 27561|WTK 3857" > ../_Output/"$fileout"/CSV2DRUPAL.csv
cat  ../_Output/"$fileout"/CSV2DRUPALtmp.csv >> ../_Output/"$fileout"/CSV2DRUPAL.csv
rm ../_Output/"$fileout"/CSV2DRUPALtmp.csv

done

cd - 2>&1 &>/dev/null
