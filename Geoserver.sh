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



menu_from_array ()
{

select item; do
# Check menu item number
if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];

then
echo "Running $item..."
break;
else
echo "${bg_red}${white}Erreur - Choisir parmis 1-$#${reset}"
fi
done
}

Menu=('Create_Workspace' 'Post_Geotif' 'Create_LayerGroup' )

menu_from_array "${Menu[@]}"

if [ $item = Post_Geotif ]
then
echo "${white}---> Post Geotif files on Geoserver using REST <---${reset}"
echo "${bg_red}${white}---> Enter the Geoserver User Name :  <---${reset}"
read UserName
echo "$UserName"

echo "${bg_red}${white}---> Enter "$UserName" password on Geoserver. <---${reset}"
read -s Password
echo "${orange}    ************* ${reset}"

echo "${bg_red}${white}---> Enter the name of the workspace <---${reset}."
read Workspace
echo "$Workspace"

#if [ -f LayerGroup.txt ]
#then
#rm LayerGroup.xml
#fi

File2Upload=$(find "$Folder2Upload" -name "*.tif" | sed 's/\/\//\//g' | tr ' ' '\n' )
echo "$File2Upload" > listRest.txt
while read Geotif
do
FileNameSeul=$(echo "$Geotif" | awk -F'/' '{print $NF}' | sed 's/.tif//g')
echo "${green}\$FileNameSeul                    ${orange}$FileNameSeul"
echo "${white}---> Uploading file ${orange}             "$Geotif"${reset}"
curl -u "$UserName":"$Password" -XPUT -H "Content-type:image/tiff" --data-binary @"$Geotif" https://sous-paris.com/geoserver/rest/workspaces/"$Workspace"/coveragestores/"$FileNameSeul"/file.geotiff

echo "    <layer>"$FileNameSeul"</layer>" >> "$Folder2Upload"/LayerGrouptemp.xml
echo "    <style>raster</style>" >> "$Folder2Upload"/StyleTemp.xml



done < listRest.txt

echo "<layerGroup>
  <name>LAYERGROUPNAME</name>
  <layers>" > "$Folder2Upload"/LayerGroup.xml
cat "$Folder2Upload"/LayerGrouptemp.xml >> "$Folder2Upload"/LayerGroup.xml
echo "  </layers>
  <styles>" >> "$Folder2Upload"/LayerGroup.xml
cat "$Folder2Upload"/StyleTemp.xml >> "$Folder2Upload"/LayerGroup.xml
echo "  </styles>
</layerGroup>
" >> "$Folder2Upload"/LayerGroup.xml
rm "$Folder2Upload"/LayerGrouptemp.xml "$Folder2Upload"/StyleTemp.xml
fi

cd - 2>&1 &>/dev/null

if [ $item = Create_Workspace ]
then

echo "${white}---> Create a Workspace on Geoserver using REST   <---${reset}"
echo "${bg_red}${white}---> Enter the Geoserver User Name.              <---${reset}"
read UserName
echo "$UserName"

echo "${bg_red}${white}---> Enter "$UserName" password on Geoserver.    <---${reset}"
read -s Password
echo "${orange}    ************* ${reset}"

echo "${bg_red}${white}---> Enter the name of the workspace <---${reset}."
read Workspace
echo "$Workspace"
curl -v -u "$UserName":"$Password" -XPOST -H "Content-type: text/xml" -d "<workspace><name>"$Workspace"</name></workspace>" https://sous-paris.com/geoserver/rest/workspaces
fi

if [ $item = Create_LayerGroup ]
then


echo "${white}---> Create a Layers Group on Geoserver using REST   <---${reset}"
echo "${bg_red}${white}---> Enter the Geoserver User Name.                  <---${reset}"
read UserName
echo "$UserName"

echo "${bg_red}${white}---> Enter "$UserName" password on Geoserver.             <---${reset}"
read -s Password
echo "${orange}    ************* ${reset}"


read -p "${white}---> Drop the .xml file into to the curent shell :" LayerGroupXML
echo "${orange}$LayerGroupXML ${reset}"

read -p "${white}---> Enter the name of the Layer Group:" LayerGroupName
echo "${orange}$LayerGroupXML${reset}"
sed "s/LAYERGROUPNAME/$LayerGroupName/g" "$LayerGroupXML" > "$LayerGroupXML"tmp"" && mv "$LayerGroupXML"tmp"" "$LayerGroupXML"

curl -u "$UserName":"$Password" -XPOST -d @"$LayerGroupXML" -H "Content-type: text/xml" https://sous-paris.com/geoserver/rest/layergroups


echo "---> In order to serve the created LayerGroup go to geoserver with you browser & choose -> Layer Groups / Select the new LayerGroup and parent it to the workspace that the LayerGroup depends"
fi

cd - 2>&1 &>/dev/null
