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
Menu=('Create_Workspace' 'Post_Geotif' 'Create_LayerGroup' 'Server_setup' )

menu_from_array "${Menu[@]}"

ServerAddress=$(cat "$dir"/Server.cfg)

if [ -f Server.cfg ]
then
echo "---> ${orange}WEB SERVER ADDRESS : ${green}$ServerAddress"
else
echo "${white}---> Enter the Server Name e.g: ${orange}https://DeFourcy.com:8080/geoserver    <---${reset}"
read -p "Enter Server :${orange}" ServerName
echo "                   ${white}$ServerName"
echo "$ServerName" > "$dir"/Server.cfg
fi


if [ $item = Server_setup ]
then
echo "${white}---> Enter the Server Name e.g: ${orange}https://DeFourcy.com:8080/geoserver    <---${reset}"
read -p "Enter Server :${orange}" ServerName
echo "                   ${white}$ServerName"
echo "$ServerName" > "$dir"/Server.cfg
fi



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

read -p "${white}---> Drop the 📁 Folder containing the GeoTiff to upload to Geoserver:" Folder2Upload
echo "${orange}$Folder2Upload ${reset}"

File2Upload=$(find "$Folder2Upload" -name "*.tif" | sed 's/\/\//\//g' | tr ' ' '\n' )
echo "$File2Upload" > listRest.txt
while read Geotif
do
FileNameSeul=$(echo "$Geotif" | awk -F'/' '{print $NF}' | sed 's/.tif//g')
echo "${white}
---> \$FileNameSeul                ${orange}$FileNameSeul"
echo "${white}---> Uploading file ${orange}             "$Geotif"${reset}"
curl -u "$UserName":"$Password" -XPUT -H "Content-type:image/tiff" --data-binary @"$Geotif" "$ServerAddress"/rest/workspaces/"$Workspace"/coveragestores/"$FileNameSeul"/file.geotiff

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
echo "${orange}        ************* ${reset}"

echo "${bg_red}${white}---> Enter the name of the workspace <---${reset}."
read Workspace
echo "$Workspace"
curl -u "$UserName":"$Password" -XPOST -H "Content-type: text/xml" -d "<workspace><name>"$Workspace"</name></workspace>" https://sous-paris.com/geoserver/rest/workspaces
fi

if [ $item = Create_LayerGroup ]
then
echo "${white}---> Create a Layers Group on Geoserver using REST   <---${reset}"
echo "${bg_red}${white}---> Enter the Geoserver User Name.                  <---${reset}"
read -p "${white}USER NAME              : ${orange}" UserName
echo "$UserName"

echo "${bg_red}${white}---> Enter "$UserName" password on Geoserver.              <---${reset}"
read -p "${white}PASSWORD               :
" -s  Password


read -p "${white}---> Layer Group Name  : ${orange}" NameOfTheGroup
echo "${orange}$NameOfTheGroup${reset}"

curl -u "$UserName":"$Password" "$ServerAddress"/rest/layers > layers.tmp
workspacelist=$(cat layers.tmp |tr '{' '\n'| awk -F'\"name\":\"' '{print $2}' | awk -v Workspace2group="$Workspace2group" '$0 ~ Workspace2group {print $1}' | awk -F'\"' '{print $1}' | awk -F":" '{print $1}' | awk '!a[$1]++')

ListLayersOfTheWorkspace=$(cat layers.tmp |tr '{' '\n'| awk -F'\"name\":\"' '{print $2}' | awk -v Workspace2group="$Workspace2group" '$0 ~ Workspace2group {print $1}' | awk -F'\"' '{print $1}' | awk -F":" '{print $2}')

echo "$ListLayersOfTheWorkspace" | awk 'NF' > ListLayersOfTheWorkspace.txt
echo "$workspacelist" | awk 'NF' > workspacelist.txt

# Menu begin.
if [ -s workspacelist.txt ]
then

# ### Menu select workspace ####
# ### Menu select début
echo "${reset}${white}---> List of workspaces"
NbrOfResult=$( awk 'NF' workspacelist.txt | wc -l | awk -F'\ ' '{print $1}')
if [[ "$NbrOfResult" == "1" ]]
then
echo -e "${white}---> Nombre de résultat \$NbrOfResult\t\t\t\t\t${orange}1"
elif [[ "$NbrOfResult" < "1" ]]
then
echo -e "${white}---> \$NbrOfResult inférieur à ${red}1"
echo "NbrOfResult $NbrOfResult"
elif [[ "$NbrOfResult" -ge "1" ]]
then
ResultatsMultiples=$(cat workspacelist.txt | awk 'NF')
SELECTION=1
while read -r line; do
echo "${orange}########################################################
$SELECTION) $line${reset}"
((SELECTION++))
done <<< "$ResultatsMultiples"
((SELECTION--))
echo "${white}
########################################################
#${rest}    Choose Workspace from 1 to ${NbrOfResult} - Then hit enter
${white}########################################################${reset}"
read -r opt
if [[ `seq 1 $SELECTION` =~ $opt ]]; then
ResultatsMultiplesOUT=$( sed -n "${opt}p" <<< "$ResultatsMultiples" |  awk -F'|' '{print $3}' | tr -d '\t' | awk 'NF' )
echo "$ResultatsMultiplesOUT" | awk 'NF' > workspace
#cp ../.film_id ../FILM_ID.txt
SelectedID=$(
sed -n "${opt}p" <<< "$ResultatsMultiples"
)
#awk -v selectedid="$SelectedID" -F':' '$1 == selectedid' ../.Temp.film > ../.temp.film_prime
echo -e "${white}---> You have chosen\t\t$SelectedID"
ListLayersOfTheWorkspace=$(cat layers.tmp |tr '{' '\n'| awk -F'\"name\":\"' '{print $2}' | awk -v SelectedID="$SelectedID" '$0 ~ SelectedID {print $1}' | awk -F'\"' '{print $1}' | awk -F":" '{print $2}')
echo "$ListLayersOfTheWorkspace" | awk '{print "<layer>"$0"</layer>"}' > AllLayers.txt
numberofL=$(cat AllLayers.txt | wc -l | awk -F'\ ' '{print $1}')
n=0; while (( n++ < "$numberofL" )); do echo "<style>raster</style>" >> stylesRastertmp.txt; done
fi #end select workspace
fi #fin du menu condition
# # Menu de séléction fin ##
# ### Menu de séléction ####
fi

echo "<layerGroup>
  <name>"$NameOfTheGroup"</name>
  <layers>" > ../LayerGroup.xml
cat "$dir"/AllLayers.txt >> ../LayerGroup.xml
echo "  </layers>
  <styles>" >> ../LayerGroup.xml
cat "$dir"/stylesRastertmp.txt >> ../LayerGroup.xml
echo "  </styles>
</layerGroup>
" >> ../LayerGroup.xml
rm "$dir"/LayerGrouptemp.xml "$dir"/stylesRastertmp.txt

curl -u "$UserName":"$Password" -XPOST -d @"../LayerGroup.xml" -H "Content-type: text/xml" "$ServerAddress"/rest/layergroups

echo "---> In order to serve the created LayerGroup go to geoserver with you browser & choose -> Layer Groups / Select the group${orange} $NameOfTheGroup${white} and parent it to the workspace that the layers of the group depends."
fi


cd - 2>&1 &>/dev/null
