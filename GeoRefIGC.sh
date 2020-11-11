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

#
#for OriginalPng in *.png
#do
#
##echo $OriginalPng
#NameSeul=$(echo "$OriginalPng" | sed 's/.png//g')
##echo "$NameSeul"
#Year=$( echo "$OriginalPng" | awk -F'\(' '{print $2}' | awk -F'\)' '{print $1}' )
##echo $Year
#NameOut=$( echo "$OriginalPng" | awk -F'feuille\ ' '{print $2}' | awk -F'\ ' '{print $1}' )
#
#echo "$NameOut"
#if [ "$NameOut" == "281" ];then NameTiff="25-50_"$Year"";fi
#if [ "$NameOut" == "282" ];then echo "${red}26-50_"$Year"${reset}";fi
#if [ "$NameOut" == "161" ];then NameTiff="25-50"$Year"";fi
#
#
#done






# Gdal
# gdal_translate -of GTiff -gcp 0 0 -6.848326  45.501053 -gcp 6862 0 -6.490975 45.501503 -gcp 0 1379 -6.762872 45.377363 -gcp 6862 1379 -6.545354 45.382523 18-41_1957_V1_1957.tif out.tif
# gdalwarp -r near -order 1 -co COMPRESS=NONE -dstalpha out.tif out2.tif
# gdal_translate -a_srs EPSG:32182 -of GTiff -gcp 0 0 -6.848326  45.501053 -gcp 6862 0 -6.490975 45.501503 -gcp 0 1379 -6.762872 45.377363 -gcp 6862 1379 -6.545354 45.382523 18-41_1957_V1_1957.tif out.tif
# gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha out2.tif out3.tif



