#/bin/bash!
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
if [ -d tmp/NewLayers ]
then
rm -R tmp/NewLayers
fi
mkdir -p tmp/NewLayers/Layers_by_NodeID

if [ -f tmp/NewLayers/JSWorkspace ]
then
rm tmp/NewLayers/JSWorkspace
fi
# Menu to check the storage and the layer name in javascript
function askYesNo {
        QUESTION=$(echo "${white}---> Would you like to round-up files from different Geoserver workspace in a common workspace in the javascript Dynamic Layers ?
${white}---> Common use case: ${orange}The IDC Background from diffrent sources (BHVP, CapGeo, OpenData92, RATP, ...)${white} but in the same workspace to agregate layers in one single layer
${white}---> This rule will have only consequeces on ${orange}Geoserver Workspace ${white}where are stored the GeoTiff and in the ${orange}JavaScript of the dynamic Layers eg. ${green}Workspace:LayerName"
)
        DEFAULT=$2
        if [ "$DEFAULT" = true ]; then
                OPTIONS="${red}[Y/n]"
                DEFAULT="y"
            else
                OPTIONS="${red}[y/N]"
                DEFAULT="n"
        fi
        read -p "$QUESTION $OPTIONS " -n 1 -s -r INPUT
        INPUT=${INPUT:-${DEFAULT}}
        echo ${INPUT}
        if [[ "$INPUT" =~ ^[yY]$ ]]; then
            ANSWER=true
        else
            ANSWER=false
        fi
}

askYesNo "Do it?" true
DOIT=$ANSWER
if [ "$DOIT" = true ]; then
    read -p "${orange}---> What is the name of the geoserver workspace .eg : IDC ? : ${green}" JavacriptWorkspace

JSWorkspace=$(echo "$JavacriptWorkspace")
echo "$JSWorkspace" > tmp/NewLayers/JSWorkspace
echo "${white}---> $JSWorkspace will be used to print javascript and will have to be use as Workspace ${orange}$JSWorkspace in geoserver"
else
echo "${white}---> The Workspace from files meta data will be used to print javascript"
fi









if [ -f tmp/StorageLocation ]
then
StorageLocation=$(cat tmp/StorageLocation)
read -p "${white}---> The current Storage Location is                                 : ${orange}$StorageLocation (y/n) ? :" RESP
if [ "$RESP" = "y" ]; then
echo "${white}---> Using $StorageLocation as default Storage Location"
else
echo "${white}---> The source files path must be as fellow
eg. /my_folder/3857 /my_folder/pngpreview"
read -p "${white}What is the Storage Location of the maps eg. /my_folder/
Do not forget the tailing / ${green} : " StorageLocation
echo "$StorageLocation" > tmp/StorageLocation
fi
else
read -p "${orange}What is the Storage Location of the maps eg. /my_folder/
Do not forget the tailing / ${green} :  " StorageLocation
echo "$StorageLocation" > tmp/StorageLocation
fi
StorageLocation=$(cat tmp/StorageLocation)

#
## Début
#
echo "${white}---> On the distant server list existing geottifs : ${orange} /var/www/carto/sites/all/themes/cdm/bash/List_Geotifs_private_Raw_map.sh"
read -p "${white}---> Hit enter when done!"
echo "${white}---> rapatriement de la liste des calques sur le server"

if [ -f Server_Port.cfg ]
then
echo "${green}---> Server.cfg found"
else
read -p "What is the server name .eg : sous-paris.com ? : " Server_SCP
echo "$Server_SCP" > Server_SCP.cfg

read -p "What is the server port .eg :  1777 ? : " Server_port
echo "$Server_port" > Server_Port.cfg

read -p "What is the server user .eg :  philibert ? : " Server_User
echo "$Server_User" > User_SCP.cfg
fi
Port_SCP=$(cat Server_Port.cfg)
Server_SCP=$(cat Server_SCP.cfg)
User_scp=$(cat User_SCP.cfg)

echo "${white}---> From the ${orange}Server_SCP.cfg Server_Port.cfg${white} the server name is${orange} $Server_SCP${white} port ${orange}$Port_SCP"
echo "${white}---> The command shoult be : ${green}scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/LISTTIFF/listTiffInServer.csv tmp/NewLayers/listTiffInServer.csv"
scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/LISTTIFF/listTiffInServer.csv tmp/NewLayers/listTiffInServer.csv


