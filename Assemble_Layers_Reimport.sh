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
parentdir="$(dirname "$dir")"
mkdir -p tmp ../_Output_3857 ../_Output_CSVs ../_DONE/ ../_Output_PNG_Preview ../_Output_wld_zip/ ../_TRASH_TEMP
if [ -f tmp/HidendSeek.js ]
then
rm tmp/HidendSeek.js
fi
if [ -f tmp/HidendSeekTMP.js ]
then
rm tmp/HidendSeekTMP.js
fi
if [ -f tmp/JSWorkspace ]
then
rm tmp/JSWorkspace
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
echo "$JSWorkspace" > tmp/JSWorkspace
else
JSWorkspace=$(echo "$TheWorkspace")
fi

echo "${white}---> $JSWorkspace will be used to print javascript and will have to be use as Workspace ${orange}$JSWorkspace in geoserver"








echo 'jQuery(document).ready(function($) {

map.openlayers.events.register("moveend", map, function(){
    var mapbounds = map.openlayers.getExtent();
    bbox = mapbounds.toArray();
    var bleft = bbox[0];
    var bbottom = bbox[1];
    var bright = bbox[2];
    var btop = bbox[3];
    ' > tmp/HidendSeek.js


if [ -f tmp/temp_layers_div_elements.txt ]
then
rm tmp/temp_layers_div_elements.txt
fi
if [ -f tmp/TMPJS.js ]
then
rm tmp/TMPJS.js
fi
mkdir -p tmp
#cp temp.txt tmp/out.txt
cat tmp/WFS_Assemblage.txt | tr -d '\n'| tr -d '\r' | sed 's/","title":"/\
","title":"/g' > tmp/out.txt

if [ -f tmp/LastimportsTMP.csv ]
then
rm tmp/LastimportsTMP.csv
fi

if [ -d tmp/NewImport ]
then
rm -R tmp/NewImport
fi
mkdir -p tmp/NewImport
# The hard path in the unix file system of the geotiff
filepathTIFFolder=$(cat tmp/out.txt |tr -d '\n' |awk -F'"field_raw_map_epsg_3857"' '{print $2}'| awk -F'}]},"' '{print $1}'|awk -F'\:"private' '{print $2}'|awk -F'/' '{print $3}'|awk -F'\' '{print $1}'|awk '{print $0}')
filepathTIF=$(echo /private_file/"$filepathTIFFolder")
# The HTML private path of the png
DownloadHTML_TIF_Path=$(echo /system/files/"$filepathTIFFolder")
# The hard path in the unix file system of the png preview
filepathPNG=$(echo "$filepathTIF"_png_preview)
# The HTML private path to download the tiffs
# The HTML private path of the png
HTMLprview_png=$(echo /system/files/"$filepathPNG")

IFS=$'\n'       # Processing ful line (ignoring spaces)
set -f          # disable globbing
for TheLine in $(cat tmp/out.txt|sed '1d')
do



# to keep as is

TheNodeID=$(echo "$TheLine"| awk -F',"nid":"' '{print $2}'| awk -F'"' '{print $1}')
echo "${orange}---> The Current node ID $TheNodeID"
nodetitle=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $2}')
field_deptf_seine=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|'  ../_First_import_Planches.csv | awk -F'|' '{print $3}')
OldNum=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $4}')
TheTiffs=$(echo "$TheLine" |awk -F'"field_raw_map_epsg_3857"' '{print $2}'| awk -F'}]},"' '{print $1}'|sed 's/"uri"/\
/g'|awk -F'","filemime"' '{print $1}'|awk '/private:/'|awk '{print $NF}' FS=/ |awk -v 'filepathTIF'="$filepathTIF" '{print 'filepathTIF'"/"$0}'| tr '\n' '@'|sed 's/\@$//')

top_left27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $5}')
bottom_left27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $6}')
bottom_right27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $7}')
top_right27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $8}')

top_left=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $9}')
bottom_left=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $10}')
bottom_right=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $11}')
top_right=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $12}')

top_left4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $13}')
bottom_left4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $14}')
bottom_right4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $15}')
top_right4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $16}')

OriginalFilename=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $1}')

YearMap=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $22}')
The_PNG_PRVIEW=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $21}')

TheHTTPTiffs=$(echo "$TheTiffs" | sed 's/private_file/system\/files/g')

# To explode and keep as is (both) for the download description (the default button going with the default private file)
TheTiffsDescription=$(echo "$TheLine"  |awk -F'"field_raw_map_epsg_3857"' '{print $2}'| awk -F'}]},"' '{print $1}'|sed 's/"description":"/\
"description":"/g'|awk '/"description":"/'|awk -F'"},{' '{print $1}'|sed 's/"description":"//g'|sed 's/\"$//'| tr '\n' '@'|sed 's/\@$//'|sed 's/\\u200a/ /g' |sed 's/\\u00e8/è/g' |sed 's/\\u00d7/X/g'|sed 's/\\u2013/-/g'|sed 's/  / /g'|sed 's/\\//g' )

# File ID Based on string Name 25-50-union BHVP - 1988 - IDC - 16345
FileDescID=$(echo "$TheTiffsDescription" |tr '@' '\n' | awk -F' X' '{print $1}' ) #| sed 's/ /\&nbsp;/g'

Thezip=$(echo "$TheLine"  |awk -F'"field_zip_wld"' '{print $2}'| awk -F'}]},"' '{print $1}'|sed 's/"description":"/\
"description":"/g')

Thezipsize=$(echo "$TheLine"  |awk -F'"field_zip_wld"' '{print $2}'| awk -F'}]},"' '{print $1}'|sed 's/"filesize":"/\
"filesize":"/g' |awk '/filesize/')


if [ -d tmp/Multifields ]
then
rm -R tmp/Multifields
fi
mkdir -p tmp/Multifields