for tifile in ../*.tif
do
NameSeul=$(echo "$tifile" | sed 's/.tif//g'| sed 's/..\///g')
echo "$NameSeul"
Year=$( echo "$tifile" | tail -c -9 | awk -F'.tif' '{print $1}' )
echo $Year
NameOut=$( echo "$tifile" | awk -F'.tif' '{print $1}' | awk -F'\_' '{print $1}' | sed 's/..\///g')
echo "${white}$NameOut${reset}"





# Definitions
echo "tifile $tifile"
SerialPoster=$(exiftool "$tifile")
#echo $SerialPoster
WidthImage=$(echo $SerialPoster | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $SerialPoster | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

echo -e "${white}---> The width of the map\t ${orange}\$WidthImage${white} is\t\t:\t\t\t\t\t${orange}"$WidthImage"px"
echo -e "${white}---> The height of the map\t ${orange}\$HeightImage${white} is\t:\t\t\t\t\t${orange}"$HeightImage"px"

SaisonpositionX=$( echo $WidthImage/13 | bc -l | awk -F'.' '{print $1}')
EpisodepositionX=$( echo $WidthImage/13 | bc -l | awk -F'.' '{print $1}')
AllY=$(echo $HeightImage-$HeightImage/5 | bc -l  | awk -F'.' '{print $1}')
FontSise=$(echo $HeightImage/7 | bc -l | awk -F'.' '{print $1}')
StrokeWidth=$(echo $WidthImage/170 | bc -l | awk -F'.' '{print $1}')


#    xHautGaucheOrigine = 585000
#    yHautGaucheOrigine = 1145824
#
#    hauteurPlanche = 400
#    largeurPlanche = 600
#
#    epsg3857 = "3857"
#    epsg27571 = "27571"

# OK
#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 259188.766 6247162.445 -gcp 0 "$HeightImage" 259188.766 6246554.170 -gcp "$WidthImage" 0 260098.649 6247162.445 -gcp "$WidthImage" "$HeightImage" 260098.649 6246554.170 "$tifile" "Out_"$tifile""
#gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha "Out_"$tifile"" "Out_ALpha_"$tifile""


echo 260098.649-259188.766 | bc -l
echo 909.883+259188.766 | bc -l


Largeur=909.883
Hauteur=608.275

#

echo $NameSeul
echo $Year
echo $NameOut
Absis=$(echo $NameOut | awk -F'-' '{print $1}'| tr -d ' ')
Ordone=$(echo $NameOut | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}')
echo "absis $Absis"
echo "Ordone $Ordone"


AbsisMultiple=$(expr $Absis - 25)
OrdoneMultiple=$(expr $Ordone - 50)

echo "AbsisMultiple $AbsisMultiple"
echo "OrdoneMultiple $OrdoneMultiple"

Nord=$(echo $OrdoneMultiple*"-$Hauteur"+6247162.445 | bc -l  )
Sud=$(echo $OrdoneMultiple*"-$Hauteur"+6247162.445-$Hauteur | bc -l  )
Est=$(echo $AbsisMultiple*$Largeur+259188.766+$Largeur | bc -l  )
Ouest=$(echo $AbsisMultiple*$Largeur+259188.766 | bc -l  )
echo "Nord $Nord"
echo "Sud $Sud"
echo "Est $Est"
echo "Ouest $Ouest"



#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 259188.766 6247162.445 -gcp 0 "$HeightImage" 259188.766 6246554.170 -gcp "$WidthImage" 0 260098.649 6247162.445 -gcp "$WidthImage" "$HeightImage" 260098.649 6246554.170 "$tifile" "Out_"$tifile""
#gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha "Out_"$tifile"" "Out_ALpha_"$tifile""





echo -e "${white}---> Actions conditionnelles"

if [ "$NameOut" == 4-41 ]||[ "$NameOut" == 04-41 ]
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

gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 239613.067310811 6252614.19328096 -gcp 0 "$HeightImage" 239614.555397205 6252005.46916398 -gcp "$WidthImage" 0 240523.53161475 6252616.38252428 -gcp "$WidthImage" "$HeightImage" 240524.953821361 6252007.65809093 "$tifile" temp.tif
gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha temp.tif "../Output/"$NameOut"_"$Year".tif"
rm temp.tif

#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$tifile" "../Output/"$NameOut"_"$Year".tif"

elif [ "$NameOut" == 25-41 ]
then
echo "${red}$NameOut${reset}"
else

gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$tifile" "../Output/"$NameOut"_"$Year".tif"


echo hello there
echo -e "${white}---> Fin des actions conditionnelles"

fi



#gdalwarp -s_srs EPSG:3857  -co COMPRESS=NONE -dstalpha "Out_"$tifile"" "Out_ALpha_"$tifile""


#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 259188.766 6247162.445 -gcp 0 4808 259188.766 6246554.170 -gcp 7200 0 260098.649 6247162.445 -gcp 7200 4808 260098.649 6246554.170 "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA.tif"
done


# gdal_translate -of GTiff -gcp 0.717799 4817.02 260104 6.24716e+06 -gcp 7036.62 4828.34 260713 6.24716e+06 -gcp 12.0386 22.6417 260084 6.24777e+06 -gcp 7047.94 5.66042 260675 6.24778e+06 "/Users/zeus/Desktop/Gallica/Croped/Source/18-41_1957_V1_1957.tif" "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/18-41_1957_V1_1957.tif"
# gdalwarp -r near -order 1 -co COMPRESS=NONE  -t_srs EPSG:3857 "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/18-41_1957_V1_1957.tif" "/Users/zeus/Desktop/Gallica/Croped/Source/18-41_1957_V1_1957_georef.tif"



#gdal_translate -of GTiff -gcp 259191 -6.24716e+06 259192 6.24716e+06 -gcp 259190 -6.24656e+06 259192 6.24655e+06 -gcp 260099 -6.24716e+06 260093 6.24716e+06 -gcp 260100 -6.24656e+06 260105 6.24656e+06 "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA.tif" "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/25-50-KAFKA.tif"
#gdalwarp -r near -order 1 -co COMPRESS=NONE  -t_srs EPSG:3857 "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/25-50-KAFKA.tif" "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA_georef.tif"


#gdal_translate -a_srs EPSG:3857 -of GTiff -gcp 0 0 259189 6.24717e+06 -gcp 0 4808 259189 6.24655e+06 -gcp 7214.44 5.62998 260103 6.24717e+06 -gcp 7197.56 4796.74 260100 6.24656e+06 "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA.tif" ZOUT.tif
#gdalwarp -r near -order 1 -co COMPRESS=NONE  -t_srs EPSG:3857 "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/25-50-KAFKA.tif" "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA_georef.tif"



#gdal_translate -of GTiff -gcp 0 0 259189 6.24717e+06 -gcp 0 4808 259189 6.24655e+06 -gcp 7214.44 0 260103 6.24717e+06 -gcp 7197.56 4808 260100 6.24656e+06 "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA.tif" "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/25-50-KAFKA.tif"
#gdalwarp -r near -order 1 -co COMPRESS=NONE  -t_srs EPSG:3857 "/private/var/folders/0b/gqylm8fs4w33qsb4yxk49gxr0000gn/T/25-50-KAFKA.tif" "/Users/zeus/Desktop/Gallica/CARTO_CLEAN/25-50-KAFKA_georef.tif"