# List New Layers
find ../_Output_3857/ -name '*.tif' |sed 's/\/\//\//g' > tmp/NewLayers/TheNewGeotiffs.txt
mkdir -p tmp/NewLayers/NewTiffTXT
for TheNewGeotiffslist in $(cat tmp/NewLayers/TheNewGeotiffs.txt)
do
TheFileSourceTIFF=$(echo "$TheNewGeotiffslist"| awk -F/ '{print $NF}')
The_layer_machine_name=$(echo "$TheNewGeotiffslist"| awk -F/ '{print $NF}'| awk '{print tolower($0)}'|sed 's/.tif//g')

exiftool "$TheNewGeotiffslist" |awk '/Keywords/' | sed 's/Keywords                        : //g' > tmp/NewLayers/NewTiffTXT/"$The_layer_machine_name".txt
echo $white $TheFileSourceTIFF
Server23_NodeID=$(cat tmp/NewLayers/NewTiffTXT/"$The_layer_machine_name".txt | awk -F'|' '{print $23}')
echo $orange $Server23_NodeID
done

if [ -f tmp/all_layers.txt ]
then
rm tmp/all_layers.txt
fi
if [ -f tmp/NewLayers/NewTiffTXT/_CSVall_layers.txt ]
then
rm tmp/NewLayers/NewTiffTXT/_CSVall_layers.txt
fi

IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
find tmp/NewLayers/NewTiffTXT/ -name '*.txt' | sed 's/\/\//\//g' > tmp/NewLayers/all_layers.txt
for txt in $(cat tmp/NewLayers/all_layers.txt)
do
cat $txt >> tmp/NewLayers/NewTiffTXT/_CSVall_layers.txt
done

cat tmp/NewLayers/NewTiffTXT/_CSVall_layers.txt |awk -F'|' '{print $23}' |awk '!/./ || !seen[$0]++'| awk NF > tmp/NewLayers/NewTiffTXT/NodeID_To_Update.txt

cat tmp/NewLayers/NewTiffTXT/_CSVall_layers.txt > tmp/NewLayers/AlLMixedLayers.csv
cat tmp/NewLayers/listTiffInServer.csv >> tmp/NewLayers/AlLMixedLayers.csv
cat tmp/NewLayers/AlLMixedLayers.csv | awk NF > tmp/NewLayers/AlLMixedLayers.csvtmp && mv tmp/NewLayers/AlLMixedLayers.csvtmp tmp/NewLayers/AlLMixedLayers.csv
cat tmp/NewLayers/AlLMixedLayers.csv|awk -F'|' '!/./ || !seen[$1]++' > tmp/NewLayers/AlLMixedLayersNODUPES.csv
if [ -f tmp/NewLayers/temp_layers_div_elements.txt ]
then
rm tmp/NewLayers/temp_layers_div_elements.txt
fi
if [ -f tmp/NewLayers/TMPJS.js ]
then
rm tmp/NewLayers/TMPJS.js
fi

echo 'jQuery(document).ready(function($) {

map.openlayers.events.register("moveend", map, function(){
    var mapbounds = map.openlayers.getExtent();
    bbox = mapbounds.toArray();
    var bleft = bbox[0];
    var bbottom = bbox[1];
    var bright = bbox[2];
    var btop = bbox[3];
    ' > tmp/NewLayers/HidendSeek.js

# update with NodeID_To_Update as driven key
if [ -f tmp/NewLayers/ALL_LAYERS.txt ]
then
rm tmp/NewLayers/ALL_LAYERS.txt
fi
if [ -f tmp/NewLayers/TheCureentNodeBody.csv ]
then
rm tmp/NewLayers/TheCureentNodeBody.csv
fi

IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
for newlayersIDs in $(cat tmp/NewLayers/NewTiffTXT/NodeID_To_Update.txt)
do

THELAYERSONELINETIFF=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $18}'|tr '\n' '@' |sed 's/\@$//')
S2_nodetitle=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $2}'|awk "NR == 1" )
S3_field_deptf_seine=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $3}'|awk "NR == 1" )
S4_OldNum=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $4}'|awk "NR == 1" )
#3857
S35_NordOuestBasic=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $35}'|awk "NR == 1" )
S36_SudOuestBasic=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $36}'|awk "NR == 1" )
S37_SudEstBasic=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $37}'|awk "NR == 1" )
S38_NordEstBasic=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $38}'|awk "NR == 1" )
# 27561
S27_NordOuestBasic2571=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $27}'|awk "NR == 1" )
S28_SudOuestBasic2571=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $28}'|awk "NR == 1" )
S29_SudEstBasic2571=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $29}'|awk "NR == 1" )
S30_NordEstBasic2571=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $30}'|awk "NR == 1" )
# 4326
S31_NordOuestBasic4326=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $31}'|awk "NR == 1" )
S32_SudOuestBasic4326=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $32}'|awk "NR == 1" )
S33_SudEstBasic4326=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $33}'|awk "NR == 1" )
S34_NordEstBasic4326=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $34}'|awk "NR == 1" )