Tiffs_name=$(echo "$TheLine" |awk -F'"field_raw_map_epsg_3857"' '{print $2}'| awk -F'}]},"' '{print $1}'|sed 's/"uri"/\
/g'|awk -F'","filemime"' '{print $1}'|awk '/private:/'|awk '{print $NF}' FS=/|awk '{print "planche"$0}'| tr '\n' '@'|sed 's/\@$//')
LayerMachineName=$(echo "$Tiffs_name" |tr '-' '_' | awk '{print tolower($0)}'| sed 's/.tif//g'|tr ' ' '_')
echo Tiffs_name $red $Tiffs_name


# 27561
echo "$top_left27561" |tr '@' '\n' >> tmp/Multifields/top_left27561
echo "$bottom_left27561" |tr '@' '\n' >> tmp/Multifields/bottom_left27561
echo "$bottom_right27561" |tr '@' '\n' >> tmp/Multifields/bottom_right27561
echo "$top_right27561" |tr '@' '\n' >> tmp/Multifields/top_right27561
#3857
echo "$top_left" |tr '@' '\n' >> tmp/Multifields/top_left
echo "$bottom_left" |tr '@' '\n' >> tmp/Multifields/bottom_left
echo "$bottom_right" |tr '@' '\n' >> tmp/Multifields/bottom_right
echo "$top_right" |tr '@' '\n' >> tmp/Multifields/top_right
#4326
echo "$top_left4326" |tr '@' '\n' >> tmp/Multifields/top_left4326
echo "$bottom_left4326" |tr '@' '\n' >> tmp/Multifields/bottom_left4326
echo "$bottom_right4326" |tr '@' '\n' >> tmp/Multifields/bottom_right4326
echo "$top_right4326" |tr '@' '\n' >> tmp/Multifields/top_right4326

# PNG Link
echo "$TheLine" | awk -F'"field_img_small_map":{' '{print $2}'|awk -F'"}]},"' '{print $1}'| sed 's/private:\\\/\\\//\
/g'|awk -F'"' '{print "/system/files/"$1}' | sed 's/\\\//\//g' |awk '/.png/' >> tmp/Multifields/The_PNG_PRVIEW


# Zip Link

ThezipFileSize=$(echo "$Thezipsize"|awk -F'filesize":"' '{print $2}'|awk -F'"' '{print $1}'| awk '{ total = $1 / 1000000 ; print total }')

echo "$TheLine" | awk -F'"field_zip_wld":{' '{print $2}'|awk -F'"}]},"' '{print $1}'| sed 's/private:\\\/\\\//\
/g'|awk -F'"' '{print "/system/files/"$1}' | sed 's/\\\//\//g' |awk '/.zip/' >> tmp/Multifields/The_ZIPs_Files


ZipSizeRounded=$(printf "%.2f \n" $ThezipFileSize)


#ThePrivate

echo "$FileDescID" >> tmp/Multifields/FileDescID
echo "$TheTiffsDescription" |tr '@' '\n' >> tmp/Multifields/TheTiffsDescription
echo "$TheHTTPTiffs"  |tr '@' '\n' >> tmp/Multifields/TheHTTPTiffs

echo "$LayerMachineName" |tr '@' '\n' >> tmp/Multifields/LayerMachineName
echo "$LayerMachineName" |tr '@' '\n'|awk '{print "add_"$0}' >> tmp/Multifields/addLayerMachineName
echo "$LayerMachineName" |tr '@' '\n'|awk '{print "set_center_"$0}' >> tmp/Multifields/set_center_LayerMachineName
echo "$LayerMachineName" |tr '@' '\n' |awk '{print $0"_rm"}' >> tmp/Multifields/LayerMachineName_rm


#
# OriginalFilename
#
echo "$OriginalFilename" |tr '@' '\n' >> tmp/Multifields/OriginalFilename

echo "$ZipSizeRounded" |tr '@' '\n' | awk '{print "Zip .jpg + .wld + .prj - "$0" MO"}' >> tmp/Multifields/zip_name
echo "$zip_popover" |tr '@' '\n' >> tmp/Multifields/zip_popover


FilesDates=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $39}')
echo "$FilesDates" |tr '@' '\n' >> tmp/Multifields/FilesDates
awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $25}'|tr '@' '\n' >> tmp/Multifields/TheWorkspace
awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $25}'| awk '{print tolower($0)}'|tr '@' '\n' >> tmp/Multifields/TheWorkspaceClassJsCss

awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv  | awk -F'|' '{print $26}'|tr '@' '\n' >> tmp/Multifields/The_zips_sources
awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv  | awk -F'|' '{print $41}'|tr '@' '\n' >> tmp/Multifields/HumanReadableName
awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv  | awk -F'|' '{print $40}'|tr '@' '\n' >> tmp/Multifields/CentroidPlanche
awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv  | awk -F'|' '{print $21}'|tr '@' '\n' >> tmp/Multifields/SourcePNG


echo "$YearMap" |tr '@' '\n' >> tmp/Multifields/YearMap
TheDefinitiveFileHardpath="$TheTiffs"
echo "$TheDefinitiveFileHardpath" |tr '@' '\n' >> tmp/Multifields/TheDefinitiveFileHardpath
paste -d "|" tmp/Multifields/YearMap tmp/Multifields/FileDescID tmp/Multifields/TheTiffsDescription tmp/Multifields/TheHTTPTiffs tmp/Multifields/LayerMachineName tmp/Multifields/addLayerMachineName tmp/Multifields/set_center_LayerMachineName tmp/Multifields/LayerMachineName_rm tmp/Multifields/zip_name tmp/Multifields/zip_popover tmp/Multifields/top_left27561 tmp/Multifields/bottom_left27561 tmp/Multifields/bottom_right27561 tmp/Multifields/top_right27561 tmp/Multifields/top_left tmp/Multifields/bottom_left tmp/Multifields/bottom_right tmp/Multifields/top_right tmp/Multifields/top_left4326 tmp/Multifields/bottom_left4326 tmp/Multifields/bottom_right4326 tmp/Multifields/top_right4326 tmp/Multifields/The_PNG_PRVIEW tmp/Multifields/The_ZIPs_Files tmp/Multifields/FilesDates tmp/Multifields/TheDefinitiveFileHardpath tmp/Multifields/TheWorkspace tmp/Multifields/TheWorkspaceClassJsCss tmp/Multifields/OriginalFilename tmp/Multifields/The_zips_sources tmp/Multifields/HumanReadableName tmp/Multifields/CentroidPlanche tmp/Multifields/SourcePNG > tmp/buttonLinks

