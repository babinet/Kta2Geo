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
Observatoire=$(echo "260098.642816645 6247162.50356738")
echo "${white}---> Position Origin (meters) 600000 126224 (Zéro de l'observatoire de Paris)"
ObservatoireLong=600000
ObservatoireLat=126224
# Metres
Hauteur=400
Largeur=600

for TiffSource in ../*.tif ../*.jpg
do
# Definitions
FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")
NameNoExt=$(echo "$TiffSource" | sed 's/.tif//g' | sed 's/..\///g')
Year=$( echo "$TiffSource" | tail -c -9 | awk -F'.tif' '{print $1}')
NameNoExt=$( echo "$TiffSource" | awk -F'.tif' '{print $1}' | awk -F'\_' '{print $1}' | sed 's/..\///g')


# Ancienne_Numérotation

if [ "$NameNoExt" == ../2222Y_*  ]
then
echo hello
elif [ "$TiffSource" == ../26Y_* ]
then
Ordinate=10
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}${green}$Abscissa"

elif [ "$TiffSource" == ../72H_* ]
then
Ordinate=23
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../Feuille-110_* ] || [ "$TiffSource" == ../46C_* ]
then
Ordinate=18
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27A_* ]
then
Ordinate=11
Abscissa=31
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27B_* ]
then
Ordinate=12
Abscissa=31
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27F_* ]
then
Ordinate=11
Abscissa=32
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27K_* ]
then
Ordinate=11
Abscissa=33
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27L_* ]
then
Ordinate=12
Abscissa=33
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27P_* ]
then
Ordinate=11
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27Q_* ]
then
Ordinate=12
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../27X_* ]
then
Ordinate=14
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../35D_* ]
then
Ordinate=9
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../35O_* ]
then
Ordinate=10
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../35Y_* ]
then
Ordinate=11
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../95I_* ]
then
Ordinate=19
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"


elif [ "$TiffSource" == ../70E_* ]
then
Ordinate=15
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"


elif [ "$TiffSource" == ../70J_* ]
then
Ordinate=15
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"


elif [ "$TiffSource" == ../70O_* ]
then
Ordinate=15
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71A_* ]
then
Ordinate=16
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71B_* ]
then
Ordinate=17
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71C_* ]
then
Ordinate=18
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71D_* ]
then
Ordinate=19
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71E_* ]
then
Ordinate=20
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71F_* ]
then
Ordinate=16
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71G_* ]
then
Ordinate=17
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71H_* ]
then
Ordinate=18
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71I_* ]
then
Ordinate=19
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71J_* ]
then
Ordinate=20
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71K_* ]
then
Ordinate=16
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71L_* ]
then
Ordinate=17
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71M_* ]
then
Ordinate=18
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71N_* ]
then
Ordinate=19
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71O_* ]
then
Ordinate=20
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71R_* ]
then
Ordinate=18
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71S_* ]
then
Ordinate=19
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71T_* ]
then
Ordinate=20
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71W_* ]
then
Ordinate=18
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71X_* ]
then
Ordinate=19
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../71Y_* ]
then
Ordinate=20
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72A_* ]
then
Ordinate=21
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72B_* ]
then
Ordinate=22
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72C_* ]
then
Ordinate=23
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72D_* ]
then
Ordinate=24
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72F_* ]
then
Ordinate=21
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72G_* ]
then
Ordinate=22
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72H_* ]
then
Ordinate=23
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72I_* ]
then
Ordinate=24
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72K_* ]
then
Ordinate=21
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72L_* ]
then
Ordinate=22
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72M_* ]
then
Ordinate=23
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72N_* ]
then
Ordinate=24
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72P_* ]
then
Ordinate=21
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72Q_* ]
then
Ordinate=22
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72R_* ]
then
Ordinate=23
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72S_* ]
then
Ordinate=24
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72U_* ]
then
Ordinate=21
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72V_* ]
then
Ordinate=22
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72W_* ]
then
Ordinate=23
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../72X_* ]
then
Ordinate=24
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../80C_* ]
then
Ordinate=18
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../80D_* ]
then
Ordinate=19
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../80E_* ]
then
Ordinate=20
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../80J_* ]
then
Ordinate=20
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81A_* ]
then
Ordinate=21
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81B_* ]
then
Ordinate=22
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81C_* ]
then
Ordinate=23
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81F_* ]
then
Ordinate=21
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81G_* ]
then
Ordinate=22
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81H_* ]
then
Ordinate=23
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81L_* ]
then
Ordinate=22
Abscissa=63
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../81D_* ]
then
Ordinate=24
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../95D_* ]
then
Ordinate=19
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../95E_* ]
then
Ordinate=20
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../95I_* ]
then
Ordinate=19
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../95J_* ]
then
Ordinate=20
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../96A_* ]
then
Ordinate=21
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../96F_* ]
then
Ordinate=21
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"





#
# lundi 16 octobre
#




elif [ "$TiffSource" == ../36U_* ]
then
Ordinate=11
Abscissa=40
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../44E_* ]
then
Ordinate=10
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../45A_* ]
then
Ordinate=11
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../61Y_* ]
then
Ordinate=15
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62J_* ]
then
Ordinate=20
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62P_* ]
then
Ordinate=16
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62R_* ]
then
Ordinate=18
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"


elif [ "$TiffSource" == ../62T_* ]
then
Ordinate=20
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62U_* ]
then
Ordinate=16
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62V_* ]
then
Ordinate=17
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../62Y_* ]
then
Ordinate=20
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63K_* ]
then
Ordinate=21
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63P_* ]
then
Ordinate=21
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63Q_* ]
then
Ordinate=22
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63R_* ]
then
Ordinate=23
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63U_* ]
then
Ordinate=21
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63V_* ]
then
Ordinate=22
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63W_* ]
then
Ordinate=23
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [ "$TiffSource" == ../63X_* ]
then
Ordinate=24
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordinate=21
#Abscissa=72
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#
#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordinate=21
#Abscissa=72
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#
#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordinate=21
#Abscissa=72
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#













#
## Ancienne Numérotation / Feuille 25-50 = Feuille 281
#

elif [ "$TiffSource" == ../Fueille-324_* ]
then
Ordinate=24
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordinate=15
#Abscissa=58
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordinate=15
#Abscissa=58
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordinate=15
#Abscissa=58
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordinate=15
#Abscissa=58
#echo "${white}---> Ordinate substitut : ${green}$Ordinate"
#echo "${white}---> Abscissa substitut : ${green}$Abscissa"
#





# END Abscissa FIX
else

Ordinate=$(echo $NameNoExt | awk -F'-' '{print $1}'| tr -d ' ' | sed 's/..\///g')
Abscissa=$(echo $NameNoExt | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}'| sed 's/..\///g')
# END Abscissa
fi
echo "${white} ---> \$Abscissa $Abscissa"
echo "${white} ---> \$Ordinate $Ordinate"










AbscissaMultiple=$(echo "$Abscissa"-50 |bc -l)
OrdinateMultiple=$(echo "$Ordinate"-25 | bc -l)
# Image Info
ExifInfo=$(exiftool "$TiffSource")
#echo $SerialPoster
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

# Position Origin (Mètres) 600000 126224 Zéro de l'observatoire de Paris

Nord=$(echo 126224-$Hauteur*$AbscissaMultiple |bc -l)
Sud=$(echo 125824-$Hauteur*$AbscissaMultiple|bc -l )
Est=$(echo 600000+\($OrdinateMultiple*$Largeur\) |bc -l )
Ouest=$(echo 599400+\($OrdinateMultiple*$Largeur\) |bc -l )

# NW
NordOuest4326=$(echo "$Ouest $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
NordOuest3857=$(echo "$Ouest $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# SW
SudOuest4326=$(echo "$Ouest $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
SudOuest3857=$(echo "$Ouest $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# NE
NordEst4326=$(echo "$Est $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
NordEst3857=$(echo "$Est $Nord" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
# SE
SudEst4326=$(echo "$Est $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $1, $2}')
SudEst3857=$(echo "$Est $Sud" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')

IDCFirst2Nbr=$(echo "$NameNoExt" |awk '{print substr($0,0,2)}')
IDCThirdLetter=$(echo "$NameNoExt" | head -c 3 | tail -c 1 )
IGCPatternOrdinate=$(echo $NameNoExt | awk -F'-' '{print $1}' )
IGCPatternAbscissa=$(echo $NameNoExt | awk -F'-' '{print $2}' )



echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "${white}---> \$Abscissa   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Abscissa"
echo "${white}---> \$Ordinate   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordinate"
echo "${white}---> \$AbscissaMultiple   -   -   -   -   -   -   -   -   -   -   -   ${orange}$AbscissaMultiple"
echo "${white}---> \$OrdinateMultiple   -   -   -   -   -   -   -   -   -   -   -   ${orange}$OrdinateMultiple"
echo "
${white}############################### Planche ${green}$Ordinate $Abscissa $Version $Year ${white}###############################
"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561                                   ${white}<---
${white}---> \"Nouvelle Triangulation Francaise (Paris)\""
echo "                                                                     Nord Lambert 1"
echo "${white}---> \$Nord   Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Nord"
echo "                                                                     ${white}Sud Lambert 1"
echo "${white}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Sud"
echo "                                                                     ${white}Est Lambert 1"
echo "${white}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Est"
echo "                                                                     ${white}Ouest Lambert 1"
echo "${white}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Ouest"

echo "
${white}---> WGS 84 (World Geodetic System 1984)EPSG:${green}4326 ${white}Corners unit : ${green}degree         ${white}<---
${white}---> \"World Geodetic System 1984 / -85.06,-180,85.06,180\""

echo "${white}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordOuest4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
echo "${white}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordEst4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"

echo "
${white}---> WGS 84 / Pseudo-Mercator      EPSG:${green}3857 ${white}Corners unit       : ${green}meters        ${white}<---
${white}---> \"World Geodetic System 1984\""
echo "${white}---> \$NordOuest3857  -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordOuest3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"
echo "${white}---> \$NordEst3857    -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordEst3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"

echo "${white}---> \$WidthImage${white} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage"
echo "${white}---> \$HeightImage${white}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage"

#Début
#Cas Particuliers

echo -e "${white}---> Cas Particuliers e.g: planche 4-41"
if [ "$NameNoExt" == 4-41 ]||[ "$NameNoExt" == 04-41 ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 586500 129824 -gcp 0 "$HeightImage" 586500 129424 -gcp "$WidthImage" 0 587100 129824 -gcp "$WidthImage" "$HeightImage" 587100 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#rm "../_Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

# Planche 29-37
elif [ "$NameNoExt" == 29-37 ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 601800 131524 -gcp 0 "$HeightImage" 601800 131024 -gcp "$WidthImage" 0 602400 131524 -gcp "$WidthImage" "$HeightImage" 602400 131024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
#rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

# Planche 29-38-union_*
elif [ "$TiffSource" == ../29-38-union_* ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 601800 131024 -gcp 0 "$HeightImage" 601800 130524 -gcp "$WidthImage" 0 602400 131024 -gcp "$WidthImage" "$HeightImage" 602400 130524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
#rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
rm temp.tif





# Planche 28-37
elif [ "$NameNoExt" == 28-37 ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 601200 131424 -gcp 0 "$HeightImage" 601200 130924 -gcp "$WidthImage" 0 601800 131424 -gcp "$WidthImage" "$HeightImage" 601800 130924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
#rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

## Planche 07-58
#elif [ "$NameNoExt" == 07-58 ]
#then
#echo "${purple}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
#WidthImage=7734
#HeightImage=5284
#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 588550 123024 -gcp 0 "$HeightImage" 588550 122574 -gcp "$WidthImage" 0 589200 123024 -gcp "$WidthImage" "$HeightImage" 589200 122574 "$TiffSource" temp.tif
#
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
##mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#
#fi
#gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

elif [ "$TiffSource" == ../8-9-51-52_* ]
then
#echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589500 125624 -gcp 0 "$HeightImage" 589500 125224 -gcp "$WidthImage" 0 590100 125624 -gcp "$WidthImage" "$HeightImage" 590100 125224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

elif [ "$TiffSource" == ../36K_* ]
then
echo "${orange}---> Cas Particuliers - Transformation fixe${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 591000 131024 -gcp 0 "$HeightImage" 591000 130524 -gcp "$WidthImage" 0 591600 131024 -gcp "$WidthImage" "$HeightImage" 591600 130524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#rm "../_Output/"$NameNoExt"_"$Year".tif"
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
rm temp.tif

# Planche ../71P_* or ../15-59-16_*
elif [ "$TiffSource" == ../71P_* ] || [ "$TiffSource" == ../15-59-16_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 593800 122624 -gcp 0 "$HeightImage" 593800 122224 -gcp "$WidthImage" 0 594400 122624 -gcp "$WidthImage" "$HeightImage" 594400 122224 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif

fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../71V_*
elif [ "$TiffSource" == ../71V_* ] || [ "$TiffSource" == ../17-60-union_* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 594600 122324 -gcp 0 "$HeightImage" 594600 121664 -gcp "$WidthImage" 0 595200 122324 -gcp "$WidthImage" "$HeightImage" 595200 121664 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../7-39-union*
elif [ "$TiffSource" == ../07-39-union* ] || [ "$TiffSource" == ../35O-union* ]
then
gdal_translate -co ALPHA=YES -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 588600 130724 -gcp 0 "$HeightImage" 588600 130224 -gcp "$WidthImage" 0 589200 130724 -gcp "$WidthImage" "$HeightImage" 589200 130224 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../7-39-union*
elif [ "$TiffSource" == ../07-39-union* ] || [ "$TiffSource" == ../Feuille-35O-union* ]
then
gdal_translate -co ALPHA=YES -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 588600 130724 -gcp 0 "$HeightImage" 588600 130224 -gcp "$WidthImage" 0 589200 130724 -gcp "$WidthImage" "$HeightImage" 589200 130224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

## Planche ../19-43-union_1957*
elif [ "$TiffSource" == ../19-43-union* ] || [ "$TiffSource" == ../Feuille-147-union* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 595800 129024 -gcp 0 "$HeightImage" 595800 128624 -gcp "$WidthImage" 0 596500 129024 -gcp "$WidthImage" "$HeightImage" 596500 128624 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
#elif [ "$TiffSource" == ../19-43-union* ] || [ "$TiffSource" == ../Feuille-147-union* ] || [ "$TiffSource" == ../46N-union* ]
#then
#gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 588600 129024 -gcp 0 "$HeightImage" 588600 128624 -gcp "$WidthImage" 0 589200 129024 -gcp "$WidthImage" "$HeightImage" 589200 128624 "$TiffSource" temp.tif
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
#mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#fi
#gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../Feuille-93_* 18-40-19
elif [ "$TiffSource" == ../Feuille-93_* ]||[ "$TiffSource" == ../18-40-19* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 595500 130224 -gcp 0 "$HeightImage" 595500 129824 -gcp "$WidthImage" 0 596100 130224 -gcp "$WidthImage" "$HeightImage" 596100 129824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

## Planche ../Feuille-110_* 18-40-19
#elif [ "$TiffSource" == ../Feuille-* ]
#then
#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
#mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#fi
#gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"









## Planche ../08-44-union_*
#elif [ "$TiffSource" == ../08-44-union_* ]
#then
#echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589200 128624 -gcp 0 "$HeightImage" 589200 128124 -gcp "$WidthImage" 0 589800 128624 -gcp "$WidthImage" "$HeightImage" 589800 128124 "$TiffSource" temp.tif
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
#mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#fi
#gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"




# Planche ../10-35
elif [ "$TiffSource" == ../10-35-union* ] || [ "$TiffSource" == ../26Y-union* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 590400 132324 -gcp 0 "$HeightImage" 590400 131824 -gcp "$WidthImage" 0 591000 132324 -gcp "$WidthImage" "$HeightImage" 591000 131824 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../41-45-42-Encart*
elif [ "$TiffSource" == ../41-45-42-Encart* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 609347 128673 -gcp 0 "$HeightImage" 609347 128570 -gcp "$WidthImage" 0 609500 128673 -gcp "$WidthImage" "$HeightImage" 609500 128570 "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -overwrite -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/41-42_Encart_"$Year".tif

# Planche ../41-45-42_*
elif [ "$TiffSource" == ../41-45-42_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 609300 128224 -gcp 0 "$HeightImage" 609300 127824 -gcp "$WidthImage" 0 609900 128224 -gcp "$WidthImage" "$HeightImage" 609900 127824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../41-42-46_*
elif [ "$TiffSource" == ../41-42-46_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 609300 127824 -gcp 0 "$HeightImage" 609300 127424 -gcp "$WidthImage" 0 609900 127824 -gcp "$WidthImage" "$HeightImage" 609900 127424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../21-41_*
elif [ "$TiffSource" == ../21-41-union* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 597000 130024 -gcp 0 "$HeightImage" 597000 129424 -gcp "$WidthImage" 0 597600 130024 -gcp "$WidthImage" "$HeightImage" 597600 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../22-48_*
elif [ "$TiffSource" == ../22-48-union* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 597600 127124 -gcp 0 "$HeightImage" 597600 126624 -gcp "$WidthImage" 0 598200 127124 -gcp "$WidthImage" "$HeightImage" 598200 126624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../32-33-41_
elif [ "$TiffSource" == ../32-33-41_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 603700 129824 -gcp 0 "$HeightImage" 603700 129374 -gcp "$WidthImage" 0 604300 129824 -gcp "$WidthImage" "$HeightImage" 604300 129374 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../32-37_*
elif [ "$TiffSource" == ../32-37_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 603600 131424 -gcp 0 "$HeightImage" 603600 130958 -gcp "$WidthImage" 0 604200 131424 -gcp "$WidthImage" "$HeightImage" 604200 130958 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../33-34-51_*
elif [ "$TiffSource" == ../33-34-51_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604300 125824 -gcp 0 "$HeightImage" 604300 125424 -gcp "$WidthImage" 0 604900 125824 -gcp "$WidthImage" "$HeightImage" 604900 125424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../33-37_*
elif [ "$TiffSource" == ../33-37_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604200 131424 -gcp 0 "$HeightImage" 604200 131003 -gcp "$WidthImage" 0 604800 131424 -gcp "$WidthImage" "$HeightImage" 604800 131003 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../33_44-union*
elif [ "$TiffSource" == ../33-44-union* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604100 128624 -gcp 0 "$HeightImage" 604100 128224 -gcp "$WidthImage" 0 604900 128624 -gcp "$WidthImage" "$HeightImage" 604900 128224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../33-48-49_*
elif [ "$TiffSource" == ../33-48-49_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604200 126724 -gcp 0 "$HeightImage" 604200 126241 -gcp "$WidthImage" 0 604800 126724 -gcp "$WidthImage" "$HeightImage" 604800 126241 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../34-35-38_*
elif [ "$TiffSource" == ../34-35-38_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 605100 131024 -gcp 0 "$HeightImage" 605100 130624 -gcp "$WidthImage" 0 605700 131024 -gcp "$WidthImage" "$HeightImage" 605700 130624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../34-41-42_*
elif [ "$TiffSource" == ../34-41-42_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604800 129724 -gcp 0 "$HeightImage" 604800 129324 -gcp "$WidthImage" 0 605400 129724 -gcp "$WidthImage" "$HeightImage" 605400 129324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../34-49-50_*
elif [ "$TiffSource" == ../34-49-50_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 604800 126524 -gcp 0 "$HeightImage" 604800 126124 -gcp "$WidthImage" 0 605400  126524 -gcp "$WidthImage" "$HeightImage" 605400 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../35-49-50-union*
elif [ "$TiffSource" == ../35-49-50-union* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 605400 126624 -gcp 0 "$HeightImage" 605400 126024 -gcp "$WidthImage" 0 606000  126624 -gcp "$WidthImage" "$HeightImage" 606000 126024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../35-49-50_*
elif [ "$TiffSource" == ../35-49-50_* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 605400 126524 -gcp 0 "$HeightImage" 605400 126124 -gcp "$WidthImage" 0 606000  126524 -gcp "$WidthImage" "$HeightImage" 606000 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../36-34-05-union_
elif [ "$TiffSource" == ../36-34-05-union_* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 606000 132624 -gcp 0 "$HeightImage" 606000 132224 -gcp "$WidthImage" 0 606800 132624 -gcp "$WidthImage" "$HeightImage" 606800 132224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../36-40-41_
elif [ "$TiffSource" == ../36-40-41_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 606000 130124 -gcp 0 "$HeightImage" 606000 129724 -gcp "$WidthImage" 0 606600 130124 -gcp "$WidthImage" "$HeightImage" 606600 129724 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../36-41-42_*
elif [ "$TiffSource" == ../36-41-42_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 606000 129724 -gcp 0 "$HeightImage" 606000 129324 -gcp "$WidthImage" 0 606600 129724 -gcp "$WidthImage" "$HeightImage" 606600 129324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../37-58-59_*
elif [ "$TiffSource" == ../37-58-59_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 606600 122724 -gcp 0 "$HeightImage" 606600 122324 -gcp "$WidthImage" 0 607200  122724 -gcp "$WidthImage" "$HeightImage" 607200 122324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../38-39-58_*
elif [ "$TiffSource" == ../38-39-58_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 607500 123024 -gcp 0 "$HeightImage" 607500 122624 -gcp "$WidthImage" 0 608100  123024 -gcp "$WidthImage" "$HeightImage" 608100 122624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../42-43-39_*
elif [ "$TiffSource" == ../42-43-39_* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 610100 130624 -gcp 0 "$HeightImage" 610100 130224 -gcp "$WidthImage" 0 610700  130624 -gcp "$WidthImage" "$HeightImage" 610700 130224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../45-38-union_*
elif [ "$TiffSource" == ../45-38-union_* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 611400 131080 -gcp 0 "$HeightImage" 611400 130624 -gcp "$WidthImage" 0 612000  131080 -gcp "$WidthImage" "$HeightImage" 612000 130624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../45-58-59_*
elif [ "$TiffSource" == ../45-58-59_* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 611400 122824 -gcp 0 "$HeightImage" 611400 122424 -gcp "$WidthImage" 0 612000  122824 -gcp "$WidthImage" "$HeightImage" 612000 122424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../46-39-union_*
elif [ "$TiffSource" == ../46-39-union_* ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 612000 130624 -gcp 0 "$HeightImage" 612000 130187 -gcp "$WidthImage" 0 612600  130624 -gcp "$WidthImage" "$HeightImage" 612600 130187 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../46-57*
elif [ "$TiffSource" == ../46-57* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 123424 -gcp 0 "$HeightImage" 612100 123024 -gcp "$WidthImage" 0 612700 123424 -gcp "$WidthImage" "$HeightImage" 612700 123024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../46-58*
elif [ "$TiffSource" == ../46-58* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 123024 -gcp 0 "$HeightImage" 612100 122624 -gcp "$WidthImage" 0 612700  123024 -gcp "$WidthImage" "$HeightImage" 612700 122624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../46-59*
elif [ "$TiffSource" == ../46-59* ]
then
echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 122624 -gcp 0 "$HeightImage" 612100 122224 -gcp "$WidthImage" 0 612700 122624 -gcp "$WidthImage" "$HeightImage" 612700 122224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"




#
# OBSERVATOIRE + Alpha Escalier de l'observoire + Cubes etc = + 100 mètres  25-49    29-49   25-50   26-50
#

# Planche ../25-49-union*
elif [ "$TiffSource" == ../25-49-union* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599400 126624 -gcp 0 "$HeightImage" 599400 126124 -gcp "$WidthImage" 0 600100  126624 -gcp "$WidthImage" "$HeightImage" 600100 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../26-49-union*
elif [ "$TiffSource" == ../26-49-union* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599900 126624 -gcp 0 "$HeightImage" 599900 126124 -gcp "$WidthImage" 0 600600  126624 -gcp "$WidthImage" "$HeightImage" 600600 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../25-50-union*
elif [ "$TiffSource" == ../25-50-union* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599400 126324 -gcp 0 "$HeightImage" 599400 125824 -gcp "$WidthImage" 0 600100  126324 -gcp "$WidthImage" "$HeightImage" 600100 125824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../26-50-union*
elif [ "$TiffSource" == ../26-50-union* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599900 126324 -gcp 0 "$HeightImage" 599900 125824 -gcp "$WidthImage" 0 600600  126324 -gcp "$WidthImage" "$HeightImage" 600600 125824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

#
## De Fourcy 1858
#

# Planche ../P05_Planche_1_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P05_Planche_1_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 601000 127424 -gcp 0 "$HeightImage" 601000 126824 -gcp "$WidthImage" 0 602000 127424 -gcp "$WidthImage" "$HeightImage" 602000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P05_Planche_1_DeFourcy_1858.tif ]
then
mv ../_Output/P05_Planche_1_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P05_Planche_1_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P05_Planche_1_DeFourcy_1858.tif

# Planche ../P06_Planche_2_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P06_Planche_2_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 601000 126824 -gcp 0 "$HeightImage" 601000 126224 -gcp "$WidthImage" 0 602000 126824 -gcp "$WidthImage" "$HeightImage" 602000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P06_Planche_2_DeFourcy_1858.tif ]
then
mv ../_Output/P06_Planche_2_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P06_Planche_2_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P06_Planche_2_DeFourcy_1858.tif

# Planche ../P07_Planche_3_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P07_Planche_3_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 601000 126224 -gcp 0 "$HeightImage" 601000 125624 -gcp "$WidthImage" 0 602000 126224 -gcp "$WidthImage" "$HeightImage" 602000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P07_Planche_3_DeFourcy_1858.tif ]
then
mv ../_Output/P07_Planche_3_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P07_Planche_3_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P07_Planche_3_DeFourcy_1858.tif

# Planche ../P08_Planche_4_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P08_Planche_4_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 601000 125624 -gcp 0 "$HeightImage" 601000 125024 -gcp "$WidthImage" 0 602000 125624 -gcp "$WidthImage" "$HeightImage" 602000 125024 "$TiffSource" temp.tif
if [ -f ../_Output/P08_Planche_4_DeFourcy_1858.tif ]
then
mv ../_Output/P08_Planche_4_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P08_Planche_4_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P08_Planche_4_DeFourcy_1858.tif

# Planche ../P09_Planche_5_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P09_Planche_5_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 600000 128024 -gcp 0 "$HeightImage" 600000 127424 -gcp "$WidthImage" 0 601000 128024 -gcp "$WidthImage" "$HeightImage" 601000 127424 "$TiffSource" temp.tif
if [ -f ../_Output/P09_Planche_5_DeFourcy_1858.tif ]
then
mv ../_Output/P09_Planche_5_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P09_Planche_5_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P09_Planche_5_DeFourcy_1858.tif

# Planche ../P10_Planche_6_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P10_Planche_6_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 600000 127424 -gcp 0 "$HeightImage" 600000 126824 -gcp "$WidthImage" 0 601000 127424 -gcp "$WidthImage" "$HeightImage" 601000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P10_Planche_6_DeFourcy_1858.tif ]
then
mv ../_Output/P10_Planche_6_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P10_Planche_6_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P10_Planche_6_DeFourcy_1858.tif

# Planche ../P11_Planche_7_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P11_Planche_7_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 600000 126824 -gcp 0 "$HeightImage" 600000 126224  -gcp "$WidthImage" 0 601000 126824 -gcp "$WidthImage" "$HeightImage" 601000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P11_Planche_7_DeFourcy_1858.tif ]
then
mv ../_Output/P11_Planche_7_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P11_Planche_7_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P11_Planche_7_DeFourcy_1858.tif

# Planche ../P12_Planche_8_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P12_Planche_8_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 600000 126224 -gcp 0 "$HeightImage" 600000 125624  -gcp "$WidthImage" 0 601000 126224 -gcp "$WidthImage" "$HeightImage" 601000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P12_Planche_8_DeFourcy_1858.tif ]
then
mv ../_Output/P12_Planche_8_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P12_Planche_8_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P12_Planche_8_DeFourcy_1858.tif

# Planche ../P13_Planche_9_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P13_Planche_9_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599000 128024 -gcp 0 "$HeightImage" 599000 127424  -gcp "$WidthImage" 0 600000 128024 -gcp "$WidthImage" "$HeightImage" 600000 127424 "$TiffSource" temp.tif
if [ -f ../_Output/P13_Planche_9_DeFourcy_1858.tif ]
then
mv ../_Output/P13_Planche_9_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P13_Planche_9_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P13_Planche_9_DeFourcy_1858.tif

# Planche ../P14_Planche_10_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P14_Planche_10_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599000 127424 -gcp 0 "$HeightImage" 599000 126824  -gcp "$WidthImage" 0 600000 127424 -gcp "$WidthImage" "$HeightImage" 600000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P14_Planche_10_DeFourcy_1858.tif ]
then
mv ../_Output/P14_Planche_10_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P14_Planche_10_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P14_Planche_10_DeFourcy_1858.tif

# Planche ../P15_Planche_11_DeFourcy_1858*
elif [ "$TiffSource" == ../P15_Planche_11_DeFourcy_1858* ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599000 126824 -gcp 0 "$HeightImage" 599000 126224  -gcp "$WidthImage" 0 600000 126824 -gcp "$WidthImage" "$HeightImage" 600000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P15_Planche_11_DeFourcy_1858.tif ]
then
mv ../_Output/P15_Planche_11_DeFourcy_1858.tif ../_TRASH_TEMP/P15_Planche_11_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha -overwrite temp.tif ../_Output/P15_Planche_11_DeFourcy_1858.tif

# Planche ../P16_Planche_12_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P16_Planche_12_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599000 126224 -gcp 0 "$HeightImage" 599000 125624  -gcp "$WidthImage" 0 600000 126224 -gcp "$WidthImage" "$HeightImage" 600000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P16_Planche_12_DeFourcy_1858.tif ]
then
mv ../_Output/P16_Planche_12_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P16_Planche_12_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P16_Planche_12_DeFourcy_1858.tif

# Planche ../P16_Planche_12_Encart_DeFourcy_1860.tif
elif [ "$TiffSource" == ../P16_Planche_12_Encart_DeFourcy_1860.tif ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 599559 125654 -gcp 0 "$HeightImage" 599559 125452.5  -gcp "$WidthImage" 0 599844.5 125654 -gcp "$WidthImage" "$HeightImage" 599844.5 125452.5 "$TiffSource" temp.tif
if [ -f ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif ]
then
mv ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif ../_TRASH_TEMP/"$FileDate"_P16_Planche_12_Encart_DeFourcy_1860.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha -overwrite temp.tif ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif

# Planche ../P17_Planche_13_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P17_Planche_13_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 598000 127424 -gcp 0 "$HeightImage" 598000 126824  -gcp "$WidthImage" 0 599000 127424 -gcp "$WidthImage" "$HeightImage" 599000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P17_Planche_13_DeFourcy_1858.tif ]
then
mv ../_Output/P17_Planche_13_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P17_Planche_13_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P17_Planche_13_DeFourcy_1858.tif

# Planche ../P18_Planche_14_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P18_Planche_14_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 598000 126824 -gcp 0 "$HeightImage" 598000 126224  -gcp "$WidthImage" 0 599000 126824 -gcp "$WidthImage" "$HeightImage" 599000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P18_Planche_14_DeFourcy_1858.tif ]
then
mv ../_Output/P18_Planche_14_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P18_Planche_14_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P18_Planche_14_DeFourcy_1858.tif

# Planche ../P19_Planche_15_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P19_Planche_15_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 597000 129824 -gcp 0 "$HeightImage" 597000 129224  -gcp "$WidthImage" 0 598000 129824 -gcp "$WidthImage" "$HeightImage" 598000 129224 "$TiffSource" temp.tif
if [ -f ../_Output/P19_Planche_15_DeFourcy_1858.tif ]
then
mv ../_Output/P19_Planche_15_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P19_Planche_15_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P19_Planche_15_DeFourcy_1858.tif


# Planche ../P20_Planche_16_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P20_Planche_16_DeFourcy_1858.tif ]
then

gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 596000 129824 -gcp 0 "$HeightImage" 596000 129224  -gcp "$WidthImage" 0 597000 129824 -gcp "$WidthImage" "$HeightImage" 597000 129224 "$TiffSource" temp.tif
if [ -f ../_Output/P20_Planche_16_DeFourcy_1858.tif ]
then
mv ../_Output/P20_Planche_16_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P20_Planche_16_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P20_Planche_16_DeFourcy_1858.tif

# Planche ../P21_Planche_17_DeFourcy_1858
elif [ "$TiffSource" == ../P21_Planche_17_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 596000 129224 -gcp 0 "$HeightImage" 596000 128424  -gcp "$WidthImage" 0 597000 129224 -gcp "$WidthImage" "$HeightImage" 597000 128424 "$TiffSource" temp.tif
if [ -f ../_Output/P21_Planche_17_DeFourcy_1858.tif ]
then
mv ../_Output/P21_Planche_17_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P21_Planche_17_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P21_Planche_17_DeFourcy_1858.tif

# Planche ../P00_Planche_0_Assemblage_DeFourcy_1958.tif
elif [ "$TiffSource" == ../P00_Planche_0_Assemblage_DeFourcy_1958.tif ]
then
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 596000 129824 -gcp 0 "$HeightImage" 596000 125024  -gcp "$WidthImage" 0 602000 129824 -gcp "$WidthImage" "$HeightImage" 602000 125024 "$TiffSource" temp.tif
if [ -f ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif ]
then
mv ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif ../_TRASH_TEMP/"$FileDate"_P00_Planche_0_Assemblage_DeFourcy_1958.tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif


#
# Fins des traitements particuliers
#

else

#
# Condition: if the filename corresponds to the pattern: Feuille-*
# Si c'est une planche IGC anciens numéros pre 1968
# Processing Gdal
# -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud"
#

if [ "$TiffSource" == ../Feuille-* ]
then
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
fi

#
# Condition: if the filename corresponds to the pattern: 25-50
# Si c'est une planche IGC nouveaux numéros post 1968
# Processing Gdal
# -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud"
#

if echo "$IGCPatternOrdinate" | grep '[0-9]"_"' &&  echo "$IGCPatternAbscissa" | grep '[0-9]'
then
echo "${green}---> IGC New Name Post --> 1968                       ${orange}"$IGCPatternOrdinate"-"$IGCPatternAbscissa""

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

#IDCFirst2Nbr
#
# Si c'est une planche IGC nouveaux numéros post 1968
#
else

echo $purple HELLO IDCThirdLetter $IDCThirdLetter IDCFirst2Nbr $IDCFirst2Nbr
if [[ $IDCFirst2Nbr =~ [0-9]{2} ]]||[[ $IDCThirdLetter =~ [A-B]{1} ]]
then
echo "${red}---> This file not an IGC New Name"
echo "${purple}---> This file not an IGC New Name TiffSource $TiffSource"

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
echo $purple MAP 77X
#IDCFirst2Nbr
echo "$purple IDCThirdLetter $IDCThirdLetter"
#^[0-9]{2}[A-Z]{1}$
fi
#
# Sous condition numéros 26K, 72Y,
#
#[A-Z]{2}\d{6}

#if [[ "$NameNoExt" =~ ^[0-9]+[A-Z]$* ]]
if [[ $IDCThirdLetter =~ [A-B] ]]
then
echo "${white}---> Numérotation du département de la Seine pre 1962 - ("${orange}""$Year")${green}      $NameNoExt"
else

echo $red NOOOOOOOOO $NameNoExt IDCThirdLetter $IDCThirdLetter
fi

#
## ASSEMBLAGE 1988 + 1962
#


if [ "$TiffSource" == "../Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif" ]
then
echo "${white}
            #############################################
            TABLEAU D'ASSEMBLAGE

            ÉCHELLE : 1:50 000

            de PARIS - des HAUTS-DE-SEINE - SEINE-SAINT-DENIS - VAL-DE-MARNE.

            NOTA : Le quadrillage du Tableau a pour origine un point situé, d'une part,
            sur le méridien de Paris et, d'autre part, sur un parallèle passant à l6 m 90

            Au Nord de la façade méridionale de l'Observatoire.
            Feuilles de l’Atlas des Carrières Souterraines de Paris.
            1988
"
gdal_translate -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 584500 146324  -gcp 0 "$HeightImage" 584500 109324 -gcp "$WidthImage" 0 621500 146324 -gcp "$WidthImage" "$HeightImage" 621500 109324 "$TiffSource" temp.tif
if [ -f ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif ]
then
mv ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif ../_TRASH_TEMP/"$FileDate"_Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif
fi
gdalwarp -r bilinear -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif
fi
fi

##mv temp.tif ../temp$NameNoExt.tif

##
#### Processing Feuille
##
#
#
#if [ "$TiffSource" == ../Feuille-[0-9]* ]
#then
#gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
#
#echo "$purple ###############################################################@
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@é"
#fi
#











fi

done

rm temp.tif











if [ -f "../_Atlas_des_Carrière_du_département_1962.tif" ]
then
echo "${white}
            #############################################

            INSPECTION GÉNÉRALE DES CARRIÈRES DE LA SEINE


            ATLAS DES CARRIÈRES SOUTERRAINES DU DÉPARTEMENT

            TABLEAU DASSEMBLAGE

            Echelle: 1 :50000.

            NOTA : Le quadrillage du Tableau a pour origine un point situé, d'une part,
            sur le méridien de Paris et, d'autre part, sur un parallèle passant à l6 m 90

            au Nord de la façade méridionale de l'Observatoire.
            Feuilles de l’Atlas des Carrières Souterraines de Paris.
"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 582000 141874 -gcp 0 "$HeightImage" 582000 113824 -gcp "$WidthImage" 0 617210 141874 -gcp "$WidthImage" "$HeightImage" 617210 113824 "../_Atlas_des_Carrière_du_département_1962.tif" temp.tif
if [ -f "../_Output/_Atlas_des_Carrière_du_département_1962.tif" ]
then
mv "../_Output/_Atlas_des_Carrière_du_département_1962.tif" "../_TRASH_TEMP/"$FileDate"_Atlas_des_Carrière_du_département_1962.tif"
fi

gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/_Atlas_des_Carrière_du_département_1962.tif"

fi



cd - 2>&1 &>/dev/null










#tesseract -l fra 25-50-2003.tif  Out.txt
# tesseract -l fra --dpi 300 25-50-2003.tif  Out.txt

#convert   -colorspace Gray NB.tif
# tesseract -l fra --dpi 300 NB.tif   Out.txt
#tesseract -l fra --dpi 72 NB.tif   Out.txt







# .md
#            ![](images/table 1-1.png)
#            to:
#
#            ![](images/table%201-1.png)
