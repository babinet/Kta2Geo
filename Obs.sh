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
AbsisMultiple=$(echo $Absis-50|bc -l)
OrdonedMultiple=$(echo $Ordoned-25| bc -l)
# Image Info
ExifInfo=$(exiftool "$TiffSource")
#echo $SerialPoster
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')




# Position Origin 600000 126224 Zéro de l'observatoire de Paris

Nord=$(echo 126224+\($AbsisMultiple*$Hauteur\) |bc -l)
Sud=$(echo 125824+\($AbsisMultiple*$Hauteur\) |bc -l )
Est=$(echo 600000+\($OrdonedMultiple*$Largeur\) |bc -l )
Ouest=$(echo 599400+\($OrdonedMultiple*$Largeur\) |bc -l )
${red}
echo 126224+\($AbsisMultiple*$Hauteur\) |bc -l
echo "${white}

Nord=\$(echo 126224+\($AbsisMultiple*$Hauteur\) |bc -l)
Sud=\$(echo 125824+\($AbsisMultiple*$Hauteur\) |bc -l )
Est=\$(echo 600000+\($OrdonedMultiple*$Largeur\) |bc -l )
Ouest=\$(echo 599400+\($OrdonedMultiple*$Largeur\) |bc -l )

"
echo $Absis Absis
echo $Ordoned Ordoned
echo $OrdonedMultiple OrdonedMultiple
echo $AbsisMultiple AbsisMultiple
echo $Nord Nord
echo $Sud Sud
echo $Est Est
echo $Ouest Ouest

#Nord=$(echo 600000+$AbsisMultiple*$Hauteur |bc -l)
#Sud=$(echo 599400+$AbsisMultiple*$Hauteur |bc -l )
#Est=$(echo 126224+$OrdonedMultiple*$Largeur |bc -l )
#Ouest=$(echo 125824+$OrdonedMultiple*$Largeur |bc -l )



# NW
NordOuest4326=$(echo "$Ouest $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
# SW
SudOuest4326=$(echo "$Ouest $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
# NE
NordEst4326=$(echo "$Est $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
# SE
SudEst4326=$(echo "$Est $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')

echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "${white}---> \$Absis  -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Absis"
echo "${white}---> \$Ordoned    -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordoned"
echo "${white}---> \$AbsisMultiple  -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$AbsisMultiple"
echo "${white}---> \$OrdonedMultiple    -   -   -   -   -   -   -   -   -   -   -   ${orange}$OrdonedMultiple"
echo "
${white}############################### Planche ${green}$Absis"-"$Ordoned $Version $Year ${white}###############################
"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561                        ${white}<---"
                                  
echo "                                                                     Nord Lambert 1"
echo "${white}---> \$Nord   Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Nord"
echo "                                                                     ${white}Sud Lambert 1"
echo "${white}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Sud"
echo "                                                                     ${white}Est Lambert 1"
echo "${white}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Est"
echo "                                                                     ${white}Ouest Lambert 1"
echo "${white}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Ouest"

echo "${white}---> WGS 84 / Pseudo-Mercator      EPSG:${green}4326 ${white}Corners                 ${white}<---"

echo "${white}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordOuest4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
echo "${white}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordEst4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"

echo "${white}--->${green} \$WidthImage${white} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage"
echo "${white}--->${green} \$HeightImage${white}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage"

echo -e "${white}---> Cas Particuliers e.g: planche 4-41"

if [ "$NameNoExt" == 4-41 ]||[ "$NameNoExt" == 04-41 ]
then
echo "${orange}---> Fixed transformation${reset}"

#        gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857
#        NordOuest=

#        586500 129824
#        239613.067310811 6252614.19328096 0

#        SudOuest=

#        586500 129424
#        239614.555397205 6252005.46916398 0

#        NordEst=

#        587100 129824
#        240523.53161475 6252616.38252428 0

#        SudEst=

#        587100 129424
#        240524.953821361 6252007.65809093 0
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 586500 129824 -gcp 0 "$HeightImage" 586500 129424 -gcp "$WidthImage" 0 587100 129824 -gcp "$WidthImage" "$HeightImage" 587100 129424 "$TiffSource" temp.tif
if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -t_srs "EPSG:27561" -dstalpha -te_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif
#mv temp.tif ../temp$NameNoExt.tif
elif [ "$NameNoExt" == 25-41 ]
then
echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
else
echo $red hello
echo "${red}$NameOut NameOut ${green}$HeigthImage HeigthImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
echo "${purple}gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

${green}gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 599400 126224 -gcp 0 4808 599400 125824 -gcp 7200 0 600000 126224 -gcp 7200 4808 600000 125824 ~/WORKSHOP/25-50-2003.tif ~/WORKSHOP/Out.tif

#gdalwarp -co COMPRESS=NONE -dstalpha -t_srs "EPSG:27561" -te_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"

${white}"

if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi

gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif
#mv temp.tif ../temp$NameNoExt.tif


echo -e "${white}---> Fin des actions conditionnelles"

fi









done
#gdaltransform -s_srs EPSG:27571 -t_srs EPSG:3857 <test.txt> transformed.txt


