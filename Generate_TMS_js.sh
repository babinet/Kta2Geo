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
if [ -f Server.cfg ]
then
ServerAddress=$(cat Server.cfg)
echo "${white}---> the actual server address is : ${orange}$ServerAddress"
else
echo "${white}---> Enter the Server Name e.g: ${orange}https://DeFourcy.com:8080/geoserver    <---${reset}"
read -p "Geoserver Address :${orange}" geoserveradress
echo "$geoserveradress" > Server.cfg
fi



echo "${white}---> Downloading the TMS list and address from Geoserver ../AllTMSLAyers.xml${reset}"
wget -O ../AllTMSLAyers.xml "$ServerAddress"/gwc/service/tms/1.0.0
echo "wget -O ../AllTMSLAyers.xml "$ServerAddress"/gwc/service/tms/1.0.0"
echo "${white}---> Filter with awk only the png layers ../AllTMSLAyers.xml${reset}"
cat ../AllTMSLAyers.xml | awk '/@png/' > ../AllPNGsLayers.txt

echo "${white}---> Execute the script ${orange}\"listGeoIGCAndGetBound.sh\"${white} in the root folder of geoserver on the remote machine"

read -p "${white}---> Drop the output file ${orange}\"Map_in_Geoserver.csv\"${white} in the current shel then press enter : ${orange}" LayerListTXT
echo "${orange}$LayerListTXT${reset}"

cat ../AllTMSLAyers.xml | awk -F'/gwc/service/tms/1.0.0/' '{print $2}' | awk -F'%3A' '{print $1}' | awk '!NF || !seen[$0]++'|awk NF
#echo "${white}---> scp ${orange}AllTiffinServer${white} file in the directory "$dir"" | sed 's/Kt2Geo//g'
echo "${white}---> Write the list of the workspaces you want from the list on top"
read -p "${white}---> Space separated. Exemple : ${orange}IDC IGN${white} in the current shel then press enter : ${orange}" workspacelist
echo "${orange}$workspacelist${reset}"

echo "$workspacelist" | sed 's/ /\/ \|\| \//g' |awk -v workspacelist="$workspacelist" '{print "echo "workspacelist" | awk '\''/"$0"/'\''\ ../AllPNGsLayers.txt > ../AllSelectedLayers.txt"}'  > run.sh
chmod +x run.sh
./run.sh

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
#echo $lineAllChoosenLayers
titlewhileread=$(echo $lineAllChoosenLayers | awk -F'title="' '{print $2}' | awk -F'"' '{print $1}')
#echo $titlewhileread
TheCsvLinewitGeoData=$(awk -v titlewhileread="$titlewhileread" -F'|' '$1==titlewhileread' "$LayerListTXT")
TitleHumanReadable=$(echo $titlewhileread | tr '_' ' ')
Center=$(echo $TheCsvLinewitGeoData | awk -F'|' '{print $8}')
machinename=$(echo $TheCsvLinewitGeoData | awk -F'|' '{print $9}'| awk '{print $1}')
zoom=18
WorspaceName=$(echo $lineAllChoosenLayers | awk -F'/tms/1.0.0/' '{print $2}' | awk -F'%' '{print $1}')
echo $machinename machinename $Center Center $titlewhileread titlewhileread $TitleHumanReadable TitleHumanReadable $WorspaceName WorspaceName
echo "---> Genrating the javascript file"

# jQuery(document).ready(function($) {

cat ModelJS.txt | sed "s/MachineNameMap/$machinename/g" | sed "s/HumanReadable_Name/$TitleHumanReadable/g" | sed "s/WokspaceLayerName/$WorspaceName:$titlewhileread/g" | sed "s/SetMapCenter/$Center/g" | sed "s/SetZoomLevel/18/g" >> ../TMPJS.js
echo "<div class=\"list-group-item add-layer\" style=\"display:none\" id=\"add_"$machinename"\">"$TitleHumanReadable"</div>" >> ../ListGroups.txt


echo  "var $machinename = new OpenLayers.LonLat($Center)
    if (mapbounds.containsLonLat($machinename)) {
        \$(\"#add_$machinename\").show();" >> HidendSeekTMP.js
echo  "} else { \$(\"#add_$machinename\").hide(); }" >> HidendSeekTMP.js

#HidendSeek


#echo "${bg_red}${white}---> Enter the Machine name of the layer in low cap eg. idc_hd.                  <---${reset}"
#read -p "${white}MachineNameMap             : ${orange}" MachineNameMap
#echo "$MachineNameMap"
#
#echo "${bg_red}${white}---> Enter the HumanReadable_Name of the layer eg. Plans I.G.C Edition 1988.     <---${reset}"
#read -p "${white}HumanReadable_Name             : ${orange}" HumanReadable_Name
#echo "$HumanReadable_Name"
#
#echo "${bg_red}${white}---> Enter the Wokspace:LayerName of the layer eg. IDC:25-50.                    <---${reset}"
#read -p "${white}Wokspace:LayerName             : ${orange}" WokspaceLayerName
#echo "$WokspaceLayerName"
#
#echo "${bg_red}${white}---> Enter the SetMapCenter of the layer EPSG:3857 eg. IDC:25-50                 <---${reset}"
#read -p "${white}Long,Lat             : ${orange}" SetMapCenter
#echo "$SetMapCenter"
#
#echo "${bg_red}${white}---> Enter the SetZoomLevel of the layer eg. 17                                  <---${reset}"
#read -p "${white}SetZoomLevel             : ${orange}" SetZoomLevel
#echo "$SetZoomLevel"
#
#cat model.txt | sed "s/MachineNameMap/$MachineNameMap/g" | sed "s/HumanReadable_Name/$HumanReadable_Name/g" | sed "s/WokspaceLayerName/$WokspaceLayerName/g" | sed "s/SetMapCenter/$SetMapCenter/g" | sed "s/SetZoomLevel/$SetZoomLevel/g" > ../"$MachineNameMap".js
#
#echo "${white}---> Declare the JS in template"
#echo -e "
#${green}    drupal_add_js(drupal_get_path('theme', 'cdm') .'/js/production/add_layers/TMS/$MachineNameMap.js');"
#echo "
#${white}---> Declare the main div of the layer"
#echo -e "
#${green}           <div class=\"list-group-item add-layer\" id=\"add_$MachineNameMap\">$HumanReadable_Name</div>"









#$});


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
});' >> ../HidendSeek.js

#echo 'jQuery(document).ready(function($) {
#
cat ../TMPJS.js >> ../AllLayers.js
#echo '});
#});' >> ../AllLayers.js




cd - 2>&1 &>/dev/null
