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
cd "$dir" 2>&1 &>/dev/null

if [ -f ../AllSelectedLayers.txt ]
then
rm ../AllSelectedLayers.txt
fi


if [ -f TMSServer.cfg ]
then
TMSServerAddress=$(cat TMSServer.cfg)
echo "${white}---> the actual server address is : ${orange}$TMSServerAddress"
else
echo "${white}---> Enter the Server Name e.g: ${orange}https://DeFourcy.com/geoserver/gwc/service/${green}tms/    <---${reset}"
read -p "T.M.S Address :${orange}" tmsgeoserveradress
echo "$tmsgeoserveradress" | awk 'NF' > TMSServer.cfg
fi

read -p "${white}---> Drop the folder where the geotiff are stored in the current shell then press enter : ${orange}" Place2seek
echo "${orange}$Place2seek${reset}"
echo "$Place2seek" | awk 'NF' > Place2seek.cfg

read -p "${white}---> What is the file extension of the geotagged raster file : tif geotiff ? ${red}No Dot • ! ${orange}" extensiontif
echo "${orange}$extensiontif${reset}"
echo "$extensiontif" | awk 'NF' > extensiontif.cfg

read -p "${white}---> What is the name of the workspace in geoserver to fit the needs e.g : Workspace  ${orange}" workspace
echo "${orange}$extensiontif${reset}"
echo "$workspace" | awk 'NF' > workspace.cfg

./listGeoIGCAndGetBound.sh



#cat ../AllTMSLAyers.xml | awk -F'/gwc/service/tms/1.0.0/' '{print $2}' | awk -F'%3A' '{print $1}' | awk '!NF || !seen[$0]++'|awk NF
##echo "${white}---> scp ${orange}AllTiffinServer${white} file in the directory "$dir"" | sed 's/Kt2Geo//g'
#echo "${white}---> Write the list of the workspaces you want from the list on top"
#read -p "${white}---> Space separated. Exemple : ${orange}IDC IGN${white} in the current shel then press enter : ${orange}" workspacelist
#echo "${orange}$workspacelist${reset}"
#
#echo "$workspacelist" | sed 's/ /\/ \|\| \//g' |awk -v workspacelist="$workspacelist" '{print "echo "workspacelist" | awk '\''/"$0"/'\''\ ../AllPNGsLayers.txt > ../AllSelectedLayers.txt"}'  > run.sh
#chmod +x run.sh
#./run.sh

if [ -f ../TMPJS.js ]
then
rm ../TMPJS.js
fi
if [ -f HidendSeekTMP.js ]
then
rm HidendSeekTMP.js
fi
if [ -f ../ListGroups.txt ]
then
rm ../ListGroups.txt
fi
#LayerListTXT=Map_in_Geoserver.csv
while read lineAllChoosenLayers
do
titlewhileread=$(echo $lineAllChoosenLayers | awk -F'|' '{print $2}' | sed 's/.geotiff//g'| sed 's/.tif//g')
TitleHumanReadable=$(echo $lineAllChoosenLayers | awk -F'|' '{print $1}'| sed 's/-uninon_/ /g' | sed 's/_/ /g')
Center=$(echo $lineAllChoosenLayers | awk -F'|' '{print $8}')
machinename=$(echo $lineAllChoosenLayers | awk -F'|' '{print $9}'| sed 's/.geotiff//g'| sed 's/.tif//g' )
zoom=18
echo $machinename machinename $Center Center $titlewhileread titlewhileread $TitleHumanReadable TitleHumanReadable $workspace workspace
echo "---> Genrating the javascript file"


cat ModelJS.txt | sed "s/MachineNameMap/$machinename/g" | sed "s/HumanReadable_Name/$TitleHumanReadable/g" | sed "s/WokspaceLayerName/$workspace:$titlewhileread/g" | sed "s/SetMapCenter/$Center/g" | sed "s/SetZoomLevel/18/g" >> ../TMPJS.js
echo "<div class=\"list-group-item add-layer\" style=\"display:none\" id=\"add_"$machinename"\">"$TitleHumanReadable"</div>" >> ../ListGroups.txt


echo  "var $machinename = new OpenLayers.LonLat($Center)
    if (mapbounds.containsLonLat($machinename)) {
        \$(\"#add_$machinename\").show();" >> HidendSeekTMP.js
echo  "} else { \$(\"#add_$machinename\").hide(); }" >> HidendSeekTMP.js



done < ../AllSelectedLayers.txt

echo 'jQuery(document).ready(function($) {

map.openlayers.events.register("moveend", map, function(){
    var mapbounds = map.openlayers.getExtent();
    bbox = mapbounds.toArray();
    var bleft = bbox[0];
    var bbottom = bbox[1];
    var bright = bbox[2];
    var btop = bbox[3];
    ' > ../HidendSeek.js

cat HidendSeekTMP.js >> ../HidendSeek.js
echo '
});
});' >> ../HidendSeek.js

cat ../TMPJS.js


cd - 2>&1 &>/dev/null




# remove duplicate
# | awk '!NF || !seen[$0]++'
# Remove blank lines
#awk 'NF'
# Sort $3 with comma t, separator
#sort -t, -nk3