if [ -f tmp/NodeID_PlanchesOutput ]
then
rm tmp/NodeID_PlanchesOutput
fi
if [ -f tmp/NodeID_PlanchesOutputOrdere ]
then
rm tmp/NodeID_PlanchesOutputOrdere
fi
echo "${white}----------------INSIDE THE SUBSTRING------------------------"

##
### INSIDE THE SUBSTRING
##
#
# Round up and order by year
IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
for TheSubstring in $(cat tmp/buttonLinks)
do
echo "$TheSubstring" >> tmp/NodeID_PlanchesOutput
echo "$TheSubstring" |awk -F'|' '{print $1}'
done
# Make Button from substring year ordered
cat tmp/NodeID_PlanchesOutput | sort -n -t'|' -k1 > tmp/NodeID_PlanchesOutputOrdered

if [ -f tmp/buttons.csv ]
then
rm tmp/buttons.csv
fi

IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
for SUbstringOrdered in $(cat tmp/NodeID_PlanchesOutputOrdered)
do
TheYear=$(echo "$SUbstringOrdered" |awk -F'|' '{print $1}')
ShortTitleHeader=$(echo "$SUbstringOrdered" |awk -F'|' '{print $2}'|awk -F' - ' '{print $1, $2}' )
ShortTifName=$(echo "$SUbstringOrdered" |awk -F'|' '{print $3}' | awk -F' - ' '{print $1, $2, $4, $5}')
TheHTTPTiffsLink=$(echo "$SUbstringOrdered" |awk -F'|' '{print $4}')
TiffTooltip=$(echo "$SUbstringOrdered" |awk -F'|' '{print $3}')
HumanReadableName=$(echo "$SUbstringOrdered" |awk -F'|' '{print $31}')
ThePngPreview=$(echo "$TheHTTPTiffsLink" |sed 's/Raw_map_EPSG_3857/Raw_map_EPSG_3857_png_preview/g'|sed 's/\.tif/\.png/g')
TheEmprise=$(echo "$SUbstringOrdered" |awk -F'|' '{print "GEOMETRYCOLLECTION(POLYGON(("$15, $16, $17, $18, $15")))"}' OFS=', ')
TheWorkspace=$(echo "$SUbstringOrdered" |awk -F'|' '{print $27}')
TheWorkspaceClassJsCss=$(echo "$SUbstringOrdered" |awk -F'|' '{print $28}')
TheOriginalFilename=$(echo "$SUbstringOrdered" |awk -F'|' '{print $29}')
TheGeoserverFileName=$(echo  "$TheOriginalFilename" | sed 's/\.tif//g'|sed "s/'/\\'/g")
The_LayerMachineName=$(echo "$SUbstringOrdered" |awk -F'|' '{print $5}')
TheLayerMachineName_rm=$(echo "$SUbstringOrdered" |awk -F'|' '{print $8}')
TheAddLayerMachineName=$(echo "$SUbstringOrdered" |awk -F'|' '{print $6}')
Thetop_left4326=$(echo "$SUbstringOrdered" | awk -F'|' '{print $19}')
Thebottom_left4326=$(echo "$SUbstringOrdered" | awk -F'|' '{print $20}')
Thebottom_right4326=$(echo "$SUbstringOrdered" | awk -F'|' '{print $21}')
Thetop_right4326=$(echo "$SUbstringOrdered" | awk -F'|' '{print $22}')
Thetop_left27561=$(echo "$SUbstringOrdered" | awk -F'|' '{print $11}')
Thebottom_left27561=$(echo "$SUbstringOrdered" | awk -F'|' '{print $12}')
Thebottom_right27561=$(echo "$SUbstringOrdered" | awk -F'|' '{print $13}')
Thetop_right27561=$(echo "$SUbstringOrdered" | awk -F'|' '{print $14}')
Thetop_left=$(echo "$SUbstringOrdered" | awk -F'|' '{print $15}')
Thebottom_left=$(echo "$SUbstringOrdered" | awk -F'|' '{print $16}')
Thebottom_right=$(echo "$SUbstringOrdered" | awk -F'|' '{print $17}')
Thetop_right=$(echo "$SUbstringOrdered" | awk -F'|' '{print $18}')
TheZipNameShort=$(echo "$SUbstringOrdered" |awk -F'|' '{print $9}')
The_fullname=$(echo "$SUbstringOrdered" |awk -F'|' '{print $3}'|awk -F'","' '{print $1"</br> GeoTiff - WGS 84 - Tagged"}')
The_fullnameexerpforTheZipNameTooltip=$(echo "$The_fullname"|awk -F'pouce' '{print $1"pouce"}')
TheZipNameTooltip=$(echo "$The_fullnameexerpforTheZipNameTooltip     <br> $TheZipNameShort" )
The_CentroidPlanche=$(echo "$SUbstringOrdered" | awk -F'|' '{print $32}')

TheZipLink=$(echo "$SUbstringOrdered" |awk -F'|' '{print $24}')
PrivatePath=$(echo "$SUbstringOrdered" |awk -F'|' '{print $26}')

echo $lightblue $The_fullname

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
</div>" |tr -d '\n' >> tmp/buttons.csv

