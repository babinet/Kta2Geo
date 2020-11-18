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
mkdir -p ../_Output ../_TRASH_TEMP

# Zero de l'Observatoire 3857
echo "${white}---> Position Origin (meters) 600000 126224 (Zéro de l'observatoire de Paris)"
ObservatoireLong=600000
ObservatoireLat=126224
# Metres



echo "${white}
      ooooooo  oooooooooo   oooooooo8 ooooooooooo oooooooooo ooooo  oooo  o   ooooooooooo   ooooooo  ooooo oooooooooo  ooooooooooo   ooooooooo  ooooooooooo   oooooooooo   o      oooooooooo  ooooo  oooooooo8
    o888   888o 888    888 888         888    88   888    888 888    88  888  88  888  88 o888   888o 888   888    888  888    88     888    88o 888    88     888    888 888      888    888  888  888
    888     888 888oooo88   888oooooo  888ooo8     888oooo88   888  88  8  88     888     888     888 888   888oooo88   888ooo8       888    888 888ooo8       888oooo88 8  88     888oooo88   888   888oooooo
    888o   o888 888    888         888 888    oo   888  88o     88888  8oooo88    888     888o   o888 888   888  88o    888    oo     888    888 888    oo     888      8oooo88    888  88o    888          888
      88ooo88  o888ooo888  o88oooo888 o888ooo8888 o888o  88o8    888 o88o  o888o o888o      88ooo88  o888o o888o  88o8 o888ooo8888   o888ooo88  o888ooo8888   o888o   o88o  o888o o888o  88o8 o888o o88oooo888
"
echo "
                                             ---------------------------
                                            | NORD/OUEST       NORD/EST |
                                            |                           |
                                            |      STANDARD I•D•C       |
                                            |      Largeur :  ${orange}600m  ${white}    |
                                            |      HAUTEUR :  ${orange}400m  ${white}    |
                                            |
                                            | SUD/OUEST         SUD/EST |
                                             --–------------------------
"


echo "${white}---> Position Origin meter 600000 126224 (Zéro de l'observatoire de Paris)"
echo "${white}---> ${orange}Latitude Est ${white}= ${red}+ ${white}|${orange} Latitude Ouest ${white}= ${red}- ${white}Unité : mètre"
echo "${white}---> Position Long : 600000 Lat : 126224 (Zéro de l'observatoire de Paris)"
echo "
                                              _____     _        __   ___                  _
                                             | ____|___| |_     / /  / _ \ _   _  ___  ___| |_
                                             |  _| / __| __|   / /  | | | | | | |/ _ \/ __| __|
                                             | |___\__ \ |_   / /   | |_| | |_| |  __/\__ \ |_
                                             |_____|___/\__| /_/     \___/ \__,_|\___||___/\__|

${white}---> Distance en mètre du Zéro l'Observatoire de paris Longitue ${orange}Est ${white}+ ${orange}Ouest ${white}- ? :"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561
${white}---> \"Nouvelle Triangulation Francaise (Paris)\""

read -p "Longitude EST / OUEST +/- mètre ? : ${green}" Long
LongEPSG27561=$(echo 600000+$Long | bc -l)
if [ "$LongEPSG27561" -ge "600000" ]
then
echo "${white}Longitude EPSG:27561 ${orange}$LongEPSG27561 ${white}- Soit à $Long mètres ${orange}EST de l'Observatoire de Paris"
#echo "${white}Longitude EPSG:27561 ${orange}$LatEPSG27561 ${white}- Soit à $Long mètres ${orange}EST de l'Observatoire de Paris"