S17_WKT=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $17}'|awk "NR == 1" )

S19_Original_RawMapName=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $19}'|tr '\n' '@' |sed 's/\@$//')
S65_The_zips_sources=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $26}'|tr '\n' '@' |sed 's/\@$//')

S68_SourcePNG=$(awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv|awk -F'|' '{print $21}'|tr '\n' '@' |sed 's/\@$//')


awk -F'|' -v "newlayersIDs"="$newlayersIDs" '$23=='newlayersIDs'' tmp/NewLayers/AlLMixedLayersNODUPES.csv OFS='|' |sort -n -t'|' -k22 > tmp/NewLayers/TheCURENTNODE.CSV
IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
#read -p "wait here"
for theplanchesinnode in $(cat tmp/NewLayers/TheCURENTNODE.CSV)
do

The_fullname=$(echo "$theplanchesinnode" |awk -F'|' '{print $19}'|awk -F'","' '{print $1"</br> GeoTiff - WGS 84 - Tagged"}')
The_fullnameexerpforTheZipNameTooltip=$(echo "$The_fullname"|awk -F'pouce' '{print $1"pouce"}')
The_CentroidPlanche=$(echo "$theplanchesinnode" |awk -F'|' '{print $40}')



TheZipNameShort=$(echo "$theplanchesinnode" |awk -F'|' '{print $1}'|awk -F'_' '{print $1, $3" .jpg .zip .wld . prj"}' |sed 's/\.tif//g')






# OK

TheOriginalFilename=$(echo "$theplanchesinnode" |awk -F'|' '{print $1}')

The_LayerMachineName=$(echo planche"$theplanchesinnode"|awk -F'|' '{print $1}'|tr '-' '_' | awk '{print tolower($0)}'| sed 's/.tif//g'|tr ' ' '_')
TheLayerMachineName_rm=$(echo "$The_LayerMachineName"_rm)
TheAddLayerMachineName=$(echo add_"$The_LayerMachineName")

echo $purple $TheAddLayerMachineName TheAddLayerMachineName
TheZipLink=$(echo "$theplanchesinnode" |awk -F'|' '{print $26}')
TheZipOnly=$(echo "$TheZipLink" | awk '{print $NF}' FS=/)
theZipWeight=$(ls -lah ../_Output_wld_zip/"$TheZipOnly" | awk '{print $5}')
TheZipNameTooltip=$(echo "$The_fullnameexerpforTheZipNameTooltip     <br><b> $theZipWeight" )
HumanReadableName=$(echo "$theplanchesinnode" |awk -F'|' '{print $41}')
PrivatePath=$(echo "$theplanchesinnode" |awk -F'|' '{print "/private_file/Raw_map_EPSG_3857/"$1}')
TiffTooltip=$(echo "$theplanchesinnode" |awk -F'|' '{print $19}'|awk -F'-' '{print $1, $2, $3, $4, "<br>"$5, $6, "<br>"$7, $8, "<br><b>"$9}'|sed 's/   / /g')

Thetop_left4326=$(echo "$theplanchesinnode" | awk -F'|' '{print $13}')
Thebottom_left4326=$(echo "$theplanchesinnode" | awk -F'|' '{print $14}')
Thebottom_right4326=$(echo "$theplanchesinnode" | awk -F'|' '{print $15}')
Thetop_right4326=$(echo "$theplanchesinnode" | awk -F'|' '{print $16}')

Thetop_left27561=$(echo "$theplanchesinnode" | awk -F'|' '{print $5}')
Thebottom_left27561=$(echo "$theplanchesinnode" | awk -F'|' '{print $6}')
Thebottom_right27561=$(echo "$theplanchesinnode" | awk -F'|' '{print $7}')
Thetop_right27561=$(echo "$theplanchesinnode" | awk -F'|' '{print $8}')