echo "
$white# JavScript and Html Element
# Make Hide and Seek
# Dynamic Layers (with map info)
# Make jquey
"

echo "<div class="$DoubleQuote"list-group-item $TheWorkspaceClassJsCss add-layer"$DoubleQuote" year="$DoubleQuote"$TheYear"$DoubleQuote" pathtogeotif="$QUOTE"$PrivatePath"$QUOTE" style="$DoubleQuote"display:none"$DoubleQuote" emprise="$QUOTE"$TheEmprise"$QUOTE" id="$DoubleQuote"$TheAddLayerMachineName"$DoubleQuote">$ShortTifName</div>" >> tmp/temp_layers_div_elements.txt

# Answer from menu line 45
if [ -f tmp/JSWorkspace ]
then
JSWorkspace=$(cat tmp/JSWorkspace)
else
JSWorkspace=$(echo "$TheWorkspace")
fi
ToReplacePath=$(echo pathtogeotif=\"$PrivatePath\"|sed 's/\//\\\//g')

echo $purple $TorReplacePath $The_LayerMachineName

echo "---> Genrating the javascript file"
# MachineNameMap_maindiv
cat ModelJS_Emprise.txt | sed "s/MachineNameMap/$The_LayerMachineName/g" | sed "s/HumanReadable_Name/$HumanReadableName/g" | sed "s/WokspaceLayerName/$JSWorkspace:$TheGeoserverFileName/g" | sed "s/TO_REPLACE_WITH_WKT/$TheEmprise/g" | sed "s/SOURCE_LAYER_CLASS/$TheWorkspace/g"| sed "s/PATH_2_GEOTIF/$ToReplacePath/g" >> tmp/TMPJS.js

echo  "var $The_LayerMachineName = new OpenLayers.LonLat($The_CentroidPlanche)
    if (mapbounds.containsLonLat($The_LayerMachineName)) {
        \$(\"#add_$The_LayerMachineName\").show();" >> tmp/HidendSeekTMP.js
echo  "} else { \$(\"#add_$The_LayerMachineName\").hide(); }" >> tmp/HidendSeekTMP.js

#        var position_MachineNameMap     = new OpenLayers.LonLat(SetMapCenter);
#        var zoom_MachineNameMap         = SetZoomLevel;
#$('#set_center_MachineNameMap').click(function () {
#                map.openlayers.setCenter(position_MachineNameMap, zoom_MachineNameMap);
#});

#<div class="btn btn-rectangle btn-xs map-area" data-toggle="tooltip" data-placement="bottom" data-original-title="Emprise"><span class="philicon philicon-Logo-header"></span><div class="position">GEOMETRYCOLLECTION(POLYGON((259188.747961425 6247314.53570392, 259188.855300666 6246402.03488965, 260250.282476199 6246402.09311567, 260250.290278547 6247314.59394335, 259188.747961425 6247314.53570392)))</div></div>



#echo "<div class=\"btn btn-dark btn-xs geometry Planche-selected\" data-toggle=\"popover\" title=\""$zip_name"\" data-placement=\"left\" data-content=\"HELLO THERE\"><div class=\"loc-wkt\"><div class=\"position\">$TheEmprise</div>Emprise</div></div>" >> tmp/buttons.csv
#echo "<div class=\"btn btn-dark btn-xs showlayer\" data-img=\"$ThePngPreview\" data-original-title=\""$ShortTitleHeader"\" data-toggle=\"popover\" layer=\"$TheAddLayerMachineName\">Voir</div>" >> tmp/buttons.csv
#echo "<div class=\"btn btn-dark btn-xs hidelayer\" layer=\"$TheLayerMachineName_rm\">Cacher</div>" >> tmp/buttons.csv
#echo "</div></div>" >> tmp/buttons.csv

done

##*
### END INSIDE THE SUBSTRING
##
echo "${green}-----------------END INSIDE THE SUBSTRING-----------------------"
echo "${white}---> Reorder from here with new path and new fields"

# tmp/Multifields/CentroidPlanche tmp/Multifields/SourcePNG



S68_SourcePNG=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $33}'|tr '\n' '@' |sed 's/\@$//')

S67_CentroidPlanche=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $32}'|tr '\n' '@' |sed 's/\@$//')
S66_HumanReadableName=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $31}'|tr '\n' '@' |sed 's/\@$//')
S65_The_zips_sources=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $30}'|tr '\n' '@' |sed 's/\@$//')

S64_TheWorkspaceClassJsCss=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $26}'|tr '\n' '@' |sed 's/\@$//')

S63_The_Definitive_private_Tifffile=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $26}'|tr '\n' '@' |sed 's/\@$//')

S62_The_File_Date_LAST_SAVED=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $25}'|tr '\n' '@' |sed 's/\@$//')

