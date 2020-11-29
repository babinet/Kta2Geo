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

Menu=('Post_Geotif' 'Create_Workspace' )

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



echo "${bg_red}${white}---> Drop the folder to upload. <---${reset}"
read -p "${white}---> (The folder where are stored the Geotif to upload) :" Folder2Upload
echo "${orange}$Folder2Upload ${reset}"
File2Upload=$(find "$Folder2Upload" -name "*.tif" | sed 's/\/\//\//g' | tr ' ' '\n' )
echo "$File2Upload" > listRest.txt
while read Geotif
do
FileNameSeul=$(echo "$Geotif" | awk -F'/' '{print $NF}' | sed 's/.tif//g')
echo "$Geotif"
echo "$FileNameSeul"
curl -u "$UserName":"$Password" -XPUT -H "Content-type:image/tiff" --data-binary @"$Geotif" https://sous-paris.com/geoserver/rest/workspaces/"$Workspace"/coveragestores/"$FileNameSeul"/file.geotiff
done < listRest.txt
cd - 2>&1 &>/dev/null
fi
echo $Geotif
if [ $item = Create_Workspace ]
then
echo "${white}---> Create a Workspace on Geoserver using REST <---${reset}"
echo "${bg_red}${white}---> Enter the Geoserver User Name. <---${reset}"
read UserName
echo "$UserName"

echo "${bg_red}${white}---> Enter "$UserName" password on Geoserver. <---${reset}"
read -s Password
echo "${orange}    ************* ${reset}"

echo "${bg_red}${white}---> Enter the name of the workspace <---${reset}."
read Workspace
echo "$Workspace"
curl -v -u "$UserName":"$Password" -XPOST -H "Content-type: text/xml" -d "<workspace><name>"$Workspace"</name></workspace>" https://sous-paris.com/geoserver/rest/workspaces

fi


cd - 2>&1 &>/dev/null
