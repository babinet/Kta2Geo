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
### INSTALL CHECK
if ! [ -x "$(command -v gdal-config)" ]; then
  echo "${bg_red}${white}---> Error: gdal is not installed.         <---${reset}" >&2
  exit 1
else
gdaloutputinfo=$(gdal-config --version)
echo "${white}---> Installed version of ${orange}Gdal${white} is ${green}"$gdaloutputinfo""
fi
if ! [ -x "$(command -v awk)" ]; then
  echo "${bg_red}${white}---> Error: awk is not installed.          <---${reset}" >&2
  exit 1
else
awkloutputinfo=$(awk --version)
echo "${white}---> Installed version of ${orange}Awk${white} is ${green}"$awkloutputinfo""

fi
if ! [ -x "$(command -v wget)" ]; then
  echo "${bg_red}${white}---> Error: wget is not installed.         <---${reset}" >&2
  exit 1
else
wgetoutputinfo=$(wget --version | sed -n 1p)
echo "${white}---> Installed version of ${orange}Wget${white} is ${green}"$wgetoutputinfo""
fi
if ! [ -x "$(command -v convert)" ]; then
  echo "${bg_red}${white}---> Error: ImageMagick is not installed.  <---${reset}" >&2
  exit 1
else
convertoutputinfo=$(convert --version | sed -n 1p)
echo "${white}---> Installed version of ${orange}ImageMagick${white} is ${green}"$convertoutputinfo""
fi
if ! [ -x "$(command -v exiftool)" ]; then
  echo "${bg_red}${white}---> Error: ExifTool is not installed.     <---${reset}" >&2
  exit 1
else
awkoutputinfo=$(exiftool --version)
echo "${white}---> Installed version of ${orange}Exiftool${white} is ${green}"$gdaloutputinfo""
fi
if ! [ -x "$(command -v unar)" ]; then
  echo "${bg_red}${white}---> Error: Unar is not installed.     <---${reset}" >&2
  exit 1
else
unaroutputinfo=$(unar --version)
echo "${white}---> Installed version of ${orange}Unar${white} is ${green}"$unaroutputinfo""
fi
### INSTALL CHECK END
#
dir=$(
cd -P -- "$(dirname -- "$0")" && pwd -P
)
cd "$dir"
echo "${green}
             o    O                       .oOOOo.
             o   O                .oOOo. .O     o
             O  O      O               O o
             oOo      oOo              o O
             o  o      o   .oOoO'     O' O   .oOOo .oOo. .oOo.
             O   O     O   O   o     O   o.      O OooO' O   o
             o    o    o   o   O   .O     O.    oO O     o   O
             O     O   \`oO \`OoO'o oOoOoO   \`OooO'  \`OoO' \`OoO'
${white}"



menu_from_array ()
{

select item; do
# Check menu item number
if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $# ];

then
echo "Running $item..."
break;
else
echo "Erreur - Choisir parmis 1-$#"
fi
done
}

# Declare the array
Menu=('GeoRefIGC'  'GeoRefIGC_And_CSV' 'Update_Layers_in_server' 'Geoserver_operations' 'kmz2csv' 'Observatoire_Long_Lat-Converter' )

# Call the subroutine to create the menu
menu_from_array "${Menu[@]}"

if [ $item.sh = GeoRefIGC.sh ]
then
./GeoRefIGC.sh
fi
if [ "$item".sh = "GeoRefIGC_And_CSV.sh" ]
then
./GeoRefIGC_N_Make_WFS.sh
fi
if [ "$item" = "Update_Layers_in_server" ]
then
./X_reimport_N_Update.sh
fi

if [ $item = Feuilles2Planches ]
then
./Feuilles2Planches.sh
fi

if [ $item.sh = kmz2csv.sh ]
then
./kmz2csv.sh
fi

if [ $item = Geoserver_operations ]
then
./Geoserver.sh
fi

if [ $item = Observatoire_Long_Lat-Converter ]
then
./Observatoire_Long_Lat-Conver.sh
fi


cd -