S61_png_system_link=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $23}'|tr '\n' '@' |sed 's/\@$//')
#4326 Emprise Map
S60_top_right_planches4326=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $22}'|tr '\n' '@' |sed 's/\@$//')
S59_bottom_right_planches4326=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $21}'|tr '\n' '@' |sed 's/\@$//')
S58_bottom_left_planches4326=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $20}'|tr '\n' '@' |sed 's/\@$//')
S57_top_left_planches4326=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $19}'|tr '\n' '@' |sed 's/\@$//')
#3857 Emprise Map
S56_top_right_planches3857=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $18}'|tr '\n' '@' |sed 's/\@$//')
S55_bottom_right_planches3857=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $17}'|tr '\n' '@' |sed 's/\@$//')
S54_bottom_left_planches3857=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $16}'|tr '\n' '@' |sed 's/\@$//')
S53_top_left_planches3857=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $15}'|tr '\n' '@' |sed 's/\@$//')
#27561 Emprise Map
S52_top_right_planches27561=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $14}'|tr '\n' '@' |sed 's/\@$//')
S51_bottom_right_planches27561=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $13}'|tr '\n' '@' |sed 's/\@$//')
S50_bottom_left_planches27561=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $12}'|tr '\n' '@' |sed 's/\@$//')
S49_top_left_planches27561=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $11}'|tr '\n' '@' |sed 's/\@$//')
#
S48_Zip_short_info=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $9}'|tr '\n' '@' |sed 's/\@$//')
S47_PlancheMachineNameRM=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $8}'|tr '\n' '@' |sed 's/\@$//')
S46_Set_center_PlancheMachineName=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $7}'|tr '\n' '@' |sed 's/\@$//')
S45_AddPlancheMachineName=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $6}'|tr '\n' '@' |sed 's/\@$//')
S44_PlancheMachineName=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $5}'|tr '\n' '@' |sed 's/\@$//')
#
S43_TheHttpFileSystemLink=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $4}'|tr '\n' '@' |sed 's/\@$//')
#
S42_ShorNameID=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $2}'|tr '\n' '@' |sed 's/\@$//')
#
S41_Tiff_FilesHardPath=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $26}'|tr '\n' '@' |sed 's/\@$//')
S40_Body=$(cat tmp/buttons.csv)

###





S39_LastModified_GeoTiff=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $25}'|tr '\n' '@' |sed 's/\@$//')
S38_NordEstBasic=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $38}')
S37_SudEstBasic=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $37}')
S36_SudOuestBasic=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $36}')
S35_NordOuestBasic=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $35}')
S34_NordEstBasic4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $34}')
S33_SudEstBasic4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $33}')
S32_SudOuestBasic4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $32}')
S31_NordOuestBasic4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $31}')
S30_NordEstBasic2571=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $30}')
S29_SudEstBasic2571=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $29}')
S28_SudOuestBasic2571=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $28}')
S27_NordOuestBasic2571=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $27}')
S26_Zip_FilesINPlace=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $24}'|tr '\n' '@' |sed 's/\@$//')
S25_Workspace=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $25}')
S24_WKT_Map_Extent=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $24}'|tr '\n' '@' |sed 's/\@$//')
S23_NodeID=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $23}')
S22_Year=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $22}'|tr '\n' '@' |sed 's/\@$//')
S21_Original_PreviewPNGLocation=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $21}'|tr '\n' '@' |sed 's/\@$//')
S20_Original_StorageLocation=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $20}')
S19_Original_RawMapName=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $19}'|tr '\n' '@' |sed 's/\@$//')
S18_Original_Tiff_Sources=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $18}'|tr '\n' '@' |sed 's/\@$//')
S17_WKT=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $17}')
S16_top_right4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $16}'|tr '\n' '@' |sed 's/\@$//')
S15_bottom_right4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $15}'|tr '\n' '@' |sed 's/\@$//')
S14_bottom_left4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $14}'|tr '\n' '@' |sed 's/\@$//')
S13_top_left4326=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $13}'|tr '\n' '@' |sed 's/\@$//')
S12_top_right=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $12}'|tr '\n' '@' |sed 's/\@$//')
S11_bottom_right=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $11}'|tr '\n' '@' |sed 's/\@$//')
S10_bottom_left=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $10}'|tr '\n' '@' |sed 's/\@$//')
S9_top_left=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $9}'|tr '\n' '@' |sed 's/\@$//')
S8_top_right27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $8}'|tr '\n' '@' |sed 's/\@$//')
S7_bottom_right27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $7}'|tr '\n' '@' |sed 's/\@$//')
S6_bottom_left27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $6}'|tr '\n' '@' |sed 's/\@$//')
S5_top_left27561=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $5}'|tr '\n' '@' |sed 's/\@$//')
S4_OldNum=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $4}')
S3_field_deptf_seine=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $3}')
S2_nodetitle=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' ../_First_import_Planches.csv | awk -F'|' '{print $2}')
S1_Original_Filename=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $29}'|tr '\n' '@' |sed 's/\@$//')


echo "$S1_Original_Filename|$S2_nodetitle|$S3_field_deptf_seine|$S4_OldNum|$S5_top_left27561|$S6_bottom_left27561|$S7_bottom_right27561|$S8_top_right27561|$S9_top_left|$S10_bottom_left|$S11_bottom_right|$S12_top_right|$S13_top_left4326|$S14_bottom_left4326|$S15_bottom_right4326|$S16_top_right4326|$S17_WKT|$S18_Original_Tiff_Sources|$S19_Original_RawMapName|$S20_Original_StorageLocation|$S21_Original_PreviewPNGLocation|$S22_Year|$S23_NodeID|$S24_WKT_Map_Extent|$S25_Workspace|$S26_Zip_FilesINPlace|$S27_NordOuestBasic2571|$S28_SudOuestBasic2571|$S29_SudEstBasic2571|$S30_NordEstBasic2571|$S31_NordOuestBasic4326|$S32_SudOuestBasic4326|$S33_SudEstBasic4326|$S34_NordEstBasic4326|$S35_NordOuestBasic|$S36_SudOuestBasic|$S37_SudEstBasic|$S38_NordEstBasic|$S39_LastModified_GeoTiff|$S40_Body|$S41_Tiff_FilesHardPath|$S42_ShorNameID|$S43_TheHttpFileSystemLink|$S44_PlancheMachineName|$S45_AddPlancheMachineName|$S46_Set_center_PlancheMachineName|$S47_PlancheMachineNameRM|$S48_Zip_short_info|$S49_top_left_planches27561|$S50_bottom_left_planches27561|$S51_bottom_right_planches27561|$S52_top_right_planches27561|$S53_top_left_planches3857|$S54_bottom_left_planches3857|$S55_bottom_right_planches3857|$S56_top_right_planches3857|$S57_top_left_planches4326|$S58_bottom_left_planches4326|$S59_bottom_right_planches4326|$S60_top_right_planches4326|$S61_png_system_link|$S62_The_File_Date_LAST_SAVED|$S63_The_Definitive_private_Tifffile|$S65_The_zips_sources|$S66_HumanReadableName|$S67_CentroidPlanche|$S68_SourcePNG" >> tmp/LastimportsTMP.csv


