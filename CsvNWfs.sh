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
grey=`tput setaf 248`
lightyellow=`tput setaf 229`
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir" 2>&1 &>/dev/null
echo "${bg_blue}${white}---> Hello I'm CsvNWfs.sh${reset}"
echo "${white}---> i'm gathering information to generate a CSV listing different rasters files version, tagging them with key value using exif \"Keywords\" tag in the Geotiff and generating a csv list of all processed maps"
echo "${white}---> Also, I make jpegs files with .wld ans .prj encapsulated in a .zip for Avenza Maps."


source tmp/tmp_bash
source tmp/variable_invariable
hauteur=400
Largeur=600

# To get parent map
AbscissaMultiple=$(echo "$Abscissa"-50 |bc -l)
OrdinateMultiple=$(echo "$Ordinate"-25 | bc -l)
# Position Origin (Mètres) 600000 126224 Zéro de l'observatoire de Paris

NordBasicTMP=$(echo 126224-$Hauteur*$AbscissaMultiple |bc -l )
SudBasicTMP=$(echo 125824-$Hauteur*$AbscissaMultiple|bc -l )
EstBasicTMP=$(echo 600000+\($OrdinateMultiple*$Largeur\) |bc -l )
OuestBasicTMP=$(echo 599400+\($OrdinateMultiple*$Largeur\) |bc -l )

