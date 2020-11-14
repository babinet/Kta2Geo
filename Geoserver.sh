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
cd $dir



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
echo Post Geotif
fi

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
curl -v -u "$UserName":"$Password" -XPOST -H "Content-type: text/xml" -d "<workspace><name>"$Workspace"</name></workspace>" https://exemple.com/geoserver/rest/workspaces

fi


cd -