#S68_SourcePNG=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $33}'|tr '\n' '@' |sed 's/\@$//')
#
#S67_CentroidPlanche=$(cat tmp/NodeID_PlanchesOutputOrdered | awk -F'|' '{print $32}'|tr '\n' '@' |sed 's/\@$//')


#echo "$S45_AddPlancheMachineName|$S46_Set_center_PlancheMachineName|$S46_Set_center_PlancheMachineName|$S47_PlancheMachineNameRM|$S43_TheHttpFileSystemLink|$TheWorkspaceClassJsCss|$S25_Workspace"

#<div class="list-group-item add-layer" style="display:none" id="add_plancheimage_bernier_claude_louis_plan_de_lancien_cimetiere_des_innocents_actuelles_rue_saint_denis_rue_berger_ru_329040">Bernier Claude-louis plan de lancien cimetiere des innocents</div>

#if [ -d tmp/splitted ]
#then
#rm tmp/splitted
#fi
#IFS=$'\n'       # Processing ful line (ignoring spaces)
#set -f          # disable globbing
#for the_planches_elements in $(echo "$S45_AddPlancheMachineName")
#do
#PlanchesMachineNames=$(echo "$S45_AddPlancheMachineName"|tr '@' '\n'|sed 's/\@$//')
#center_PlanchesMachineName=$(echo "$S46_Set_center_PlancheMachineName"|tr '@' '\n'|sed 's/\@$//')
#echo "$orange $PlanchesMachineNames $center_PlanchesMachineName"
#done



#read -p "Wait here"
done


echo "S1_Original_Filename|S2_nodetitle|S3_field_deptf_seine|S4_OldNum|S5_top_left27561|S6_bottom_left27561|S7_bottom_right27561|S8_top_right27561|S9_top_left|S10_bottom_left|S11_bottom_right|S12_top_right|S13_top_left4326|S14_bottom_left4326|S15_bottom_right4326|S16_top_right4326|S17_WKT|S18_Original_Tiff_Sources|S19_Original_RawMapName|S20_Original_StorageLocation|S21_Original_PreviewPNGLocation|S22_Year|S23_NodeID|S24_WKT_Map_Extent|S25_Workspace|S26_Zip_FilesINPlace|S27_NordOuestBasic2571|S28_SudOuestBasic2571|S29_SudEstBasic2571|S30_NordEstBasic2571|S31_NordOuestBasic4326|S32_SudOuestBasic4326|S33_SudEstBasic4326|S34_NordEstBasic4326|S35_NordOuestBasic|S36_SudOuestBasic|S37_SudEstBasic|S38_NordEstBasic|S39_LastModified_GeoTiff|S40_Body|S41_Tiff_FilesHardPath|S42_ShorNameID|S43_TheHttpFileSystemLink|S44_PlancheMachineName|S45_AddPlancheMachineName|S46_Set_center_PlancheMachineName|S47_PlancheMachineNameRM|S48_Zip_short_info|S49_top_left_planches27561|S50_bottom_left_planches27561|S51_bottom_right_planches27561|S52_top_right_planches27561|S53_top_left_planches3857|S54_bottom_left_planches3857|S55_bottom_right_planches3857|S56_top_right_planches3857|S57_top_left_planches4326|S58_bottom_left_planches4326|S59_bottom_right_planches4326|S60_top_right_planches4326|S61_png_system_link|S62_The_File_Date_LAST_SAVED|S63_The_Definitive_private_Tifffile|S65_The_zips_sources|S66_HumanReadableName|S67_CentroidPlanche|S68_SourcePNG" > tmp/_Lastimports.csv

cat tmp/LastimportsTMP.csv >> tmp/_Lastimports.csv
# | awk -F'|' '$18!=""'
#echo $green end export









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
echo "${white}---> The command shoult be : ${green}scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/WFS_Assemblage.txt "$dir"/tmp/WFS_Assemblage.txt"
echo "                                   : ${green}scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/WFS_Assemblage.json "$dir"/tmp/WFS_Assemblage.json"
scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/WFS_Assemblage.txt "$dir"/tmp/WFS_Assemblage.txt
scp -P "$Port_SCP" "$User_scp"@"$Server_SCP":/tmp/WFS_Assemblage.json "$dir"/tmp/WFS_Assemblage.json



# Compare imported and update






cat tmp/WFS_Assemblage.json|sed '1d; $d'| tr '\n' '@' | sed 's/  (object) array(/\
  (object) array(/g'|awk NF > tmp/WFS_Assemblage.jsonFlatten
if [ -f tmp/the_WFS_Updated.txt ]
then
rm tmp/the_WFS_Updated.txt
fi

IFS=$'\n'       # Processing full line (ignoring spaces)
set -f          # disable globbing
for ThelineFromJson in $(cat tmp/WFS_Assemblage.jsonFlatten)
do
TheNodeID=$(echo "$ThelineFromJson" | awk -F"'nid' => '" '{print $2}'|awk -F"',@" '{print $1}')
echo "${white}---> Dealing with the ${orange}$TheNodeID${white} NID"
TheCleanedBody=$(awk -F'|' -v 'TheNodeID'="$TheNodeID" '$23=='TheNodeID'' OFS='|' tmp/_Lastimports.csv | awk -F'|' '{print $40}'|sed 's/\"/IMADOUBLEQUOTE/g')
TheEmptyBody=$(echo "$ThelineFromJson"|sed "s/'body' => array(),@      'field_loc_planche'/THE_LONG_STRING_TO_REPLACE_WITH_THE_FULL_BODY/g")

