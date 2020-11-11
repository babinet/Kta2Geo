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
Absis=$(echo $NameNoExt | awk -F'-' '{print $1}'| tr -d ' ' | sed 's/..\///g')
Ordoned=$(echo $NameNoExt | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}'| sed 's/..\///g')
AbsisMultiple=$(echo $Absis-26|bc -l)
OrdonedMultiple=$(echo $Ordoned-50| bc -l)

# Image Info
ExifInfo=$(exiftool "$TiffSource")
#echo $SerialPoster
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')




# Position from Origin 600000 126224
# NW
LongNW=$(echo 599400+$AbsisMultiple*600 |bc -l)
LatNW=$(echo 126224+$OrdonedMultiple*400 |bc -l )

echo ${purple}$LongNW
echo $LatNW
LeftUp=$(echo "$LongNW" "$LatNW" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
echo "${orange}LeftUp $LeftUp${reset}"
# SW
LongSW=$(echo 599400+$AbsisMultiple*600 |bc -l)
LatSW=$(echo 125824+$OrdonedMultiple*400 |bc -l )
LeftDown=$(echo "$LongSW" "$LatSW" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# NE
LongNE=$(echo 600000+$AbsisMultiple*600  |bc -l)
LatNE=$(echo 126224+$OrdonedMultiple*400 |bc -l )
RightUp=$(echo "$LongNE" "$LatNE" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# SE
LongSE=$(echo 600000+$AbsisMultiple*600 |bc -l)
LatSE=$(echo 125824+$OrdonedMultiple*400 |bc -l )
RightDown=$(echo "$LongSE" "$LatSE" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
RightDown4326=$(echo "$LongSE" "$LatSE" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
echo "Observatoire $Observatoire"

echo "RightDown=$(echo "$LongSE" "$LatSE" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
RightDown4326=$(echo "$LongSE" "$LatSE" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
"




echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -    ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -    ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -    ${orange}$Year"
echo "${white}---> \$Absis  -   -   -   -   -   -   -   -   -   -   -    ${orange}$Absis"
echo "${white}---> \$Ordoned    -   -   -   -   -   -   -   -   -   -    ${orange}$Ordoned"
echo "${white}---> \$AbsisMultiple  -   -   -   -   -   -   -   -   -    ${orange}$AbsisMultiple"
echo "${white}---> \$OrdonedMultiple    -   -   -   -   -   -   -   -    ${orange}$OrdonedMultiple"
echo "${white}---> \$LongNW Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LongNW"
echo "${white}---> \$LatNW  Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LatNW"
echo "--->${green} \$LeftUp EPSG:3857${white}   -   -   -   -   -   -   -   -    ${orange}$LeftUp"
echo "${white}---> \$LongSW Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LongSW"
echo "${white}---> \$LongSW  Lambert 1  -   -   -   -   -   -   -   -    ${orange}$LatSW"
echo "--->${green} \$LeftDown EPSG:3857${white} -   -   -   -   -   -   -   -    ${orange}$LeftDown"
echo "${white}---> \$LongNE Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LongNE"
echo "${white}---> \$LatNW  Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LatNE"
echo "--->${green} \$RightUp EPSG:3857${white}  -   -   -   -   -   -   -   -    ${orange}$RightUp"
echo "${white}---> \$LongSE Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LongSE"
echo "${white}---> \$LatSE  Lambert 1   -   -   -   -   -   -   -   -    ${orange}$LatSE"
echo "--->${green} \$RightDown EPSG:3857${white}    -   -   -   -   -   -   -    ${orange}$RightDown"
echo "--->${green} \$RightDown4326 EPSG:4326${white}    -   -   -   -   -   -    ${orange}$RightDown4326"

echo "--->${green} \$WidthImage -   -   -   -   -   -   -   -   -   -    ${orange}$WidthImage"
echo "--->${green} \$HeightImage    -   -   -   -   -   -   -   -   -    ${orange}$HeightImage"

echo -e "${white}---> Actions conditionnelles"

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
echo "${purple}OKOK"
gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 239613.067310811 6252614.19328096 -gcp 0 "$HeightImage" 239614.555397205 6252005.46916398 -gcp "$WidthImage" 0 240523.53161475 6252616.38252428 -gcp "$WidthImage" "$HeightImage" 240524.953821361 6252007.65809093 "$TiffSource" temp.tif
if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi

gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeigthImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$tifile" "../Output/"$NameOut"_"$Year".tif"

elif [ "$NameNoExt" == 25-41 ]
then
echo "${red}$NameOut NameOut ${green}$HeigthImage HeigthImage${reset}"
else
echo $red hello
echo "${red}$NameOut NameOut ${green}$HeigthImage HeigthImage${reset}"

#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$LongNW" "$LatNW" -gcp 0 "$HeightImage" "$LongSW" "$LatSW" -gcp "$WidthImage" 0 "$LongNE" "$LatNE" -gcp "$WidthImage" "$HeightImage" "$LongSE" "$LatSE" "$TiffSource" temp.tif

gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$LeftUp" -gcp 0 "$HeightImage" "$LeftDown" -gcp "$WidthImage" 0 "$RightUp" -gcp "$WidthImage" "$HeightImage" "$RightDown" "$TiffSource" "../Output/"$NameNoExt"_"$Year".tif"

if [ -f "../Output/"$NameNoExt"_"$Year".tif" ]
then
rm "../Output/"$NameNoExt"_"$Year".tif"
fi

gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha temp.tif "../Output/"$NameNoExt"_"$Year".tif"
rm temp.tif
#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$LeftUp" -gcp 0 "$HeightImage" "$LeftDown" -gcp "$WidthImage" 0 "$RightUp" -gcp "$WidthImage" "$HeightImage" "$RightDown" "$TiffSource" ../Output/"$NameNoExt"_"$Year".tif

echo $green hello
echo "${red}gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 ${green}"$LeftUp" -gcp 0 "$HeightImage" "$LeftDown" -gcp "$WidthImage" 0 "$RightUp" -gcp "$WidthImage" "$HeightImage" "$RightDown" "$TiffSource" "../Output/"$NameNoExt"_"$Year".tif"
"

echo hello there
echo -e "${white}---> Fin des actions conditionnelles"

fi









done
#gdaltransform -s_srs EPSG:27571 -t_srs EPSG:3857 <test.txt> transformed.txt