elif [ "$LongEPSG27561" -le "600000" ]
then
echo "${white}Longitude EPSG:27561 ${orange}$LongEPSG27561 ${white}- Soit à $Long mètres ${orange}OUEST de l'Observatoire${reset}"
fi
echo "${white}
                                              _   _               _      __  ____            _
                                             | \ | | ___  _ __ __| |    / / / ___| _   _  __| |
                                             |  \| |/ _ \| '__/ _\` |   / /  \___ \| | | |/ _\` |
                                             | |\  | (_) | | | (_| |  / /    ___) | |_| | (_| |
                                             |_| \_|\___/|_|  \__,_| /_/    |____/ \__,_|\__,_|
     
"
echo "${white}---> Distance en mètre du Zéro l'Observatoire de paris Latitude ${orange}Nord ${white}+ ${orange}Sud ${white}- ? :"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561"
echo "${white}---> \"Nouvelle Triangulation Francaise (Paris)\""

echo "${white}---> ${orange}Nord ${white}+ ${white}| ${orange}Sud ${white}- ${white}Unité : mètre"
read -p "Latitude NORD / SUD +/- mètre ?  : ${green}" Lat
LatEPSG27561=$(echo 126224+$Lat | bc -l)
if [ "$LatEPSG27561" -ge "126224" ]
then
echo "${white}Latitude EPSG:${orange}27561 ${white}$LatEPSG27561 ${white}- Soit à $Long mètres ${orange}NORD de l'Observatoire de Paris"
elif [ "$LatEPSG27561" -le "126224" ]
then
echo "${white}Latitude EPSG:${orange}27561 ${white}$LatEPSG27561 ${white}- Soit à $Long mètres ${orange}SUD de de l'Observatoire de Paris${reset}"
fi
Position3857=$(echo $LongEPSG27561 $LatEPSG27561 |gdaltransform -s_srs "EPSG:27561" -t_srs "EPSG:3857" | awk '{print $1, $2}' )
Position4326=$(echo $LongEPSG27561  $LatEPSG27561 |gdaltransform -s_srs "EPSG:27561" -t_srs "EPSG:4326" | awk '{print $1, $2}')
Position27561=$(echo $LongEPSG27561 $LatEPSG27561 |gdaltransform -s_srs "EPSG:27561" -t_srs "EPSG:27561" | awk '{print $1, $2}' )


echo "${white}################################################################################
---> POSITION                                                      POSITION <---
${white}################################################################################
${white}Position EPSG:${orange}27561                     : ${orange}$Position27561"
echo "${white}Position EPSG:${orange}3857                      : ${orange}$Position3857"
echo "${white}Position EPSG:${orange}4326                      : ${orange}$Position4326
${white}################################################################################
"
Nord=$(echo "$LatEPSG27561")
Sud=$(echo $LatEPSG27561+400 |bc -l)
Est=$(echo $LongEPSG27561)
Ouest=$(echo $LongEPSG27561+600 |bc -l)

echo "                                        ${white}: ${green}$LongEPSG27561
                                ${red}ORIGINE${white} : ${green}$LatEPSG27561${white}
                                         ---------------------------
                                        | NORD/OUEST       NORD/EST |
                                        |                           |
                                        |     STANDARD I•D•C        |
                                        |     LARGEUR :  ${orange}600m  ${white}     |
                                        |     HAUTEUR :  ${orange}400m  ${white}     |
                                        |                           |
                                        | SUD/OUEST         SUD/EST |
                                         --–------------------------
"

echo "################################################################################
${white}---> Nord/Est                           : ${orange}$Est $Nord
${white}---> Sud/Est                            : ${orange}$Est $Sud
${white}---> Nord/Ouest                         : ${orange}$Ouest $Nord
${white}---> Sud/Ouest                          : ${orange}$Ouest $Sud
${white}################################################################################"

NordDeF=$(echo "$LatEPSG27561")
SudDeF=$(echo $LatEPSG27561+600 |bc -l)
EstDeF=$(echo $LongEPSG27561)
OuestDeF=$(echo $LongEPSG27561+10000 |bc -l)

echo "                                        ${white}: ${green}$LongEPSG27561
                                ${red}ORIGINE${white} : $LatEPSG27561${white}
                                         ---------------------------
                                        | NORD/OUEST       NORD/EST |
                                        |                           |
                                        |      De Fourcy 1858       |
                                        |     LARGEUR :  ${orange}1000m ${white}     |
                                        |     HAUTEUR :  ${orange}600m  ${white}     |
                                        |                           |
                                        | SUD/OUEST         SUD/EST |
                                         --–------------------------
"

echo "################################################################################
${white}---> Nord/Est                           : ${orange}$EstDeF $NordDeF
${white}---> Sud/Est                            : ${orange}$EstDeF $SudDeF
${white}---> Nord/Ouest                         : ${orange}$OuestDeF $NordDeF
${white}---> Sud/Ouest                          : ${orange}$OuestDeF $SudDeF
${white}################################################################################"

cd - 2>&1 &>/dev/null










#tesseract -l fra 25-50-2003.tif  Out.txt
# tesseract -l fra --dpi 300 25-50-2003.tif  Out.txt

#convert   -colorspace Gray NB.tif
# tesseract -l fra --dpi 300 NB.tif   Out.txt
#tesseract -l fra --dpi 72 NB.tif   Out.txt






#
#echo "${white}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Sud"
#echo "                                                                     ${white}Est Lambert 1"
#echo "${white}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Est"
#echo "                                                                     ${white}Ouest Lambert 1"
#echo "${white}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Ouest"
#
#echo "
#${white}---> WGS 84 (World Geodetic System 1984)EPSG:${green}4326 ${white}Corners unit : ${green}degree         ${white}<---
#${white}---> \"World Geodetic System 1984 / -85.06,-180,85.06,180\""
#
#echo "${white}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordOuest4326"
#echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
#echo "${white}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordEst4326"
#echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
#
#echo "
#${white}---> WGS 84 / Pseudo-Mercator      EPSG:${green}3857 ${white}Corners unit       : ${green}meters        ${white}<---
#${white}---> \"World Geodetic System 1984\""
#echo "${white}---> \$NordOuest3857  -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordOuest3857"
#echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"
#echo "${white}---> \$NordEst3857    -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordEst3857"
#echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"
#
#echo "${white}---> \$WidthImage${white} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage"
#echo "${white}---> \$HeightImage${white}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage"