srch="THE_LONG_STRING_TO_REPLACE_WITH_THE_FULL_BODY"
TheBodyAndTheWrappers=$(echo "'body' => array\(@        'und' => array\(@          array\(@            'value' => \"$TheCleanedBody\",@            'summary' => '',@            'format' => 'filtered_html',@          \),@        \),@      \),@      'field_loc_planche'")
echo "$TheEmptyBody" | awk -v 'srch'="$srch" -v 'repl'="$TheBodyAndTheWrappers" '{ sub('srch','repl',$0); print $0 }' >> tmp/the_WFS_Updated.txt
done
echo " array(" > tmp/_Button_import.json
cat tmp/the_WFS_Updated.txt |tr '@' '\n'|awk NF|sed 's/IMADOUBLEQUOTE/\\"/g' >> tmp/_Button_import.json
echo " )" >> tmp/_Button_import.json

cat tmp/HidendSeekTMP.js >> tmp/HidendSeek.js
echo '
});
});' >> tmp/HidendSeek.js

FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")

mkdir -p csvinfo/js
mkdir -p csvinfo/CSVs

cp tmp/HidendSeek.js csvinfo/js/"$FileDate"_HidendSeek.js
cp tmp/TMPJS.js csvinfo/js/"$FileDate"_TMPJS.js
cp tmp/temp_layers_div_elements.txt csvinfo/js/"$FileDate"_layers_div_elements.txt
cp ../Computed_Maps.csv csvinfo/CSVs/"$FileDate"_Computed_Maps.csv
cp tmp/WFS_Assemblage.json csvinfo/CSVs/"$FileDate"_WFS_Assemblage.json
cp tmp/WFS_Assemblage.txt csvinfo/CSVs/"$FileDate"_WFS_Assemblage.txt
cp tmp/_Lastimports.csv csvinfo/CSVs/"$FileDate"_Imports_2.csv
cp ../_First_import_Planches.csv csvinfo/CSVs/"$FileDate"_First_import_Planches_1.csv
zip -r ../_Output_CSVs/csvinfo_"$FileDate".zip csvinfo
mv csvinfo ../_TRASH_TEMP/csvinfo_"$FileDate"







#paste -d "|" tmp/tempHTMLTiff tmp/tempHTMLTiffsDescription tmp/TheHTTPTiffs tmp/LayerMachineName  tmp/zip_name > tmp/buttonLinks
##
#IFS=$'\n'       # Processing direcory
#set -f          # disable globbing
#
#for the_html_part_from_drush in $(cat tmp/buttonLinks)
#do
#echo '<div class="btn-group btn-group-xs layers-btn">' >> tmp/buttons.csv
#LayerMachineNameAddID=$(echo "$the_html_part_from_drush"| awk -F'|' '{print "add_"$4}')
#LayerMachineNameRM=$(echo "$the_html_part_from_drush"| awk -F'|' '{print $4"_rm"}')
#LayerMachineNamewkt=$(echo "<div class=\"btn btn-dark btn-xs geometry Planche-selected\" data-toggle=\"popover\" title=\"$zip_name\" data-placement=\"left\" data-content=\"HELLO THERE\"><div class=\"loc-wkt\"><div class=\"position\">GEOMETRYCOLLECTION(POLYGON((243725.637872661 6244713.24763165,243726.827256413 6244105.09098649,244636.372022804 6244106.8306876,244635.248395478 6244714.98758406,243725.637872661 6244713.24763165)))</div>Layer extent</div></div>" )
#
#ShowLayer=$(echo "<div class=\"btn btn-dark btn-xs showlayer\" layer=\"$LayerMachineNameAddID\" data-img=\"/system/files/Raw_map_EPSG_3857_png_preview/feuille-300-301_1908_1.png\" data-toggle=\"popover\" data-original-title=\"Popover Header\">Voir</div>")
#HideLayer=$(echo "<div class=\"btn btn-dark btn-xs hidelayer\" layer=\"$LayerMachineNameRM\">Cacher</div>")
#
#buttonTiffBegin=$(echo '<a class="btn btn-dark btn-xs download-tif" layer="geometry" href="' )
#DescritTiffDL=$(echo "$the_html_part_from_drush"| awk -F'|' '{print $2}')
#buttonTiffEnd=$(echo "\" data-toggle=\"tooltip\" data-original-title=\"$DescritTiffDL\">$DescritTiffDL <span class=\"glyphicon glyphicon-download-alt\"></span></a>" )
#echo "$echo red ShowLayer $ShowLayer"
#
##echo $LayerMachineName LayerMachineName
## The HTTPlink (tif or zip) begining excerp before the fileitself
##TheHTTPTiffsLink=$(echo "$DescritTiffDL" | sed 's/private_file/system\/files/g')
#
##buttonTiffEnd=$(echo '" data-toggle="tooltip" data-original-title="Télécharger Feuille-291_1964 - Size : 4743X7090 PX - 130 MO - GeoTiff"> 25-50 1988 4500X3200 300 p/p <span class="glyphicon glyphicon-download-alt"></span></a>' )
##echo "$LayerMachineNameAddID" >> tmp/buttons.csv
#echo "$LayerMachineNamewkt" >> tmp/buttons.csv
#echo "$ShowLayer" >> tmp/buttons.csv
#echo "$HideLayer" >> tmp/buttons.csv
#GeotifsDlFullButton=$(echo $the_html_part_from_drush| awk -F'|' -v 'buttonTiffBegin'="$buttonTiffBegin" -v 'buttonTiffEnd'="$buttonTiffEnd" '{print 'buttonTiffBegin'$3'buttonTiffEnd'}' >> tmp/buttons.csv)
#echo '</div>' >> tmp/buttons.csv
#done
#
##cat tmp/buttons.csv
#done
#
#
#
##<div class="col-md-6 geometry-wkt">
##<div class="tpl">
##<div class="loc-wkt">
##<div class="position">GEOMETRYCOLLECTION(POINT(266473.698822206 6255072.457850860))</div>
##<span class="glyphicon glyphicon-screenshot bottom-right" data-toggle="popover" data-placement="top" data-trigger="hover" title="" data-content="<div class='epsg-3857'>266473.698822206 6255072.457850860</div><div class='epsg-4326'>EPSG:4326 48.8832377597612 2.3937739646785</div><div class='epsg-27571'>EPSG:27561 604200.00 131424.00</div>" <="" span="" data-original-title="Top left EPSG:3857">
##</span></div>
##</div>
##<div class="tprght">
##<div class="loc-wkt">
##<div class="position">GEOMETRYCOLLECTION(POINT(267383.779455080 6255072.457850860))</div>
##<span class="glyphicon glyphicon-screenshot bottom-right" data-toggle="popover" data-placement="top" data-trigger="hover" title="" data-content="<div class='epsg-3857'>267383.779455080 6255072.457850860</div><div class='epsg-4326'>EPSG:4326 48.8832377597612 2.40194935810142</div><div class='epsg-27571'>EPSG:27561 604799.57 131424.48</div>" <="" span="" data-original-title="Top right EPSG:3857">
##</span></div>
##</div>
##
##<div class="Planche-selected highlight">
##<h5 class="planche-num">Planche 33-37</h5>
##
##
##<div class="loc-wkt"><div class="position">GEOMETRYCOLLECTION(POLYGON((266473.698822206 6255072.45785086,266473.129264869 6254311.33636611,267383.77945508 6254310.60138884,267384.431409615 6255071.72274156,266473.698822206 6255072.45785086)))</div></div>
##</div>
##<div class="btmlft">
##<div class="loc-wkt">
##<div class="position">GEOMETRYCOLLECTION(POINT(266473.129264869 6254311.336366110))</div>
##<span class="glyphicon glyphicon-screenshot bottom-right" data-toggle="popover" data-placement="top" data-trigger="hover" title="" data-content="<div class='epsg-3857'>266473.129264869 6254311.336366110</div><div class='epsg-4326'>EPSG:4326 48.878741398043 2.39376884825789</div><div class='epsg-27571'>EPSG:27561 604200.00 130924.00</div>" <="" span="" data-original-title="Bottom left EPSG:3857">
##</span></div>
##</div>
##<div class="btmrght">
##<div class="loc-wkt">
##<div class="position">GEOMETRYCOLLECTION(POINT(267383.779455080 6254310.601388840))</div>
##<span class="glyphicon glyphicon-screenshot bottom-right" data-toggle="popover" data-placement="top" data-trigger="hover" title="" data-content="<div class='epsg-3857'>267383.779455080 6254310.601388840</div><div class='epsg-4326'>EPSG:4326 48.8787370559341 2.40194935810142</div><div class='epsg-27571'>EPSG:27561 604800.00 130924.00</div>" <="" span="" data-original-title="Bottom right EPSG:3857">
##</span></div>
##</div>
##
##</div>
#
#
#
#
#
#
#
#
##
##Zip_info=$(ls -lah ../_Output_wld_zip/"$LastrenderNoExt".zip | awk '{print ".jpg .prj .wld zip "$5"O"}')
##
###|$Zip_info
#
#
#
#
#
##
##.download-tif {
##/* float: right; */
##width: 100%;
##}