NordOuestBasic=$(echo $OuestBasicTMP $NordBasicTMP| gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
SudOuestBasic=$(echo $OuestBasicTMP $SudBasicTMP| gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
SudEstBasic=$(echo $EstBasicTMP $SudBasicTMP| gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
NordEstBasic=$(echo $EstBasicTMP $NordBasicTMP| gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')


if [[ $Char3 == [A-Z] ]]
then
echo $orange XXXXXXXXXXXX ZZZZZZZZZZZZZZ PlancheName_Simple $PlancheName_Simple
planchesNames=$(awk -F'|' -v "le_nom_completa"="$planchesNamesTMP" '$3=='le_nom_completa'' CODEX_PLANCHES.csv | awk -F'|' '{print $2, $3, $4}' OFS='|' | awk '{print $0"|"}' )
NodeID=$(awk -F'|' -v "lenomcompletc"="$planchesNamesTMP" '$3=='lenomcompletc'' CODEX_PLANCHES.csv | awk -F'|' '{print $1}')
echo NodeID=\"$NodeID\" >> tmp/tmp_bash
elif [[ $PlancheName_Simple == Feuille-* ]]
then
echo $purple XXXXXXXXXXXX ZZZZZZZZZZZZZZ PlancheName_Simple $PlancheName_Simple
PlancheFeuille=$( echo "$PlancheName_Simple"| sed 's/Feuille-//g' )
planchesNames=$(awk -F'|' -v "le_nom_completb"="$PlancheName_Simple" '$4=='le_nom_completb'' CODEX_PLANCHES.csv | awk -F'|' '{print $2, $3, $4}' OFS='|'| awk '{print $0"|"}' )
NodeID=$(awk -F'|' -v "lenomcompletc"="$PlancheName_Simple" '$4=='lenomcompletc'' CODEX_PLANCHES.csv | awk -F'|' '{print $1}')
echo $purple $NodeID NodeID NodeID NodeID NodeID NodeID NodeID
echo NodeID=\"$NodeID\" >> tmp/tmp_bash
else
echo $green XXXXXXXXXXXX ZZZZZZZZZZZZZZ PlancheName_Simple $PlancheName_Simple


planchesNames=$(awk -F'|' -v "lenomcompletc"="$planchesNamesTMP" '$2=='lenomcompletc'' CODEX_PLANCHES.csv | awk -F'|' '{print $2, $3, $4}' OFS='|' | awk '{print $0"|"}')
NodeID=$(awk -F'|' -v "lenomcompletc"="$planchesNamesTMP" '$2=='lenomcompletc'' CODEX_PLANCHES.csv | awk -F'|' '{print $1}')
echo NodeID=\"$NodeID\" >> tmp/tmp_bash
#awk -F'|' -v "le_nom_complet"="$Title_Name" '$3=='le_nom_complet'' Cleaned_db/title.basics_movie.csv | awk -F'|' -v "year"="$Year" '$6=='year'' > ../.Temp.film

fi


base_name=$(echo "$PlancheName_Simple" | awk -F'_' '{print $1}')



# last modified in
NameOf_LastProcessed=$(ls -t ../_Output/ | head -n1| sed 's/........$//')

### Echo des variables
echo "                                                                     ${grey}Nord     Lambert 1"
echo "${grey}---> \$Nord   Lambert Nord    -   - EPSG:${green}27561${grey}-   -   -   -   -   -   ${orange}$Nord"
echo "                                                                     ${grey}Sud      Lambert 1"
echo "${grey}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${grey}-   -   -   -   -   -   ${orange}$Sud"
echo "                                                                     ${grey}Est      Lambert 1"
echo "${grey}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${grey}-   -   -   -   -   -   ${orange}$Est"
echo "                                                                     ${grey}Ouest    Lambert 1"
echo "${grey}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${grey}-   -   -   -   -   -   ${orange}$Ouest"
echo "
${grey}---> WGS 84 (World Geodetic System 1984)EPSG:${green}4326 ${grey}Corners unit  :       ${green}degree          ${grey}<---
${grey}---> \"World Geodetic System 1984 / -85.06,-180,85.06,180\""

echo "${grey}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${grey} -   -   -   -   -   -   ${orange}$NordOuest4326"
echo "${grey}---> \$SudOuest4326   -   -   -   - EPSG:${green}4326${grey} -   -   -   -   -   -   ${orange}$SudOuest4326"
echo "${grey}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${grey} -   -   -   -   -   -   ${orange}$NordEst4326"
echo "${grey}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${grey} -   -   -   -   -   -   ${orange}$SudEst4326"

echo "
${grey}---> WGS 84 / Pseudo-Mercator      EPSG:${green}3857 ${grey}Corners      unit  :       ${green}meter           ${grey}<---
${grey}---> \"World Geodetic System 1984\""
echo "${grey}---> \$NordOuest3857  -   -   -   - EPSG:${green}3857${grey} -   -   -   -   -   -   ${orange}$NordOuest3857"
echo "${grey}---> \$SudOuest3857   -   -   -   - EPSG:${green}3857${grey} -   -   -   -   -   -   ${orange}$SudOuest3857"
echo "${grey}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${grey} -   -   -   -   -   -   ${orange}$SudEst3857"
echo "${grey}---> \$NordEst3857    -   -   -   - EPSG:${green}3857${grey} -   -   -   -   -   -   ${orange}$NordEst3857"

echo "${grey}---> \$WidthImage${grey} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage px"
echo "${grey}---> \$HeightImage${grey}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage px"
echo "${grey}---> \$Year${grey}   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "${grey}---> \$geoserverworkspace${grey} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$geoserverworkspace"
echo "${grey}---> \$PlancheName_Simple${grey} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$PlancheName_Simple"
echo "${grey}---> \$NameOf_LastProcessed${grey}   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameOf_LastProcessed"
echo "${grey}---> \$Ordinate${grey}      -   -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordinate"
echo "${grey}---> \$Abscissa${grey}      -   -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Abscissa"

echo "${grey}---> \$NordOuestBasic${grey}    -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NordOuestBasic"
echo "${grey}---> \$SudOuestBasic${grey}     -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$SudOuestBasic"
echo "${grey}---> \$SudEstBasic${grey}       -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$SudEstBasic"
echo "${grey}---> \$NordEstBasic${grey}      -    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NordEstBasic"
echo "${grey}---> \$StorageLocation${grey}   Root folder where the souces are -   -   -   -   -   ${orange}$StorageLocation"
echo "${grey}---> \$base_name${grey}     -   -    -   -   -   -   -   -   -   -   -   -   -   -   ${purple}$base_name"
echo "${grey}---> \$NodeID${grey}        -   -    -   -   -   -   -   -   -   -   -   -   -   -   ${purple}$NodeID"

BasicWKT=$(echo "GEOMETRYCOLLECTION(POLYGON(($NordOuestBasic,$SudOuestBasic,$SudEstBasic,$NordEstBasic,$NordOuestBasic)))")
echo "${grey}---> \$BasicWKT${grey}   Original layer extent   -   -   -   -   -   -   -   -   -   ${orange}$BasicWKT"

if [[ $base_name == 42-43-39 ]]||[[ $base_name == 34-38-35 ]]||[[ $base_name == 48-38-39 ]]||[[ $base_name == 36-40-41 ]]||[[ $base_name == 3-4-41 ]]||[[ $base_name == 32-41-33 ]]||[[ $base_name == 34-41-42 ]]||[[ $base_name == 36-41-42 ]]||[[ $base_name == 36-42-43 ]]||[[ $base_name == 39-43-44 ]]||[[ $base_name == 39-44-45 ]]||[[ $base_name == 41-46-42 ]]||[[ $base_name == 41-45-42 ]]||[[ $base_name == 41-45-42_Encart ]]||[[ $base_name == 34-48-49 ]]||[[ $base_name == 33-48-49 ]]||[[ $base_name == 34-49-50 ]]||[[ $base_name == 35-49-50 ]]||[[ $base_name == 8-9-51-52 ]]||[[ $base_name == 33-51-34 ]]||[[ $base_name == 12-54-55 ]]||[[ $base_name == 37-58-59 ]]||[[ $base_name == 45-58-59 ]]||[[ $base_name == 38-58-59 ]]||[[ $base_name == 42-60-43 ]]||[[ $base_name == 15-59-16 ]]||[[ $base_name == 18-40-19 ]]||[[ $base_name == 28-12-13 ]]||[[ $base_name == 42Q-R ]]||[[ $base_name == 40M-N ]]||[[ $base_name == 43M-R ]]||[[ $base_name == 41U-50A ]]||[[ $base_name == 49B-C ]]||[[ $base_name == 49D-I ]]||[[ $base_name == 50A-F ]]||[[ $base_name == 50F-N ]]||[[ $base_name == 50N-S ]]||[[ $base_name == 50S-X ]]||[[ $base_name == 59A-B ]]||[[ $base_name == 51U-V ]]||[[ $base_name == 51U ]]||[[ $base_name == 57N-S ]]||[[ $base_name == 57M-R ]]||[[ $base_name == 57S-X ]]||[[ $base_name == 57T-Y ]]||[[ $base_name == 65C-D ]]||[[ $base_name == 61Q-V ]]||[[ $base_name == 76O-T ]]||[[ $base_name == 75M-N ]]||[[ $base_name == 76V-W ]]||[[ $base_name == 70T-71P ]]||[[ $base_name == 37W-X ]]||[[ $base_name == 3H-M ]]||[[ $base_name == Feuille-76 ]]||[[ $base_name == Feuille-124-125 ]]||[[ $base_name == Feuille-126-144 ]]||[[ $base_name == Feuille-273 ]]||[[ $base_name == Feuille-274 ]]||[[ $base_name == Feuille-304 ]]||[[ $base_name == Feuille-93 ]]
then
echo "${red} $base_name Special Case ${purple}"
awk "/$base_name/" tmp/List_Special_Planches.csv
else
echo "$green Normal.. I'm Normal (Map Extent)"
fi




filesizePX=$(exiftool ../_Output/"$Lastrender" | awk '/Image Size/' |sed 's/x/ X /g' |awk -F' : ' '{print $2" PX "}')
filesizeMO=$(exiftool ../_Output/"$Lastrender" | awk '/File Size/' |sed 's/x/ X /g' |awk -F' : ' '{print $2}'| sed 's/MB/MO/g' | sed 's/MiB/MO/g'  )
FileName=$(exiftool ../_Output/"$Lastrender" | awk '/File Name/' |sed 's/x/ X /g' |awk -F' : ' '{print $2}' | awk -F'_' '{print $1, $2}' |awk -F'.' '{print $1}'  )
ResolutionX=$(exiftool ../_Output/"$Lastrender" | awk '/X Resolution/' |awk -F' : ' '{print $2}')
ResolutionY=$(exiftool ../_Output/"$Lastrender" | awk '/Y Resolution/' |awk -F' : ' '{print $2}')
ResolutionY_rounded=`printf "%.0f" $ResolutionY`
ResolutionX_rounded=`printf "%.0f" $ResolutionX`
echo ""$FileName" - "$geoserverworkspace" - Size: "$filesizePX"- Res : "$ResolutionX_rounded" pixels/pouce - "$filesizeMO" - GeoTiff" >> tmp/GeoTiffList



if [[ $TiffSource == *-union_* ]]||[[ $TiffSource == *Feuille-300-301_* ]]
then
echo "${green}---> i'm very special (not cropped as the original frame or like Feuille-300-301 with a different size)"
fi

InfoSpecialMap=$(awk -F'|' -v 'NameOf_LastProcessed'='$NameOf_LastProcessed' "/$NameOf_LastProcessed/"  tmp/List_Special_Planches.csv |awk -F'|' '{print $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16}' OFS='|')

echo "${grey}---> \$InfoSpecialMap${grey}   :  ${orange}$InfoSpecialMap"

#if [[ "$InfoSpecialMap" == "" ]]
#then
#echo "$white top left = $green Nord Ouest $Nord $Ouest $TiffSource $purple I'm not a speciale maps XXXXXXXXX"
#else
#echo "$red SPECIAL INFO"
#fi
#

#"Filename|nodetitle|OldNum|field_deptf_seine|top_left27561|bottom_left27561|bottom_right27561|top_right27561|top_left|bottom_left|bottom_right|top_right|top_left4326|bottom_left4326|bottom_right4326|top_left4326|WKT|RawMapUri|RawMapName|StorageLocation|PreviewPNGLocation|Year|nodeID|WKT_Map_Extent|geoserverworkspace"
RawMapName=$(echo "$NameNoExt" - "$Year" - "$geoserverworkspace" - "$ResolutionX X $ResolutionY" PX - "$ResolutionX_rounded"  pixels/pouce - Mètre - EPSG:3857| tr '_' ' ')
RawMapUri=$(echo "$StorageLocation"_Output_3857/"$NameNoExt"_"$Year".tif)
ZipRawMapUri=$(echo "$StorageLocation"_Output_wld_zip/"$NameNoExt"_"$Year".zip)
PreviewPNGLocation=$(echo "$StorageLocation"/_Output_PNG_Preview/"$NameNoExt"_"$Year".png)

if [[ "$InfoSpecialMap" == "" ]]
then
WKT_Map_Extent=$(echo "Polygon (($NordOuest3857, $SudOuest3857, $SudEst3857, $NordEst3857, $NordOuest3857))")
#echo "$Lastrender$planchesNames|$Nord $Ouest|$Sud $Ouest|$Sud $Est|$Nord $Est|$NordOuest3857|$SudOuest3857|$SudEst3857|$NordEst3857|$NordOuest4326|$SudOuest4326|$SudEst3857|$NordEst4326|Polygon (($NordOuest3857, $SudOuest3857, $SudEst3857, $NordEst3857, $NordOuest3857))||||$PreviewPNGLocation|$Year|$NodeID|$WKT_Map_Extent"
exiftool -r -overwrite_original -keywords= -m -keywords="$Lastrender|$planchesNames$Nord $Ouest|$Sud $Ouest|$Sud $Est|$Nord $Est|$NordOuest3857|$SudOuest3857|$SudEst3857|$NordEst3857|$NordOuest4326|$SudOuest4326|$SudEst4326|$NordEst4326|Polygon (($NordOuest3857, $SudOuest3857, $SudEst3857, $NordEst3857, $NordOuest3857))|$RawMapUri|$RawMapName|$StorageLocation|$PreviewPNGLocation|$Year|$NodeID|$WKT_Map_Extent|$geoserverworkspace|$ZipRawMapUri" ../_Output/"$Lastrender"
echo "$Lastrender|$planchesNames$Nord $Ouest|$Sud $Ouest|$Sud $Est|$Nord $Est|$NordOuest3857|$SudOuest3857|$SudEst3857|$NordEst3857|$NordOuest4326|$SudOuest4326|$SudEst4326|$NordEst4326|Polygon (($NordOuest3857, $SudOuest3857, $SudEst3857, $NordEst3857, $NordOuest3857))|$RawMapUri|$RawMapName|$StorageLocation|$PreviewPNGLocation|$Year|$NodeID|$WKT_Map_Extent|$geoserverworkspace|$ZipRawMapUri"  > tmp/csv_tmp
else
echo "$yellow I'm .. SPECIAL !"
WKT_Map_Extent=$(awk -F'|' -v 'NameOf_LastProcessed'='$NameOf_LastProcessed' "/$NameOf_LastProcessed/"  tmp/List_Special_Planches.csv |awk -F'|' '{print $16}')

exiftool -r -overwrite_original -keywords= -m -keywords="$Lastrender|$planchesNames$InfoSpecialMap|$RawMapUri|$RawMapName|$StorageLocation|$PreviewPNGLocation|$Year|$NodeID|$WKT_Map_Extent|$geoserverworkspace|$ZipRawMapUri" -artist="sous-paris.com" -Software="Kta2geo 1.1" ../_Output/"$Lastrender"
echo "$Lastrender|$planchesNames$InfoSpecialMap|$RawMapUri|$RawMapName|$StorageLocation|$PreviewPNGLocation|$Year|$NodeID|$WKT_Map_Extent|$geoserverworkspace|$ZipRawMapUri" > tmp/csv_tmp
fi


CSV_INFO=$(cat tmp/csv_tmp)

gdal_translate -co "TFW=YES" ../_Output/"$Lastrender" temp.tif
LastrenderNoExt=$(echo "$Lastrender"| sed 's/\.tif//g')
convert temp.tif "$LastrenderNoExt".jpg
convert ../_Output/"$Lastrender"[1]  -define png:swap-bytes -resize x200 ../_Output_PNG_Preview/"$NameNoExt"_"$Year".png

exiftool -all= -m -Keywords="$CSV_INFO" -Software="Kta2geo 1.1" -artist="sous-paris.com" ../_Output_PNG_Preview/"$NameNoExt"_"$Year".png
if [ -f ../_Output_PNG_Preview/"$NameNoExt"_"$Year".png_original ]
then
rm ../_Output_PNG_Preview/"$NameNoExt"_"$Year".png_original
fi
exiftool -m -keywords="$CSV_INFO" -artist="sous-paris.com" -Software="Kta2geo 1.1" "$LastrenderNoExt".jpg

mv temp.tfw "$LastrenderNoExt".wld
#proj
echo 'PROJCS["WGS_1984_Web_Mercator_Auxiliary_Sphere",GEOGCS["GCS_WGS_1984",DATUM["D_WGS_1984",SPHEROID["WGS_1984",6378137.0,298.257223563]],PRIMEM["Greenwich",0.0],UNIT["Degree",0.0174532925199433]],PROJECTION["Mercator_Auxiliary_Sphere"],PARAMETER["False_Easting",0.0],PARAMETER["False_Northing",0.0],PARAMETER["Central_Meridian",0.0],PARAMETER["Standard_Parallel_1",0.0],PARAMETER["Auxiliary_Sphere_Type",0.0],UNIT["Meter",1.0]]' > "$LastrenderNoExt".prj

echo ""$FileName" - "$geoserverworkspace" - Size: "$filesizePX"- Res : "$ResolutionX_rounded" pixels/pouce - "$filesizeMO" - GeoTiff" >> tmp/GeoTiffList

echo ""$FileName" - "$geoserverworkspace" - Size: "$filesizePX"- Res : "$ResolutionX_rounded"  pixels/pouce - Mètre - EPSG:3857 .wld + .prj" > "$LastrenderNoExt"_info.txt
zip "$LastrenderNoExt".zip "$LastrenderNoExt".jpg "$LastrenderNoExt".wld "$LastrenderNoExt".prj "$LastrenderNoExt"_info.txt

if [ -f ../_Output_wld_zip/"$LastrenderNoExt".zip ]
then
mv ../_Output_wld_zip/"$LastrenderNoExt".zip ../_TRASH_TEMP/"$FileDate"_"$LastrenderNoExt".zip
fi
mv "$LastrenderNoExt".zip ../_Output_wld_zip/
rm "$LastrenderNoExt".jpg "$LastrenderNoExt".wld "$LastrenderNoExt".prj "$LastrenderNoExt"_info.txt
if [ -f "$LastrenderNoExt".jpg_original ]
then
rm "$LastrenderNoExt".jpg_original
fi







# Generating CSV Computed_Maps.csv
if [ -f tmp/computed_MapsTMP.csv ]
then
rm tmp/computed_MapsTMP.csv
fi

for ListGeoreferenced in ../_Output/*.tif
do
exiftool "$ListGeoreferenced" | awk '/Keywords                        :/'| awk -F': ' '{print $2}' >> tmp/computed_MapsTMP.csv


done
echo "${white}---> Control bash export${orange}"
cat tmp/tmp_bash