Thetop_left=$(echo "$theplanchesinnode" | awk -F'|' '{print $9}')
Thebottom_left=$(echo "$theplanchesinnode" | awk -F'|' '{print $10}')
Thebottom_right=$(echo "$theplanchesinnode" | awk -F'|' '{print $11}')
Thetop_right=$(echo "$theplanchesinnode" | awk -F'|' '{print $12}')

ShortTifName=$(echo "$theplanchesinnode" |awk -F'|' '{print $19}' | awk -F' - ' '{print $1, $2, $4, $5}')
TheHTTPTiffsLink=$(echo "$theplanchesinnode"|awk -F'|' '{print $18}' |awk -F'_Output_3857' '{print "/system/files/Raw_map_EPSG_3857"$2}')

TheZipLink=$(echo "$theplanchesinnode" |awk -F'|' '{print $26}'|awk -F'_Output_wld_zip' '{print "/system/files/Raw_map_EPSG_3857_zip_wld"$2}')

ThePngPreview=$(echo "$TheHTTPTiffsLink" |sed 's/Raw_map_EPSG_3857/Raw_map_EPSG_3857_png_preview/g'|sed 's/\.tif/\.png/g')
echo $orange$TheHTTPTiffsLink
TheGeoserverFileName=$(echo  "$theplanchesinnode" |awk -F'|' '{print $1}'| sed 's/\.tif//g'|sed "s/'/\\'/g")
TheWorkspace=$(echo "$theplanchesinnode" |awk -F'|' '{print $25}')
TheWorkspaceClassJsCss=$(echo "$theplanchesinnode" |awk -F'|' '{print $25}'|tr '-' '_' | awk '{print tolower($0)}'| sed 's/.tif//g'|tr ' ' '_')
ShortTitleHeader=$(echo "$theplanchesinnode" |awk -F'|' '{print $41}')
TheEmprise=$(echo "$theplanchesinnode" |awk -F'|' '{print $24}'| sed 's/Polygon /GEOMETRYCOLLECTION(POLYGON/g'|sed 's/))/)))/g')
echo $white$TheEmprise

TheMachineName=$(echo "$theplanchesinnode"|awk -F'|' '{print $1}'|tr '-' '_' | awk '{print tolower($0)}'| sed 's/.tif//g'|tr ' ' '_')
S18_Original_Tiff_Sources=$(echo "$theplanchesinnode"|awk -F'|' '{print $18}')
TheYear=$(echo "$theplanchesinnode"|awk -F'|' '{print $22}')
S41TheHumaneReadable=$(echo "$theplanchesinnode" |awk -F'|' '{print $41}')
echo $lightblue$S18_Original_Tiff_Sources
echo $S68_SourcePNG


