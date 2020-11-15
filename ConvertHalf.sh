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
mkdir -p ../_Output


# Ask the user for their name
echo "${white}LongitudeEst eg: 240991.106${green}"
read LongitudeEst

echo 260098.649-259188.766 | bc -l
echo 909.883+259188.766 | bc -l


Largeur=909.883
Hauteur=608.275
demieplancheH=304.1375
demieplancheL=454.9415

Est=$(echo $LongitudeEst-454.9415 | bc -l)
Ouest=$(echo $LongitudeEst-454.9415-$Largeur | bc -l)
Nord=$(echo $LongitudeEst-454.9415-$Largeur | bc -l)
Sud=$(echo $LongitudeEst-454.9415-$Largeur | bc -l)

#echo $demieplancheL

echo "Est $demieplancheL"

#read -p echo 240081.223-909.883/2| bc -l &&  echo 240081.223-909.883/2-909.883| bc -l
