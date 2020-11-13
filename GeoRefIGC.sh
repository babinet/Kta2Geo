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
mkdir -p ../Output

# Zero de l'Observatoire 3857
Observatoire=$(echo "260098.642816645 6247162.50356738")
echo "${white}---> Position Origin (meters) 600000 126224 (Zéro de l'observatoire de Paris)"
ObservatoireLong=600000
ObservatoireLat=126224
# Metres
Hauteur=400
Largeur=600

for TiffSource in ../*.tif
do

# Definitions
NameNoExt=$(echo "$TiffSource" | sed 's/.tif//g' | sed 's/..\///g')
Year=$( echo "$TiffSource" | tail -c -9 | awk -F'.tif' '{print $1}')
NameNoExt=$( echo "$TiffSource" | awk -F'.tif' '{print $1}' | awk -F'\_' '{print $1}' | sed 's/..\///g')
Ordoned=$(echo $NameNoExt | awk -F'-' '{print $1}'| tr -d ' ' | sed 's/..\///g')
Absis=$(echo $NameNoExt | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}'| sed 's/..\///g')
AbsisMultiple=$(echo "$Absis"-50 |bc -l)
OrdonedMultiple=$(echo "$Ordoned"-25 | bc -l)
# Image Info
ExifInfo=$(exiftool "$TiffSource")
#echo $SerialPoster
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

# Position Origin (Mètres) 600000 126224 Zéro de l'observatoire de Paris

Nord=$(echo 126224-$Hauteur*$AbsisMultiple |bc -l)
Sud=$(echo 125824-$Hauteur*$AbsisMultiple|bc -l )
Est=$(echo 600000+\($OrdonedMultiple*$Largeur\) |bc -l )
Ouest=$(echo 599400+\($OrdonedMultiple*$Largeur\) |bc -l )

# NW
NordOuest4326=$(echo "$Ouest $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
NordOuest3857=$(echo "$Ouest $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# SW
SudOuest4326=$(echo "$Ouest $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
SudOuest3857=$(echo "$Ouest $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# NE
NordEst4326=$(echo "$Est $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
NordEst3857=$(echo "$Est $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# SE
SudEst4326=$(echo "$Est $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
SudEst3857=$(echo "$Est $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')


echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "${white}---> \$Absis  -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Absis"
echo "${white}---> \$Ordoned    -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordoned"
echo "${white}---> \$AbsisMultiple  -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$AbsisMultiple"
echo "${white}---> \$OrdonedMultiple    -   -   -   -   -   -   -   -   -   -   -   ${orange}$OrdonedMultiple"
echo "
${white}############################### Planche ${green}$Ordoned"-"$Absis $Version $Year ${white}###############################
"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561                           ${white}<---"
                                  
echo "                                                                     Nord Lambert 1"
echo "${white}---> \$Nord   Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Nord"
echo "                                                                     ${white}Sud Lambert 1"
echo "${white}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Sud"
echo "                                                                     ${white}Est Lambert 1"
echo "${white}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Est"
echo "                                                                     ${white}Ouest Lambert 1"
echo "${white}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Ouest"

echo "
${white}---> WGS 84 (World Geodetic System 1984)EPSG:${green}4326 ${white}Corners  unit ${green}degres  ${white}<---
"

echo "${white}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordOuest4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
echo "${white}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordEst4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"

echo "
${white}---> WGS 84 / Pseudo-Mercator      EPSG:${green}3857 ${white}Corners unit ${green}meters        ${white}<---
"
echo "${white}---> \$NordOuest3857  -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordOuest3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"
echo "${white}---> \$NordEst3857    -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordEst3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"

echo "${white}---> \$WidthImage${white} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage"
echo "${white}---> \$HeightImage${white}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage"

echo -e "${white}---> Cas Particuliers e.g: planche 4-41"
if [ "$NameNoExt" == 4-41 ]||[ "$NameNoExt" == 04-41 ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 586500 129824 -gcp 0 "$HeightImage" 586500 129424 -gcp "$WidthImage" 0 587100 129824 -gcp "$WidthImage" "$HeightImage" 587100 129424 "$TiffSource" temp.tif
if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

# Planche 07-58
elif [ "$NameNoExt" == 07-58 ]
then
echo "${purple}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
WidthImage=7734
HeightImage=5284
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 588550 123024 -gcp 0 "$HeightImage" 588550 122574 -gcp "$WidthImage" 0 589200 123024 -gcp "$WidthImage" "$HeightImage" 589200 122574 "$TiffSource" temp.tif

if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"

elif [ "$NameNoExt" == "8-9-51-52" ]
then
echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589500 125624 -gcp 0 "$HeightImage" 589500 125224 -gcp "$WidthImage" 0 590100 125624 -gcp "$WidthImage" "$HeightImage" 590100 125224 "$TiffSource" temp.tif
if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"

elif [ "$NameNoExt" == "08-44" ]
then
echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589200 128624 -gcp 0 "$HeightImage" 589200 128124 -gcp "$WidthImage" 0 589800 128624 -gcp "$WidthImage" "$HeightImage" 589800 128124 "$TiffSource" temp.tif
if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"






else

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif
#mv temp.tif ../temp$NameNoExt.tif
echo -e "${white}---> Fin des actions conditionnelles"

fi

done


#tesseract -l fra 25-50-2003.tif  Out.txt
# tesseract -l fra --dpi 300 25-50-2003.tif  Out.txt

#convert /Users/zeus/Desktop/Gallica_2020/CARTO_CLEAN/Atlas\ des\ carrières\ souterraines\ de\ Paris\ -\ feuille\ 309\ \(1931\).png  -colorspace Gray NB.tif
# tesseract -l fra --dpi 300 NB.tif   Out.txt
#tesseract -l fra --dpi 72 NB.tif   Out.txt