DoubleQuote=$(echo \")
QUOTE="'"
echo "<div class="$QUOTE"btn-group $TheWorkspaceClassJsCss btn-group-xs"$QUOTE" year="$QUOTE"$TheYear"$QUOTE">

<div class="$QUOTE"btn btn-dark btn-xs geometry layer-selected"$QUOTE" data-toggle="$QUOTE"popover"$QUOTE" data-original-title="$QUOTE"$ShortTitleHeader"$QUOTE" data-placement="$QUOTE"left"$QUOTE" data-content="$QUOTE"$TheEmprise"$QUOTE"><div class="$QUOTE"position"$QUOTE">$TheEmprise</div>Emprise</div>
<div class="$QUOTE"btn btn-dark btn-xs geometry corners"$QUOTE">
<div class="$DoubleQuote"tpl"$DoubleQuote">
<div class="$DoubleQuote"loc-wkt"$DoubleQuote">
<div class="$DoubleQuote"position"$DoubleQuote">GEOMETRYCOLLECTION(POINT("$Thetop_left"))</div><span class=$DoubleQuote"zoominfo$DoubleQuote">18</span>
<span class="$DoubleQuote"philicon-cible-UlLt"$DoubleQuote" data-toggle="$QUOTE"popover"$QUOTE" data-original-title="$QUOTE"Top left EPSG:3857"$QUOTE" data-content="$QUOTE"<div class="$DoubleQuote"epsg-3857"$DoubleQuote">$Thetop_left</div><div class="$DoubleQuote"epsg-4326"$DoubleQuote">EPSG:4326 $Thetop_left4326</div><div class="$DoubleQuote"epsg-27571"$DoubleQuote">EPSG:27561 $Thetop_left27561</div>"$QUOTE"></span>
</div>
</div>
<div class="$DoubleQuote"tprght"$DoubleQuote">
<div class="$DoubleQuote"loc-wkt"$DoubleQuote">
<div class="$DoubleQuote"position"$DoubleQuote">GEOMETRYCOLLECTION(POINT("$Thetop_right"))</div><span class=$DoubleQuote"zoominfo$DoubleQuote">18</span>
<span class="$DoubleQuote"philicon-cible-UlLt"$DoubleQuote" data-toggle="$QUOTE"popover"$QUOTE" data-original-title="$QUOTE"Top right EPSG:3857"$QUOTE" data-content="$QUOTE"<div class="$DoubleQuote"epsg-3857"$DoubleQuote">$Thetop_right</div><div class="$DoubleQuote"epsg-4326"$DoubleQuote">EPSG:4326 $Thetop_right4326</div><div class="$DoubleQuote"epsg-27571"$DoubleQuote">EPSG:27561 $Thetop_right27561</div>"$QUOTE"></span>
</div>
</div>
<div class="$DoubleQuote"coin"$DoubleQuote">Corners</div>
<div class="$DoubleQuote"btmlft"$DoubleQuote">
<div class="$DoubleQuote"loc-wkt"$DoubleQuote">
<div class="$DoubleQuote"position"$DoubleQuote">GEOMETRYCOLLECTION(POINT("$Thebottom_left"))</div><span class=$DoubleQuote"zoominfo$DoubleQuote">18</span>
<span class="$DoubleQuote"philicon-cible-UlLt"$DoubleQuote" data-toggle="$QUOTE"popover"$QUOTE" data-original-title="$QUOTE"Bottom left EPSG:3857"$QUOTE" data-content="$QUOTE"<div class="$DoubleQuote"epsg-3857"$DoubleQuote">$Thetop_right</div><div class="$DoubleQuote"epsg-4326"$DoubleQuote">EPSG:4326 $Thebottom_left4326</div><div class="$DoubleQuote"epsg-27571"$DoubleQuote">EPSG:27561 $Thebottom_left27561</div>"$QUOTE"></span>
</div>
</div>
<div class="$DoubleQuote"btmrght"$DoubleQuote">
<div class="$DoubleQuote"loc-wkt"$DoubleQuote">
<div class="$DoubleQuote"position"$DoubleQuote">GEOMETRYCOLLECTION(POINT("$Thebottom_right"))</div><span class=$DoubleQuote"zoominfo$DoubleQuote">18</span>
<span class="$DoubleQuote"philicon-cible-UlLt"$DoubleQuote" data-toggle="$QUOTE"popover"$QUOTE" data-original-title="$QUOTE"Bottom right EPSG:3857"$QUOTE" data-content="$QUOTE"<div class="$DoubleQuote"epsg-3857"$DoubleQuote">$Thetop_right</div><div class="$DoubleQuote"epsg-4326"$DoubleQuote">EPSG:4326 $Thebottom_right4326</div><div class="$DoubleQuote"epsg-27571"$DoubleQuote">EPSG:27561 $Thebottom_right27561</div>"$QUOTE"></span>
</div>
</div>
</div>
<div class="$QUOTE"btn btn-dark btn-xs showlayer"$QUOTE" data-img="$QUOTE"$ThePngPreview"$QUOTE" data-original-title="$QUOTE""$ShortTitleHeader""$QUOTE" data-toggle="$QUOTE"popover"$QUOTE" layer="$QUOTE"$TheAddLayerMachineName"$QUOTE" addlayertolist="$QUOTE"$PrivatePath"$QUOTE">Voir</div>
<div class="$QUOTE"btn btn-dark btn-xs hidelayer"$QUOTE" layer="$QUOTE"$TheLayerMachineName_rm"$QUOTE" removelayerfromlist="$DoubleQuote"$PrivatePath"$DoubleQuote">Cacher</div>
<a class="$QUOTE"btn btn-dark btn-xs download-tif"$QUOTE" href="$QUOTE"$TheHTTPTiffsLink"$QUOTE" data-toggle="$QUOTE"tooltip"$QUOTE" data-original-title="$QUOTE"$The_fullname"$QUOTE">$ShortTifName<span class="$QUOTE"glyphicon glyphicon-download-alt"$QUOTE"></span></a>
<a class="$QUOTE"btn btn-dark btn-xs download-zip"$QUOTE" href="$QUOTE"$TheZipLink"$QUOTE" data-toggle="$QUOTE"tooltip"$QUOTE" data-original-title="$QUOTE"$TheZipNameTooltip"$QUOTE">$TheZipNameShort<span class="$QUOTE"glyphicon glyphicon-download-alt"$QUOTE"></span></a>
</div>"  >> tmp/NewLayers/TheCureentNodeBody.csv






echo "
$white# JavScript and Html Element
# Make Hide and Seek
# Dynamic Layers (with map info)
# Make jquey
"

echo "<div class="$DoubleQuote"list-group-item $TheWorkspaceClassJsCss add-layer"$DoubleQuote" year="$DoubleQuote"$TheYear"$DoubleQuote" pathtogeotif="$QUOTE"$PrivatePath"$QUOTE" style="$DoubleQuote"display:none"$DoubleQuote" emprise="$QUOTE"$TheEmprise"$QUOTE" id="$DoubleQuote"$TheAddLayerMachineName"$DoubleQuote">$ShortTifName</div>" >> tmp/NewLayers/temp_layers_div_elements.txt

# Answer from menu line 45
if [ -f tmp/NewLayers/JSWorkspace ]
then
JSWorkspace=$(cat tmp/NewLayers/JSWorkspace)
else
JSWorkspace=$(echo "$TheWorkspace")
fi
ToReplacePath=$(echo pathtogeotif=\"$PrivatePath\"|sed 's/\//\\\//g')

echo $purple $TorReplacePath $The_LayerMachineName

echo "---> Genrating the javascript file"
# MachineNameMap_maindiv
cat ModelJS_Emprise.txt | sed "s/MachineNameMap/$The_LayerMachineName/g" | sed "s/HumanReadable_Name/$HumanReadableName/g" | sed "s/WokspaceLayerName/$JSWorkspace:$TheGeoserverFileName/g" | sed "s/TO_REPLACE_WITH_WKT/$TheEmprise/g" | sed "s/SOURCE_LAYER_CLASS/$TheWorkspace/g"| sed "s/PATH_2_GEOTIF/$ToReplacePath/g" >> tmp/NewLayers/TMPJS.js

echo  "var $The_LayerMachineName = new OpenLayers.LonLat($The_CentroidPlanche)
    if (mapbounds.containsLonLat($The_LayerMachineName)) {
        \$(\"#add_$The_LayerMachineName\").show();" >> tmp/NewLayers/HidendSeekTMP.js
echo  "} else { \$(\"#add_$The_LayerMachineName\").hide(); }" >> tmp/NewLayers/HidendSeekTMP.js







done
S40_Body=$(cat tmp/NewLayers/TheCureentNodeBody.csv|tr -d '\n')

echo "$newlayersIDs|$S2_nodetitle|$S3_field_deptf_seine|$S4_OldNum|$S17_WKT|$S19_Original_RawMapName|$THELAYERSONELINETIFF|$S40_Body|$S68_SourcePNG|$S65_The_zips_sources|$S35_NordOuestBasic|$S36_SudOuestBasic|$S37_SudEstBasic|$S38_NordEstBasic|$S27_NordOuestBasic2571|$S28_SudOuestBasic2571|$S29_SudEstBasic2571|$S30_NordEstBasic2571|$S31_NordOuestBasic4326|$S32_SudOuestBasic4326|$S33_SudEstBasic4326|$S34_NordEstBasic4326" >> tmp/NewLayers/Import2.csv.TMP
rm tmp/NewLayers/TheCureentNodeBody.csv
done

echo "S23_NodeID|S2_nodetitle|S3_field_deptf_seine|S4_OldNum|S17_WKT|S19_Original_RawMapName|S18_Original_Tiff_Sources|S40_Body|S68_SourcePNG|S65_The_zips_sources|S35_NordOuestBasic|S36_SudOuestBasic|S37_SudEstBasic|S38_NordEstBasic| S27_NordOuestBasic2571|S28_SudOuestBasic2571|S29_SudEstBasic2571|S30_NordEstBasic2571|S31_NordOuestBasic4326|S32_SudOuestBasic4326|S33_SudEstBasic4326|S34_NordEstBasic4326" > tmp/NewLayers/Import2.csv
cat tmp/NewLayers/Import2.csv.TMP >> tmp/NewLayers/Import2.csv
cp tmp/NewLayers/Import2.csv ../_2IMPORT.CSV
cat tmp/NewLayers/HidendSeekTMP.js >> tmp/NewLayers/HidendSeek.js
echo '
});
});' >> tmp/NewLayers/HidendSeek.js


cat ModelJS_HideNSeek_END.txt >> tmp/NewLayers/HidendSeek.js