#<div class="btn btn-dark btn-xs geometry corners">
#<div class="tpl">
#<div class="loc-wkt">
#<div class="position">GEOMETRYCOLLECTION(POINT(259188.747961425 6247314.53570392))</div>
#<span class="philicon-cible-UlLt" data-toggle="popover" data-placement="top" data-trigger="hover" title="Top left EPSG:3857" data-content="<div class='epsg-3857'>259188.747961425 6247314.53570392</div><div class='epsg-4326'>EPSG:4326 48.387, 2.3285</div><div class='epsg-27571'>EPSG:27561 600000, 126224</div>"</span>
#</div>
#</div>
#
#<div class="tprght">
#<div class="loc-wkt">
#<div class="position">GEOMETRYCOLLECTION(POINT(259188.747961425 6247314.53570392))</div>
#<span class="philicon-cible-UlLt" data-toggle="popover" data-placement="top" data-trigger="hover" title="Top left EPSG:3857" data-content="<div class='epsg-3857'>259188.747961425 6247314.53570392</div><div class='epsg-4326'>EPSG:4326 48.387, 2.3285</div><div class='epsg-27571'>EPSG:27561 600000, 126224</div>"</span>
#</div>
#</div>
#<div> class="coin">Corners</div>
#<div class="btmlft">
#<div class="loc-wkt">
#<div class="position">GEOMETRYCOLLECTION(POINT(259188.747961425 6247314.53570392))</div>
#<span class="philicon-cible-UlLt" data-toggle="popover" data-placement="top" data-trigger="hover" title="Top left EPSG:3857" data-content="<div class='epsg-3857'>259188.747961425 6247314.53570392</div><div class='epsg-4326'>EPSG:4326 48.387, 2.3285</div><div class='epsg-27571'>EPSG:27561 600000, 126224</div>"</span>
#</div>
#</div>
#
#<div class="btmrght">
#<div class="loc-wkt">
#<div class="position">GEOMETRYCOLLECTION(POINT(259188.747961425 6247314.53570392))</div>
#<span class="philicon-cible-UlLt" data-toggle="popover" data-placement="top" data-trigger="hover" title="Top left EPSG:3857" data-content="<div class='epsg-3857'>259188.747961425 6247314.53570392</div><div class='epsg-4326'>EPSG:4326 48.387, 2.3285</div><div class='epsg-27571'>EPSG:27561 600000, 126224</div>"</span>
#</div>
#</div>
#
#</div>
#
#
#
