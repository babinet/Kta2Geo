
#_Atlas_des_Carrière_du_département_1962.tif"
#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 582000 141874 -gcp 0 "$HeightImage" 582000 113824 -gcp "$WidthImage" 0 617210 141874 -gcp "$WidthImage" "$HeightImage" 617210 113824 "$TiffSource" temp.tif
#gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/_TEST.tif
#



#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589500 125624 -gcp 0 "$HeightImage" 589500 125224 -gcp "$WidthImage" 0 590100 125624 -gcp "$WidthImage" "$HeightImage" 590100 125224 "$TiffSource" temp.tif
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
## rm "../_Output/"$NameNoExt"_"$Year".tif"
#mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#
#fi
#gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

NameNoExt=12A
IDCThirdLetter=$(echo "$NameNoExt" | head -c 3 | tail -c 1 )

#IDCFirst2Nbr
echo "$purple IDCThirdLetter $IDCThirdLetter"
#^[0-9]{2}[A-Z]{1}$

#
# Sous condition numéros 26K, 72Y,
#
#[A-Z]{2}\d{6}

#if [[ "$NameNoExt" =~ ^[0-9]+[A-Z]$* ]]
if [[ $IDCThirdLetter =~ [A-B] ]]
then
echo $green YEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEES $purple $NameNoExt
else

echo $red NOOOOOOOOO $NameNoExt
fi

ObservatoireLong=600000
ObservatoireLat=126224
