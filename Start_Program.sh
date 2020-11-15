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
cd $dir
echo "
             o    O                       .oOOOo.
             o   O                .oOOo. .O     o
             O  O      O               O o
             oOo      oOo              o O
             o  o      o   .oOoO'     O' O   .oOOo .oOo. .oOo.
             O   O     O   O   o     O   o.      O OooO' O   o
             o    o    o   o   O   .O     O.    oO O     o   O
             O     O   \`oO \`OoO'o oOoOoO   \`OooO'  \`OoO' \`OoO'
"

echo "${white}---> Checking install & datas..."

#Check
if [[ -f servers/osxiconutils/icns2image ]]
then
echo -e "${green}---> Osxiconutils is installed in :${orange}\t\t\t\t\t\t\t\tservers/osxiconutils"
else
echo "${orange}--->Installing Osxiconutils in servers/osxiconutils"
mkdir -p servers/osxiconutils servers/osxiconutils/temp
wget -O servers/osxiconutils.zip https://sveinbjorn.org/files/software/osxiconutils.zip
unzip servers/osxiconutils.zip -d servers/osxiconutils/temp
cp -Rap servers/osxiconutils/temp/bin/* servers/osxiconutils/
rm -R servers/osxiconutils/temp servers/osxiconutils.zip
chmod +x servers/osxiconutils/image2icns servers/osxiconutils/seticon servers/osxiconutils/icns2image servers/osxiconutils/geticon
fi


#read input_variable
#echo "You entered: $input_variable"
#
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
Menu=('GeoRefIGC'  'kmz2csv' 'Geoserver_operations' 'Feuilles2Planches' 'Planche to feuilles' )

# Call the subroutine to create the menu
menu_from_array "${Menu[@]}"

if [ $item.sh = GeoRefIGC.sh ]
then
./GeoRefIGC.sh
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



cd - 

