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

for TiffSource in ../*.tif
do
# Definitions
FileDate=$(echo $(date +%Y_%m_%d_%Hh%Mm%Ss) | tr "/" "_")
#NameNoExt=$(echo "$TiffSource" | sed 's/.tif//g' | sed 's/..\///g')
Year=$( echo "$TiffSource" | tail -c -9 | awk -F'.tif' '{print $1}')

NameNoExt=$(echo "$TiffSource"|sed 's/.tif//g'| sed 's/..\///g'| sed 's/.....$//')
echo $purple $NameNoExt NameNoExt


if [ "$NameNoExt" == ../2222Y_*  ]
then
echo hello
elif [[ "$TiffSource" == "../26Y_"* ]]
then
Ordinate=10
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}${green}$Abscissa"

elif [[ "$TiffSource" == "../27A_"* ]]
then
Ordinate=11
Abscissa=31
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27B_"* ]]
then
Ordinate=12
Abscissa=31
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27F_"* ]]
then
Ordinate=11
Abscissa=32
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27K_"* ]]
then
Ordinate=11
Abscissa=33
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27L_"* ]]
then
Ordinate=12
Abscissa=33
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27P_"* ]]
then
Ordinate=11
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27Q_"* ]]
then
Ordinate=12
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../27X_"* ]]
then
Ordinate=14
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../35D_"* ]]
then
Ordinate=9
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../35O_"* ]]
then
Ordinate=10
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../35Y_"* ]]
then
Ordinate=11
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../36U_"* ]]
then
Ordinate=11
Abscissa=40
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../44E_"* ]]
then
Ordinate=10
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../45A_"* ]]
then
Ordinate=11
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../61Y_"* ]]
then
Ordinate=15
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62J_"* ]]
then
Ordinate=20
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62P_"* ]]
then
Ordinate=16
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62R_"* ]]
then
Ordinate=18
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62T_"* ]]
then
Ordinate=20
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62U_"* ]]
then
Ordinate=16
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62V_"* ]]
then
Ordinate=17
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../62Y_"* ]]
then
Ordinate=20
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63K_"* ]]
then
Ordinate=21
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63P_"* ]]
then
Ordinate=21
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63Q_"* ]]
then
Ordinate=22
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63R_"* ]]
then
Ordinate=23
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63U_"* ]]
then
Ordinate=21
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63V_"* ]]
then
Ordinate=22
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63W_"* ]]
then
Ordinate=23
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../63X_"* ]]
then
Ordinate=24
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../66K_"* ]]
then
Ordinate=36
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../70E_"* ]]
then
Ordinate=15
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../70J_"* ]]
then
Ordinate=15
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../70O_"* ]]
then
Ordinate=15
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71A_"* ]]
then
Ordinate=16
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71B_"* ]]
then
Ordinate=17
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71C_"* ]]
then
Ordinate=18
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71D_"* ]]
then
Ordinate=19
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71E_"* ]]
then
Ordinate=20
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71F_"* ]]
then
Ordinate=16
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71G_"* ]]
then
Ordinate=17
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71H_"* ]]
then
Ordinate=18
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71I_"* ]]
then
Ordinate=19
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71J_"* ]]
then
Ordinate=20
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71K_"* ]]
then
Ordinate=16
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71L_"* ]]
then
Ordinate=17
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71M_"* ]]
then
Ordinate=18
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71N_"* ]]
then
Ordinate=19
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71O_"* ]]
then
Ordinate=20
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71R_"* ]]
then
Ordinate=18
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71S_"* ]]
then
Ordinate=19
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71T_"* ]]
then
Ordinate=20
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71W_"* ]]
then
Ordinate=18
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71V_"* ]]
then
Ordinate=17
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"



elif [[ "$TiffSource" == "../71X_"* ]]
then
Ordinate=19
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../71Y_"* ]]
then
Ordinate=20
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72A_"* ]]
then
Ordinate=21
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72B_"* ]]
then
Ordinate=22
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72C_"* ]]
then
Ordinate=23
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72D_"* ]]
then
Ordinate=24
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72F_"* ]]
then
Ordinate=21
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72G_"* ]]
then
Ordinate=22
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72H_"* ]]
then
Ordinate=23
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72I_"* ]]
then
Ordinate=24
Abscissa=57
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72K_"* ]]
then
Ordinate=21
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72L_"* ]]
then
Ordinate=22
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72M_"* ]]
then
Ordinate=23
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72N_"* ]]
then
Ordinate=24
Abscissa=58
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72P_"* ]]
then
Ordinate=21
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72Q_"* ]]
then
Ordinate=22
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72R_"* ]]
then
Ordinate=23
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72S_"* ]]
then
Ordinate=24
Abscissa=59
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72U_"* ]]
then
Ordinate=21
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72V_"* ]]
then
Ordinate=22
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72W_"* ]]
then
Ordinate=23
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../72X_"* ]]
then
Ordinate=24
Abscissa=60
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../73D_"* ]]
then
Ordinate=29
Abscissa=56
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../80C_"* ]]
then
Ordinate=18
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../80D_"* ]]
then
Ordinate=19
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../80E_"* ]]
then
Ordinate=20
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../80J_"* ]]
then
Ordinate=20
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81A_"* ]]
then
Ordinate=21
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81B_"* ]]
then
Ordinate=22
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81C_"* ]]
then
Ordinate=23
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81F_"* ]]
then
Ordinate=21
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81G_"* ]]
then
Ordinate=22
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81H_"* ]]
then
Ordinate=23
Abscissa=62
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81L_"* ]]
then
Ordinate=22
Abscissa=63
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../81D_"* ]]
then
Ordinate=24
Abscissa=61
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-147_"* ]]
then
Ordinate=19
Abscissa=43
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../95D_"* ]]
then
Ordinate=19
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../95E_"* ]]
then
Ordinate=20
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../95I_"* ]]
then
Ordinate=19
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../95J_"* ]]
then
Ordinate=20
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../96A_"* ]]
then
Ordinate=21
Abscissa=71
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../96F_"* ]]
then
Ordinate=21
Abscissa=72
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

#
## Ancienne Numérotation / EXEMPLE: Feuille 25-50 = Feuille 281
#

elif [[ "$TiffSource" == "../Feuille-14_"* ]]||[[ "$TiffSource" == "../29T_"* ]]
then
Ordinate=25
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-15_"* ]]||[[ "$TiffSource" == "../30P_"* ]]
then
Ordinate=26
Abscissa=34
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-26_"* ]]||[[ "$TiffSource" == "../29Y_"* ]]
then
Ordinate=25
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-27_"* ]]||[[ "$TiffSource" == "../30U_"* ]]
then
Ordinate=26
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-28_"* ]]||[[ "$TiffSource" == "../30V_"* ]]
then
Ordinate=27
Abscissa=35
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"


elif [[ "$TiffSource" =~ "../36K_"* ]]
then
Ordinate=11
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" =~ "../36P_"* ]]
then
Ordinate=11
Abscissa=39
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" =~ "../18Q_"* ]]
then
Ordinate=12
Abscissa=29
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-39_"* ]]||[[ "$TiffSource" == "../38E_"* ]]
then
Ordinate=25
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-40_"* ]]||[[ "$TiffSource" == "../39A_"* ]]
then
Ordinate=26
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-41_"* ]]||[[ "$TiffSource" == "../39B_"* ]]
then
Ordinate=27
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-42_"* ]]||[[ "$TiffSource" == "../39C_"* ]]
then
Ordinate=28
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-45_"* ]]||[[ "$TiffSource" == "../40A_"* ]]
then
Ordinate=31
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-46_"* ]]||[[ "$TiffSource" == "../40B_"* ]]
then
Ordinate=32
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-253_"* ]]||[[ "$TiffSource" == "../57L_"* ]]
then
Ordinate=32
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-47_"* ]]||[[ "$TiffSource" == "../40C_"* ]]
then
Ordinate=33
Abscissa=36
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-53_"* ]]||[[ "$TiffSource" == "../39F_"* ]]
then
Ordinate=26
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-54_"* ]]||[[ "$TiffSource" == "../39G_"* ]]
then
Ordinate=27
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-55_"* ]]||[[ "$TiffSource" == "../39H_"* ]]
then
Ordinate=28
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-57_"* ]]||[[ "$TiffSource" == "../39J_"* ]]
then
Ordinate=30
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-58_"* ]]||[[ "$TiffSource" == "../40F_"* ]]
then
Ordinate=31
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-60_"* ]]||[[ "$TiffSource" == "../40H_"* ]]
then
Ordinate=33
Abscissa=37
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-72_"* ]]||[[ "$TiffSource" == "../39O_"* ]]
then
Ordinate=30
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-73_"* ]]||[[ "$TiffSource" == "../40K_"* ]]
then
Ordinate=31
Abscissa=38
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-77_"* ]]||[[ "$TiffSource" == "../37S_"* ]]
then
Ordinate=19
Abscissa=39
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-88_"* ]]||[[ "$TiffSource" == "../39T_"* ]]
then
Ordinate=30
Abscissa=39
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-89_"* ]]||[[ "$TiffSource" == "../40P_"* ]]
then
Ordinate=31
Abscissa=39
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-106_"* ]]||[[ "$TiffSource" == "../40U_"* ]]
then
Ordinate=31
Abscissa=40
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-107_"* ]]||[[ "$TiffSource" == "../40V_"* ]]
then
Ordinate=32
Abscissa=40
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-110_"* ]]||[[ "$TiffSource" == "../46C_"* ]]
then
Ordinate=18
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-111_"* ]]||[[ "$TiffSource" == "../46D_"* ]]
then
Ordinate=19
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-112_"* ]]||[[ "$TiffSource" == "../46E_"* ]]
then
Ordinate=20
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-113_"* ]]||[[ "$TiffSource" == "../47A_"* ]]
then
Ordinate=33-37
Abscissa=41
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-128_"* ]]||[[ "$TiffSource" == "../46H_"* ]]
then
Ordinate=18
Abscissa=42
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-129_"* ]]||[[ "$TiffSource" == "../46I_"* ]]
then
Ordinate=19
Abscissa=42
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-130_"* ]]||[[ "$TiffSource" == "../46J_"* ]]
then
Ordinate=20
Abscissa=42
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-142_"* ]]||[[ "$TiffSource" == "../49G_"* ]]
then
Ordinate=32
Abscissa=42
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-143_"* ]]||[[ "$TiffSource" == "../49H_"* ]]
then
Ordinate=33
Abscissa=42
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-146_"* ]]||[[ "$TiffSource" == "../46M_"* ]]
then
Ordinate=18
Abscissa=43
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-160_"* ]]||[[ "$TiffSource" == "../49L_"* ]]
then
Ordinate=32
Abscissa=43
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-161_"* ]]||[[ "$TiffSource" == "../49M_"* ]]
then
Ordinate=33
Abscissa=43
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-162_"* ]]||[[ "$TiffSource" == "../49N_"* ]]
then
Ordinate=34
Abscissa=43
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-164_"* ]]||[[ "$TiffSource" == "../46R_"* ]]
then
Ordinate=18
Abscissa=44
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-165_"* ]]||[[ "$TiffSource" == "../46S_"* ]]
then
Ordinate=19
Abscissa=44
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-207_"* ]]||[[ "$TiffSource" == "../55D_"* ]]
then
Ordinate=24
Abscissa=46
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-208_"* ]]||[[ "$TiffSource" == "../55E_"* ]]
then
Ordinate=25
Abscissa=46
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-209_"* ]]||[[ "$TiffSource" == "../56A_"* ]]
then
Ordinate=26
Abscissa=46
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-225_"* ]]||[[ "$TiffSource" == "../55H_"* ]]
then
Ordinate=23
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-226_"* ]]||[[ "$TiffSource" == "../55I_"* ]]
then
Ordinate=24
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-227_"* ]]||[[ "$TiffSource" == "../55J_"* ]]
then
Ordinate=25
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-228_"* ]]||[[ "$TiffSource" == "../56F_"* ]]
then
Ordinate=26
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-229_"* ]]||[[ "$TiffSource" == "../56G_"* ]]
then
Ordinate=27
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-230_"* ]]||[[ "$TiffSource" == "../56H_"* ]]
then
Ordinate=28
Abscissa=47
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-244_"* ]]||[[ "$TiffSource" == "../55M_"* ]]
then
Ordinate=23
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-245_"* ]]||[[ "$TiffSource" == "../55N_"* ]]
then
Ordinate=24
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-246_"* ]]||[[ "$TiffSource" == "../55O_"* ]]
then
Ordinate=25
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-247_"* ]]||[[ "$TiffSource" == "../56K_"* ]]
then
Ordinate=26
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-248_"* ]]||[[ "$TiffSource" == "../56L_"* ]]
then
Ordinate=27
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-249_"* ]]||[[ "$TiffSource" == "../56M_"* ]]
then
Ordinate=28
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-261_"* ]]||[[ "$TiffSource" == "../55P_"* ]]
then
Ordinate=21
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-262_"* ]]||[[ "$TiffSource" == "../55Q_"* ]]
then
Ordinate=22
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-263_"* ]]||[[ "$TiffSource" == "../55R_"* ]]
then
Ordinate=23
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-264_"* ]]||[[ "$TiffSource" == "../55S_"* ]]
then
Ordinate=24
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-265_"* ]]||[[ "$TiffSource" == "../55T_"* ]]
then
Ordinate=25
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-266_"* ]]||[[ "$TiffSource" == "../56P_"* ]]
then
Ordinate=26
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-267_"* ]]||[[ "$TiffSource" == "../56Q_"* ]]
then
Ordinate=27
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-268_"* ]]||[[ "$TiffSource" == "../56R_"* ]]
then
Ordinate=28
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-269_"* ]]||[[ "$TiffSource" == "../56S_"* ]]
then
Ordinate=29
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-272_"* ]]||[[ "$TiffSource" == "../57Q_"* ]]
then
Ordinate=32
Abscissa=49
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-276_"* ]]||[[ "$TiffSource" == "../54Y_"* ]]
then
Ordinate=20
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-277_"* ]]||[[ "$TiffSource" == "../55U_"* ]]
then
Ordinate=21
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-278_"* ]]||[[ "$TiffSource" == "../55V_"* ]]
then
Ordinate=22
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-279_"* ]]||[[ "$TiffSource" == "../55W_"* ]]
then
Ordinate=23
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-280_"* ]]||[[ "$TiffSource" == "../55X_"* ]]
then
Ordinate=24
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-281_"* ]]||[[ "$TiffSource" == "../55Y_"* ]]
then
Ordinate=25
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-282_"* ]]||[[ "$TiffSource" == "../56U_"* ]]
then
Ordinate=26
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-283_"* ]]||[[ "$TiffSource" == "../56V_"* ]]
then
Ordinate=27
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-284_"* ]]||[[ "$TiffSource" == "../56W_"* ]]
then
Ordinate=28
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-285_"* ]]||[[ "$TiffSource" == "../56X_"* ]]
then
Ordinate=29
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-288_"* ]]||[[ "$TiffSource" == "../57V_"* ]]
then
Ordinate=32
Abscissa=50
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-291_"* ]]||[[ "$TiffSource" == "../62E_"* ]]
then
Ordinate=20
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-292_"* ]]||[[ "$TiffSource" == "../63A_"* ]]
then
Ordinate=21
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-243_"* ]]||[[ "$TiffSource" == "../55L_"* ]]
then
Ordinate=22
Abscissa=48
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-293_"* ]]||[[ "$TiffSource" == "../63B_"* ]]
then
Ordinate=22
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-294_"* ]]||[[ "$TiffSource" == "../63C_"* ]]
then
Ordinate=23
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-295_"* ]]||[[ "$TiffSource" == "../63D_"* ]]
then
Ordinate=24
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"



elif [[ "$TiffSource" == "../Feuille-296_"* ]]||[[ "$TiffSource" == "../63E_"* ]]
then
Ordinate=25
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-297_"* ]]||[[ "$TiffSource" == "../64A_"* ]]
then
Ordinate=26
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-298_"* ]]||[[ "$TiffSource" == "../64B_"* ]]
then
Ordinate=27
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-299_"* ]]||[[ "$TiffSource" == "../64C_"* ]]
then
Ordinate=28
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-300_"* ]]||[[ "$TiffSource" == "../64D_"* ]]
then
Ordinate=29
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-301_"* ]]||[[ "$TiffSource" == "../64E_"* ]]
then
Ordinate=30
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-304-bis_"* ]]||[[ "$TiffSource" == "../66A_"* ]]
then
Ordinate=36
Abscissa=51
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-305_"* ]]||[[ "$TiffSource" == "../63F_"* ]]
then
Ordinate=21
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-306"* ]]||[[ "$TiffSource" == "../63G_"* ]]
then
Ordinate=22
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-307_"* ]]||[[ "$TiffSource" == "../63H_"* ]]
then
Ordinate=23
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-308_"* ]]||[[ "$TiffSource" == "../63I_"* ]]
then
Ordinate=24
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-309_"* ]]||[[ "$TiffSource" == "../63J_"* ]]
then
Ordinate=25
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-310_"* ]]||[[ "$TiffSource" == "../64F_"* ]]
then
Ordinate=26
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-311_"* ]]||[[ "$TiffSource" == "../64G_"* ]]
then
Ordinate=27
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-312_"* ]]||[[ "$TiffSource" == "../64H_"* ]]
then
Ordinate=28
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-313_"* ]]||[[ "$TiffSource" == "../64I_"* ]]
then
Ordinate=29
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-314_"* ]]||[[ "$TiffSource" == "../64J_"* ]]
then
Ordinate=30
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-314-bis_"* ]]||[[ "$TiffSource" == "../66F_"* ]]
then
Ordinate=36
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-315_"* ]]||[[ "$TiffSource" == "../63L_"* ]]
then
Ordinate=22
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-316_"* ]]||[[ "$TiffSource" == "../63M_"* ]]
then
Ordinate=23
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-317_"* ]]||[[ "$TiffSource" == "../63N_"* ]]
then
Ordinate=24
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-318_"* ]]||[[ "$TiffSource" == "../63O_"* ]]
then
Ordinate=25
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-319_"* ]]||[[ "$TiffSource" == "../64K_"* ]]
then
Ordinate=26
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-320_"* ]]||[[ "$TiffSource" == "../64L_"* ]]
then
Ordinate=27
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-321_"* ]]||[[ "$TiffSource" == "../64M_"* ]]
then
Ordinate=28
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-322_"* ]]||[[ "$TiffSource" == "../64N_"* ]]
then
Ordinate=29
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-323_"* ]]||[[ "$TiffSource" == "../64O_"* ]]
then
Ordinate=30
Abscissa=53
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-324_"* ]]||[[ "$TiffSource" == "../63S_"* ]]
then
Ordinate=24
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-325_"* ]]||[[ "$TiffSource" == "../63T_"* ]]
then
Ordinate=25
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-326_"* ]]||[[ "$TiffSource" == "../64P_"* ]]
then
Ordinate=26
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-327_"* ]]||[[ "$TiffSource" == "../64Q_"* ]]
then
Ordinate=27
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-328_"* ]]||[[ "$TiffSource" == "../64R_"* ]]
then
Ordinate=28
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-329_"* ]]||[[ "$TiffSource" == "../64S_"* ]]
then
Ordinate=29
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-330_"* ]]||[[ "$TiffSource" == "../64T_"* ]]
then
Ordinate=30
Abscissa=54
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-331_"* ]]||[[ "$TiffSource" == "../63Y_"* ]]
then
Ordinate=25
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-332_"* ]]||[[ "$TiffSource" == "../64U_"* ]]
then
Ordinate=26
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-334_"* ]]||[[ "$TiffSource" == "../64W_"* ]]
then
Ordinate=28
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../Feuille-335_"* ]]||[[ "$TiffSource" == "../64X_"* ]]
then
Ordinate=29
Abscissa=55
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

elif [[ "$TiffSource" == "../65I_"* ]]
then
Ordinate=34
Abscissa=52
echo "${white}---> Ordinate substitut : ${green}$Ordinate"
echo "${white}---> Abscissa substitut : ${green}$Abscissa"

# END Abscissa FIX
else

Ordinate=$(echo $NameNoExt | awk -F'-' '{print $1}'| tr -d ' ' | sed 's/..\///g')
Abscissa=$(echo $NameNoExt | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}'| sed 's/..\///g')
# END Abscissa
fi
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

#Début
#Cas Particuliers

if [[ "$TiffSource" =~ "../3-4-41_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co COMPRESS=NONE -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 586500 129824 -gcp 0 "$HeightImage" 586500 129424 -gcp "$WidthImage" 0 587100 129824 -gcp "$WidthImage" "$HeightImage" 587100 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# PLAN DES CARRIERES DU DEPARTEMENT DES HAUTS DE SEINE
elif [[ "$TiffSource" == ../Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif ]]
then
echo "${white} #############################################

            INSPECTION GÉNÉRALE DES CARRIÈRES
            
            PLAN DES CARRIERES DU DEPARTEMENT DES HAUTS DE SEINE

            PARTIE SUD

            Echelle: 1/20 000
"
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 585200 127800 -gcp 0 "$HeightImage" 585200 113700 -gcp "$WidthImage" 0 600800 127800 -gcp "$WidthImage" "$HeightImage" 600800 113700 "../Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif" temp.tif
if [ -f "../_Output/Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif" ]
then
mv "../_Output/Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif" "../_TRASH_TEMP/"$FileDate"_Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif"
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/Plan_des_Carrieres_du_departement_des_Hauts_de_seine_partie_sud_1989.tif"



elif [[ "$TiffSource" =~ "../8-9-51-52_"* ]]
then
gdal_translate -co COMPRESS=NONE -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 589500 125624 -gcp 0 "$HeightImage" 589500 125224 -gcp "$WidthImage" 0 590100 125624 -gcp "$WidthImage" "$HeightImage" 590100 125224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../07-58-union_*
elif [[ "$TiffSource" =~ "../07-58-union_"* ]]||[[ "$TiffSource" =~ "../44S-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 588500 123024 -gcp 0 "$HeightImage" 588500 122524 -gcp "$WidthImage" 0 589200 123024 -gcp "$WidthImage" "$HeightImage" 589200 122524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16



# Planche ../Feuille-161-union_*
elif [[ "$TiffSource" =~ "../Feuille-161-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604200 129024 -gcp 0 "$HeightImage" 604200 128524 -gcp "$WidthImage" 0 604900 129024 -gcp "$WidthImage" "$HeightImage" 604900 128524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16


# Planche ../Feuille-106-union_*
elif [[ "$TiffSource" == "../Feuille-106-107-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 603100 130224 -gcp 0 "$HeightImage" 603100 129824 -gcp "$WidthImage" 0 603800 130224 -gcp "$WidthImage" "$HeightImage" 603800 129824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../Feuille-106-107_*
elif [[ "$TiffSource" == "../Feuille-106-107_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 603100 130224 -gcp 0 "$HeightImage" 603100 129824 -gcp "$WidthImage" 0 603700 130224 -gcp "$WidthImage" "$HeightImage" 603700 129824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16
# Planche ../08-44-union_*
elif [[ "$TiffSource" =~ "../08-44-union_"* ]]||[[ "$TiffSource" =~ "../44S-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 589200 128624 -gcp 0 "$HeightImage" 589200 128124 -gcp "$WidthImage" 0 589800 128624 -gcp "$WidthImage" "$HeightImage" 589800 128124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../12-30-union_*
elif [[ "$TiffSource" =~ "../12-30-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 591500 134224 -gcp 0 "$HeightImage" 591500 133824 -gcp "$WidthImage" 0 592200 134224 -gcp "$WidthImage" "$HeightImage" 592200 133824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif -dstalpha "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche 29-37
elif [[ "$TiffSource" =~ "../29-37_"* ]]||[[ "$TiffSource" =~ "../Feuille-56_"* ]]||[[ "$TiffSource" =~ "../39I_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 601800 131524 -gcp 0 "$HeightImage" 601800 131024 -gcp "$WidthImage" 0 602400 131524 -gcp "$WidthImage" "$HeightImage" 602400 131024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche 29-38-union_*
elif [[ "$TiffSource" =~ "../29-38-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-71-union_"* ]]||[[ "$TiffSource" =~ "../39N-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601800 131024 -gcp 0 "$HeightImage" 601800 130524 -gcp "$WidthImage" 0 602400 131024 -gcp "$WidthImage" "$HeightImage" 602400 130524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16


# Planche 28-37_*
elif [[ "$TiffSource" =~ "../28-37_"* ]]||[[ "$TiffSource" =~ "../Feuille-55_"* ]]||[[ "$TiffSource" =~ "../39H_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 601200 131424 -gcp 0 "$HeightImage" 601200 130924 -gcp "$WidthImage" 0 601800 131424 -gcp "$WidthImage" "$HeightImage" 601800 130924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche 28-56-union_*
elif [[ "$TiffSource" =~ "../28-56-union_"* ]]||[[ "$TiffSource" =~ "../73C-union_"* ]]
then
echo "${orange}---> Cas Particuliers - Transformation fixe $TiffSource ${reset}"
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601100 123824 -gcp 0 "$HeightImage" 601100 123424 -gcp "$WidthImage" 0 601800 123824 -gcp "$WidthImage" "$HeightImage" 601800 123424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../71P_* or ../15-16-59_*
elif [[ "$TiffSource" =~ "../71P_"* ]]||[[ "$TiffSource" =~ "../15-16-59_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 593800 122624 -gcp 0 "$HeightImage" 593800 122224 -gcp "$WidthImage" 0 594400 122624 -gcp "$WidthImage" "$HeightImage" 594400 122224 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif

fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../17-60-union_*
elif [[ "$TiffSource" =~ "../71V-union_"* ]]||[[ "$TiffSource" =~ "../17-60-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 594600 122324 -gcp 0 "$HeightImage" 594600 121624 -gcp "$WidthImage" 0 595200 122324 -gcp "$WidthImage" "$HeightImage" 595200 121624 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../12-54-55_*
elif [[ "$TiffSource" =~ "../12-54-55_"* ]]||[[ "$TiffSource" =~ "../61Q-V_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 591600 124424 -gcp 0 "$HeightImage" 591600 124024 -gcp "$WidthImage" 0 592200 124424 -gcp "$WidthImage" "$HeightImage" 592200 124024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16
#
## Planche ../07-39-union_*
#elif [[ "$TiffSource" =~ "../07-39-union_"* ]]||[[ "$TiffSource" =~ "../35Q-union_"* ]]
#then
#gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 588600 130724 -gcp 0 "$HeightImage" 588600 130224 -gcp "$WidthImage" 0 589200 130724 -gcp "$WidthImage" "$HeightImage" 589200 130224 "$TiffSource" temp.tif
#
#if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
#then
#mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
#fi
#gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../07-39-union_*
elif [[ "$TiffSource" =~ "../07-39-union_"* ]]||[[ "$TiffSource" =~ "../35Q-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 588600 130724 -gcp 0 "$HeightImage" 588600 130224 -gcp "$WidthImage" 0 589200 130724 -gcp "$WidthImage" "$HeightImage" 589200 130224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

## Planche ../19-43-union_1957_*
elif [[ "$TiffSource" =~ "../19-43-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-147-union_"* ]]||[[ "$TiffSource" =~ "../46N-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-147-148-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 595800 129024 -gcp 0 "$HeightImage" 595800 128624 -gcp "$WidthImage" 0 596500 129024 -gcp "$WidthImage" "$HeightImage" 596500 128624 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../Feuille-93_* 18-40-19
elif [[ "$TiffSource" =~ "../Feuille-93_"* ]]||[[ "$TiffSource" =~ "../18-40-19_"* ]]||[[ "$TiffSource" =~ "../37W-X_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 595500 130224 -gcp 0 "$HeightImage" 595500 129824 -gcp "$WidthImage" 0 596100 130224 -gcp "$WidthImage" "$HeightImage" 596100 129824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../10-35-union_*
elif [[ "$TiffSource" =~ "../10-35-union_"* ]]||[[ "$TiffSource" =~ "../26Y-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 590400 132324 -gcp 0 "$HeightImage" 590400 131824 -gcp "$WidthImage" 0 591000 132324 -gcp "$WidthImage" "$HeightImage" 591000 131824 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16


# Planche ../20-51-union_* Feuille-291-union
elif [[ "$TiffSource" =~ "../20-51-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-291-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596400 125824 -gcp 0 "$HeightImage" 596400 125324 -gcp "$WidthImage" 0 597000 125824 -gcp "$WidthImage" "$HeightImage" 597000 125324 "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../Feuille-276-277_*
elif [[ "$TiffSource" =~ "../Feuille-276-277_"* ]]
then
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596800 126224 -gcp 0 "$HeightImage" 596800 125824 -gcp "$WidthImage" 0 597600 126224 -gcp "$WidthImage" "$HeightImage" 597600 125824 "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../20-71-union_*
elif [[ "$TiffSource" =~ "../20-71-union_"* ]]||[[ "$TiffSource" =~ "../95E-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596400 117924 -gcp 0 "$HeightImage" 596400 117424 -gcp "$WidthImage" 0 597000 117924 -gcp "$WidthImage" "$HeightImage" 597000 117424 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../21-41-union_*
elif [[ "$TiffSource" =~ "../21-41-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-113-union_"* ]]||[[ "$TiffSource" =~ "../47A-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 597000 130024 -gcp 0 "$HeightImage" 597000 129424 -gcp "$WidthImage" 0 597600 130024 -gcp "$WidthImage" "$HeightImage" 597600 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../22-48-union_*
elif [[ "$TiffSource" =~ "../22-48-union_"* ]]||[[ "$TiffSource" =~ "../55L-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-243-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 597600 127124 -gcp 0 "$HeightImage" 597600 126624 -gcp "$WidthImage" 0 598200 127124 -gcp "$WidthImage" "$HeightImage" 598200 126624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../26-46-union_*
elif [[ "$TiffSource" =~ "../26-46-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-209-union_"* ]]||[[ "$TiffSource" =~ "../56A-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 127924 -gcp 0 "$HeightImage" 600000 127424 -gcp "$WidthImage" 0 600600 127924 -gcp "$WidthImage" "$HeightImage" 600600 127424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../26-56-union_*
elif [[ "$TiffSource" =~ "../26-56-union_"* ]]||[[ "$TiffSource" =~ "../73A-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 123824 -gcp 0 "$HeightImage" 600000 123424 -gcp "$WidthImage" 0 600700 123824 -gcp "$WidthImage" "$HeightImage" 600700 123424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../26-57-union_
elif [[ "$TiffSource" =~ "../27-57-union_"* ]]||[[ "$TiffSource" =~ "../73G-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600600 123524 -gcp 0 "$HeightImage" 600600 123024 -gcp "$WidthImage" 0 601200 123524 -gcp "$WidthImage" "$HeightImage" 601200 123024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../22-63-union_*
elif [[ "$TiffSource" =~ "../22-63-union_"* ]]||[[ "$TiffSource" =~ "../81L-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 597600 121024 -gcp 0 "$HeightImage" 597600 120624 -gcp "$WidthImage" 0 598400 121024 -gcp "$WidthImage" "$HeightImage" 598400 120624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../25-67-union_*
elif [[ "$TiffSource" =~ "../25-67-union_"* ]]||[[ "$TiffSource" =~ "../89J-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599300 119424 -gcp 0 "$HeightImage" 599300 119024 -gcp "$WidthImage" 0 600000 119424 -gcp "$WidthImage" "$HeightImage" 600000 119024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../28-12-13_
elif [[ "$TiffSource" =~ "../28-12-13_"* ]]||[[ "$TiffSource" =~ "../3H-M_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 601200 141224 -gcp 0 "$HeightImage" 601200 140824 -gcp "$WidthImage" 0 601800 141224 -gcp "$WidthImage" "$HeightImage" 601800 140824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../30-55-union_*
elif [[ "$TiffSource" =~ "../30-55-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-59_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 602400 124224 -gcp 0 "$HeightImage" 602400 123824 -gcp "$WidthImage" 0 603100 124224 -gcp "$WidthImage" "$HeightImage" 603100 123824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../32-33-41-union
elif [[ "$TiffSource" =~ "../32-33-41-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-124-125-union_"* ]]||[[ "$TiffSource" =~ "../49B-C-union"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 603700 129924 -gcp 0 "$HeightImage" 603700 129424 -gcp "$WidthImage" 0 604400 129924 -gcp "$WidthImage" "$HeightImage" 604400 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../32-33-41_
elif [[ "$TiffSource" =~ "../32-33-41_"* ]]||[[ "$TiffSource" =~ "../Feuille-124_"* ]]||[[ "$TiffSource" =~ "../49B-C_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 603700 129824 -gcp 0 "$HeightImage" 603700 129424 -gcp "$WidthImage" 0 604300 129824 -gcp "$WidthImage" "$HeightImage" 604300 129424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../32-37_*
elif [[ "$TiffSource" =~ "../32-37_"* ]]||[[ "$TiffSource" =~ "../Feuille-59_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 603600 131424 -gcp 0 "$HeightImage" 603600 131024 -gcp "$WidthImage" 0 604200 131424 -gcp "$WidthImage" "$HeightImage" 604200 131024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../32-37-union_*
elif [[ "$TiffSource" =~ "../32-37-union"* ]]||[[ "$TiffSource" =~ "../Feuille-59-union"* ]]||[[ "$TiffSource" =~ "../40G-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 603600 131424 -gcp 0 "$HeightImage" 603600 130924 -gcp "$WidthImage" 0 604200 131424 -gcp "$WidthImage" "$HeightImage" 604200 130924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33-34-51_*
elif [[ "$TiffSource" =~ "../33-34-51_"* ]]||[[ "$TiffSource" =~ "../Feuille-304_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 604300 125824 -gcp 0 "$HeightImage" 604300 125424 -gcp "$WidthImage" 0 604900 125824 -gcp "$WidthImage" "$HeightImage" 604900 125424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33-37-union_*
elif [[ "$TiffSource" =~ "../33-37-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-60-union_"* ]]||[[ "$TiffSource" =~ "../40H-union_"* ]]
then
gdal_translate  -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 604200 131424 -gcp 0 "$HeightImage" 604200 130924 -gcp "$WidthImage" 0 604800 131424 -gcp "$WidthImage" "$HeightImage" 604800 130924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33_44-union_*
elif [[ "$TiffSource" =~ "../33-44-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-179-union_"* ]]||[[ "$TiffSource" =~ "../49R-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604100 128624 -gcp 0 "$HeightImage" 604100 128224 -gcp "$WidthImage" 0 604900 128624 -gcp "$WidthImage" "$HeightImage" 604900 128224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33-48-49-union_*
elif [[ "$TiffSource" =~ "../33-48-49-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-273-union_"* ]]||[[ "$TiffSource" =~ "../57M-R-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604200 126824 -gcp 0 "$HeightImage" 604200 126224 -gcp "$WidthImage" 0 604800 126824 -gcp "$WidthImage" "$HeightImage" 604800 126224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33-48-49_*
elif [[ "$TiffSource" =~ "../33-48-49_"* ]]||[[ "$TiffSource" =~ "../Feuille-273_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604200 126724 -gcp 0 "$HeightImage" 604200 126324 -gcp "$WidthImage" 0 604800 126724 -gcp "$WidthImage" "$HeightImage" 604800 126324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../33-48-49_*
elif [[ "$TiffSource" =~ "../33-48-49-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-254-273-union"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604200 126824 -gcp 0 "$HeightImage" 604200 126224 -gcp "$WidthImage" 0 604800 126824 -gcp "$WidthImage" "$HeightImage" 604800 126224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../36-40-41_*
elif [[ "$TiffSource" =~ "../36-40-41_"* ]]||[[ "$TiffSource" =~ "../41U-50A_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 606000 130124 -gcp 0 "$HeightImage" 606000 129724 -gcp "$WidthImage" 0 606600 130124 -gcp "$WidthImage" "$HeightImage" 606600 129724 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../36-42-43_*
elif [[ "$TiffSource" =~ "../36-42-43_"* ]]||[[ "$TiffSource" =~ "../50F-N_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 606000 129324 -gcp 0 "$HeightImage" 606000 128924 -gcp "$WidthImage" 0 606600 129324 -gcp "$WidthImage" "$HeightImage" 606600 128924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../39-43-44_*
elif [[ "$TiffSource" =~ "../39-43-44_"* ]]||[[ "$TiffSource" =~ "../50N-S_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 607800 128824 -gcp 0 "$HeightImage" 607800 128424 -gcp "$WidthImage" 0 608400 128824 -gcp "$WidthImage" "$HeightImage" 608400 128424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../39-44-45_*
elif [[ "$TiffSource" =~ "../39-44-45_"* ]]||[[ "$TiffSource" =~ "../50S-X_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 607800 128424 -gcp 0 "$HeightImage" 607800 128024 -gcp "$WidthImage" 0 608400 128424 -gcp "$WidthImage" "$HeightImage" 608400 128024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../41-45-42-Encart*
elif [[ "$TiffSource" =~ "../41-45-42-Encart"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 609347 128673 -gcp 0 "$HeightImage" 609347 128570 -gcp "$WidthImage" 0 609500 128673 -gcp "$WidthImage" "$HeightImage" 609500 128570 "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -overwrite -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/41-45-42-Encart_"$Year".tif
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../41-45-42-union*
# La planche sans l'encart, mais avec l'alpha
elif [[ "$TiffSource" == ../41-45-42-union_* ]]||[[ "$TiffSource" =~ "../51U-V-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 609300 128224 -gcp 0 "$HeightImage" 609300 127824 -gcp "$WidthImage" 0 609900 128224 -gcp "$WidthImage" "$HeightImage" 609900 127824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../41-45-42_*
elif [[ "$TiffSource" =~ "../41-45-42_"* ]]||[[ "$TiffSource" =~ "../51U-V_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 609300 128224 -gcp 0 "$HeightImage" 609300 127824 -gcp "$WidthImage" 0 609900 128224 -gcp "$WidthImage" "$HeightImage" 609900 127824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../41-42-46_*
elif [[ "$TiffSource" =~ "../41-42-46_"* ]]||[[ "$TiffSource" =~ "../59A-B_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 609300 127824 -gcp 0 "$HeightImage" 609300 127424 -gcp "$WidthImage" 0 609900 127824 -gcp "$WidthImage" "$HeightImage" 609900 127424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../42-43-60_*
elif [[ "$TiffSource" =~ "../42-43-60_"* ]]||[[ "$TiffSource" =~ "../76V-W_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 609900 122224 -gcp 0 "$HeightImage" 609900 121824 -gcp "$WidthImage" 0 610500 122224 -gcp "$WidthImage" "$HeightImage" 610500 121824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../42-67-union_*
elif [[ "$TiffSource" =~ "../42-67-union_"* ]]||[[ "$TiffSource" =~ "../76V-W_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 609600 119424 -gcp 0 "$HeightImage" 609600 118924 -gcp "$WidthImage" 0 610200 119424 -gcp "$WidthImage" "$HeightImage" 610200 118924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16


# Planche ../34-35-38_*
elif [[ "$TiffSource" =~ "../34-35-38_"* ]]||[[ "$TiffSource" =~ "../Feuille-76_"* ]]||[[ "$TiffSource" =~ "../40N-O_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 605100 131024 -gcp 0 "$HeightImage" 605100 130624 -gcp "$WidthImage" 0 605700 131024 -gcp "$WidthImage" "$HeightImage" 605700 130624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../34-41-42_*
elif [[ "$TiffSource" =~ "../34-41-42_"* ]]||[[ "$TiffSource" =~ "../49D-I_"* ]]||[[ "$TiffSource" =~ "../Feuille-126-144_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 604800 129724 -gcp 0 "$HeightImage" 604800 129324 -gcp "$WidthImage" 0 605400 129724 -gcp "$WidthImage" "$HeightImage" 605400 129324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../34-48-49_*
elif [[ "$TiffSource" =~ "../34-48-49_"* ]]||[[ "$TiffSource" =~ "../Feuille-255_"* ]]||[[ "$TiffSource" =~ "../57N-S_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604800 126924 -gcp 0 "$HeightImage" 604800 126524 -gcp "$WidthImage" 0 605400  126924 -gcp "$WidthImage" "$HeightImage" 605400 126524 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../34-49-50_*
elif [[ "$TiffSource" =~ "../34-49-50_"* ]]||[[ "$TiffSource" =~ "../Feuille-274_"* ]]||[[ "$TiffSource" =~ "../57S-X_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604800 126524 -gcp 0 "$HeightImage" 604800 126124 -gcp "$WidthImage" 0 605400  126524 -gcp "$WidthImage" "$HeightImage" 605400 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../35-49-50-union_*
elif [[ "$TiffSource" =~ "../35-49-50-union_"* ]]||[[ "$TiffSource" =~ "../57T-Y3-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-275-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 605400 126624 -gcp 0 "$HeightImage" 605400 126024 -gcp "$WidthImage" 0 606000  126624 -gcp "$WidthImage" "$HeightImage" 606000 126024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../35-49-50_*
elif [[ "$TiffSource" =~ "../35-49-50_"* ]]||[[ "$TiffSource" =~ "../Feuille-275_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 605400 126524 -gcp 0 "$HeightImage" 605400 126124 -gcp "$WidthImage" 0 606000  126524 -gcp "$WidthImage" "$HeightImage" 606000 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../34-53-union_*
elif [[ "$TiffSource" =~ "../34-53-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604700 125124 -gcp 0 "$HeightImage" 604700 124624 -gcp "$WidthImage" 0 605400  125124 -gcp "$WidthImage" "$HeightImage" 605400 124624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../36-34-union_
elif [[ "$TiffSource" =~ "../36-34-union_"* ]]||[[ "$TiffSource" =~ "../32P-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 606000 132624 -gcp 0 "$HeightImage" 606000 132224 -gcp "$WidthImage" 0 606800 132624 -gcp "$WidthImage" "$HeightImage" 606800 132224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../36-41-42_*
elif [[ "$TiffSource" =~ "../36-41-42_"* ]]||[[ "$TiffSource" =~ "../50A-F_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 606000 129724 -gcp 0 "$HeightImage" 606000 129324 -gcp "$WidthImage" 0 606600 129724 -gcp "$WidthImage" "$HeightImage" 606600 129324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../37-58-59_*
elif [[ "$TiffSource" =~ "../37-58-59_"* ]]||[[ "$TiffSource" =~ "../75L-N_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 606600 122724 -gcp 0 "$HeightImage" 606600 122324 -gcp "$WidthImage" 0 607200  122724 -gcp "$WidthImage" "$HeightImage" 607200 122324 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../38-39-58_*
elif [[ "$TiffSource" =~ "../38-39-58_"* ]]||[[ "$TiffSource" =~ "../75M-N_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 607500 123024 -gcp 0 "$HeightImage" 607500 122624 -gcp "$WidthImage" 0 608100  123024 -gcp "$WidthImage" "$HeightImage" 608100 122624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../40-59-union*
elif [[ "$TiffSource" =~ "../40-59-union"* ]]||[[ "$TiffSource" =~ "../75T-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 608400 122724 -gcp 0 "$HeightImage" 608400 122224 -gcp "$WidthImage" 0 609000  122724 -gcp "$WidthImage" "$HeightImage" 609000 122224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../42-43-39_*
elif [[ "$TiffSource" =~ "../42-43-39_"* ]]||[[ "$TiffSource" =~ "../42Q_R_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 610100 130624 -gcp 0 "$HeightImage" 610100 130224 -gcp "$WidthImage" 0 610700  130624 -gcp "$WidthImage" "$HeightImage" 610700 130224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../45-38-union_*
elif [[ "$TiffSource" =~ "../45-38-union_"* ]]||[[ "$TiffSource" =~ "../42O-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 611400 131080 -gcp 0 "$HeightImage" 611400 130624 -gcp "$WidthImage" 0 612000  131080 -gcp "$WidthImage" "$HeightImage" 612000 130624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../45-58-59_*
elif [[ "$TiffSource" =~ "../45-58-59_"* ]]||[[ "$TiffSource" =~ "../76O-T_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 611400 122824 -gcp 0 "$HeightImage" 611400 122424 -gcp "$WidthImage" 0 612000  122824 -gcp "$WidthImage" "$HeightImage" 612000 122424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../46-39-union_*
elif [[ "$TiffSource" =~ "../46-39-union_"* ]]||[[ "$TiffSource" =~ "../43P-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 612000 130624 -gcp 0 "$HeightImage" 612000 130124 -gcp "$WidthImage" 0 612600  130624 -gcp "$WidthImage" "$HeightImage" 612600 130124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../46-57*
elif [[ "$TiffSource" =~ "../46-57"* ]]||[[ "$TiffSource" =~ "../77F_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 123424 -gcp 0 "$HeightImage" 612100 123024 -gcp "$WidthImage" 0 612700 123424 -gcp "$WidthImage" "$HeightImage" 612700 123024 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../46-58*
elif [[ "$TiffSource" =~ "../46-58"* ]]||[[ "$TiffSource" =~ "../77K_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 123024 -gcp 0 "$HeightImage" 612100 122624 -gcp "$WidthImage" 0 612700  123024 -gcp "$WidthImage" "$HeightImage" 612700 122624 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../46-59*_
elif [[ "$TiffSource" =~ "../46-59_"* ]]||[[ "$TiffSource" =~ "../77P_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 612100 122624 -gcp 0 "$HeightImage" 612100 122224 -gcp "$WidthImage" 0 612700 122624 -gcp "$WidthImage" "$HeightImage" 612700 122224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../48-38-39_*
elif [[ "$TiffSource" =~ "../48-38-39_"* ]]||[[ "$TiffSource" =~ "../43M-R_"* ]]
then
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 613200 130824 -gcp 0 "$HeightImage" 613200 130424 -gcp "$WidthImage" 0 613800 130824 -gcp "$WidthImage" "$HeightImage" 613800 130424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../48-38-39-union*
elif [[ "$TiffSource" =~ "../48-38-39-union_"* ]]||[[ "$TiffSource" =~ "../43M-R-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 613100 130824 -gcp 0 "$HeightImage" 613100 130424 -gcp "$WidthImage" 0 613800 130824 -gcp "$WidthImage" "$HeightImage" 613800 130424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../56-24-union_*
elif [[ "$TiffSource" =~ "../56-24-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 618000 136624 -gcp 0 "$HeightImage" 618000 136124 -gcp "$WidthImage" 0 618600 136624 -gcp "$WidthImage" "$HeightImage" 618600 136124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../20-42-union*
elif [[ "$TiffSource" =~ "../20-42-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-130-union_"* ]]||[[ "$TiffSource" =~ "../46J-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596400 129424 -gcp 0 "$HeightImage" 596400 128924 -gcp "$WidthImage" 0 597000 129424 -gcp "$WidthImage" "$HeightImage" 597000 128924 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../Feuille-300-301_*
elif [[ "$TiffSource" =~ "../Feuille-300-301_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601800 125824 -gcp 0 "$HeightImage" 601800 125424 -gcp "$WidthImage" 0 602500 125824 -gcp "$WidthImage" "$HeightImage" 602500 125424 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

#
# OBSERVATOIRE + Alpha Escalier de l'observoire + Cubes etc = + 100 mètres  25-49    29-49   25-50   26-50
#

# Planche ../25-49-union_*
elif [[ "$TiffSource" =~ "../25-49-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-265-union_"* ]]||[[ "$TiffSource" =~ "../55T-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599400 126624 -gcp 0 "$HeightImage" 599400 126124 -gcp "$WidthImage" 0 600100  126624 -gcp "$WidthImage" "$HeightImage" 600100 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../26-49-union_*
elif [[ "$TiffSource" =~ "../26-49-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-266-union_"* ]]||[[ "$TiffSource" =~ "../56P-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599900 126624 -gcp 0 "$HeightImage" 599900 126124 -gcp "$WidthImage" 0 600600  126624 -gcp "$WidthImage" "$HeightImage" 600600 126124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../25-50-union_*
elif [[ "$TiffSource" =~ "../25-50-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-281-union_"* ]]||[[ "$TiffSource" =~ "../55Y-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599400 126324 -gcp 0 "$HeightImage" 599400 125824 -gcp "$WidthImage" 0 600100  126324 -gcp "$WidthImage" "$HeightImage" 600100 125824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../25-50-union_*
elif [[ "$TiffSource" == ../Feuille-281-B-union_1896.tif ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599400 126324 -gcp 0 "$HeightImage" 599400 125824 -gcp "$WidthImage" 0 600100  126324 -gcp "$WidthImage" "$HeightImage" 600100 125824 "$TiffSource" temp.tif
if [ -f ../_Output/Feuille-281-B-union_1896.tif ]
then
mv ../_Output/Feuille-281-B-union_1896.tif ../_TRASH_TEMP/"$FileDate"Feuille-281-B-union_1896.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/Feuille-281-B-union_1896.tif
gdaladdo -r average ../_Output/Feuille-281-B-union_1896.tif 2 4 8 16

# Planche ../26-50-union_*
elif [[ "$TiffSource" =~ "../26-50-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-282-union_"* ]]||[[ "$TiffSource" =~ "../55U-union_"* ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599900 126324 -gcp 0 "$HeightImage" 599900 125824 -gcp "$WidthImage" 0 600600  126324 -gcp "$WidthImage" "$HeightImage" 600600 125824 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear  -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

# Planche ../26-50-union_*
elif [[ "$TiffSource" == ../Feuille-282-B-union_1896.tif ]]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599900 126324 -gcp 0 "$HeightImage" 599900 125824 -gcp "$WidthImage" 0 600600  126324 -gcp "$WidthImage" "$HeightImage" 600600 125824 "$TiffSource" temp.tif
if [ -f "../_Output/Feuille-282-B-union_1896.tif" ]
then
mv "../_Output/Feuille-282-B-union_1896.tif" ../_TRASH_TEMP/"$FileDate"_Feuille-282-B-union_1896.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear  -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/Feuille-282-B-union_1896.tif"
gdaladdo -r average "../_Output/Feuille-282-B-union_1896.tif" 2 4 8 16


#
## De Fourcy 1858
#

# De Fourcy 1858 ../P05_Planche_1_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P05_Planche_1_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601000 127424 -gcp 0 "$HeightImage" 601000 126824 -gcp "$WidthImage" 0 602000 127424 -gcp "$WidthImage" "$HeightImage" 602000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P05_Planche_1_DeFourcy_1858.tif ]
then
mv ../_Output/P05_Planche_1_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P05_Planche_1_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P05_Planche_1_DeFourcy_1858.tif

# De Fourcy 1858 ../P06_Planche_2_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P06_Planche_2_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601000 126824 -gcp 0 "$HeightImage" 601000 126224 -gcp "$WidthImage" 0 602000 126824 -gcp "$WidthImage" "$HeightImage" 602000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P06_Planche_2_DeFourcy_1858.tif ]
then
mv ../_Output/P06_Planche_2_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P06_Planche_2_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear  -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P06_Planche_2_DeFourcy_1858.tif

# De Fourcy 1858 ../P06_Planche_2_Encart_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P06_Planche_2_Encart_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 604200 126682 -gcp 0 "$HeightImage" 604200 126524 -gcp "$WidthImage" 0 604460 126682 -gcp "$WidthImage" "$HeightImage" 604460 126524 "$TiffSource" temp.tif
if [ -f ../_Output/P06_Planche_2_Encart_DeFourcy_1858.tif ]
then
mv ../_Output/P06_Planche_2_Encart_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P06_Planche_2_Encart_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P06_Planche_2_Encart_DeFourcy_1858.tif

# De Fourcy 1858 ../P07_Planche_3_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P07_Planche_3_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601000 126224 -gcp 0 "$HeightImage" 601000 125624 -gcp "$WidthImage" 0 602000 126224 -gcp "$WidthImage" "$HeightImage" 602000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P07_Planche_3_DeFourcy_1858.tif ]
then
mv ../_Output/P07_Planche_3_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P07_Planche_3_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P07_Planche_3_DeFourcy_1858.tif

# De Fourcy 1858 ../P08_Planche_4_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P08_Planche_4_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 601000 125624 -gcp 0 "$HeightImage" 601000 125024 -gcp "$WidthImage" 0 602000 125624 -gcp "$WidthImage" "$HeightImage" 602000 125024 "$TiffSource" temp.tif
if [ -f ../_Output/P08_Planche_4_DeFourcy_1858.tif ]
then
mv ../_Output/P08_Planche_4_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P08_Planche_4_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear  -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P08_Planche_4_DeFourcy_1858.tif

# De Fourcy 1858 ../P09_Planche_5_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P09_Planche_5_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 128024 -gcp 0 "$HeightImage" 600000 127424 -gcp "$WidthImage" 0 601000 128024 -gcp "$WidthImage" "$HeightImage" 601000 127424 "$TiffSource" temp.tif
if [ -f ../_Output/P09_Planche_5_DeFourcy_1858.tif ]
then
mv ../_Output/P09_Planche_5_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P09_Planche_5_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P09_Planche_5_DeFourcy_1858.tif

# De Fourcy 1858 ../P09_Planche_5_DeFourcy-Encart-A_1858.tif
elif [ "$TiffSource" == ../P09_Planche_5_DeFourcy-Encart-A_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599960 131465 -gcp 0 "$HeightImage" 599960 131230 -gcp "$WidthImage" 0 600555 131455 -gcp "$WidthImage" "$HeightImage" 600555 131230 "$TiffSource" temp.tif
if [ -f ../_Output/P09_Planche_5_DeFourcy-Encart-A_1858.tif ]
then
mv ../_Output/P09_Planche_5_DeFourcy-Encart-A_1858.tif ../_TRASH_TEMP/"$FileDate"_P09_Planche_5_DeFourcy-Encart-A_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P09_Planche_5_DeFourcy-Encart-A_1858.tif

# De Fourcy 1858 ../P09_Planche_5_DeFourcy-Encart-B_1858.tif
elif [ "$TiffSource" == ../P09_Planche_5_DeFourcy-Encart-B_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 602405 130937 -gcp 0 "$HeightImage" 602405 130337 -gcp "$WidthImage" 0 602915 130937 -gcp "$WidthImage" "$HeightImage" 602915 130337 "$TiffSource" temp.tif
if [ -f ../_Output/P09_Planche_5_DeFourcy-Encart-B_1858.tif ]
then
mv ../_Output/P09_Planche_5_DeFourcy-Encart-B_1858.tif ../_TRASH_TEMP/"$FileDate"_P09_Planche_5_DeFourcy-Encart-B_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P09_Planche_5_DeFourcy-Encart-B_1858.tif

# De Fourcy 1858 ../P09_Planche_5_DeFourcy-Encart-C_1858.tif
elif [ "$TiffSource" == ../P09_Planche_5_DeFourcy-Encart-C_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 602250 131560 -gcp 0 "$HeightImage" 602250 131220 -gcp "$WidthImage" 0 602510 131560 -gcp "$WidthImage" "$HeightImage" 602510 131220 "$TiffSource" temp.tif
if [ -f ../_Output/P09_Planche_5_DeFourcy-Encart-C_1858.tif ]
then
mv ../_Output/P09_Planche_5_DeFourcy-Encart-C_1858.tif ../_TRASH_TEMP/"$FileDate"_P09_Planche_5_DeFourcy-Encart-C_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P09_Planche_5_DeFourcy-Encart-C_1858.tif

# De Fourcy 1858 ../P10_Planche_6_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P10_Planche_6_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 127424 -gcp 0 "$HeightImage" 600000 126824 -gcp "$WidthImage" 0 601000 127424 -gcp "$WidthImage" "$HeightImage" 601000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P10_Planche_6_DeFourcy_1858.tif ]
then
mv ../_Output/P10_Planche_6_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P10_Planche_6_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P10_Planche_6_DeFourcy_1858.tif

# De Fourcy 1858 ../P11_Planche_7_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P11_Planche_7_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 126824 -gcp 0 "$HeightImage" 600000 126224  -gcp "$WidthImage" 0 601000 126824 -gcp "$WidthImage" "$HeightImage" 601000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P11_Planche_7_DeFourcy_1858.tif ]
then
mv ../_Output/P11_Planche_7_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P11_Planche_7_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P11_Planche_7_DeFourcy_1858.tif

# De Fourcy 1858 ../P12_Planche_8_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P12_Planche_8_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 600000 126224 -gcp 0 "$HeightImage" 600000 125624  -gcp "$WidthImage" 0 601000 126224 -gcp "$WidthImage" "$HeightImage" 601000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P12_Planche_8_DeFourcy_1858.tif ]
then
mv ../_Output/P12_Planche_8_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P12_Planche_8_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/P12_Planche_8_DeFourcy_1858.tif

# De Fourcy 1858 ../P13_Planche_9_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P13_Planche_9_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599000 128024 -gcp 0 "$HeightImage" 599000 127424  -gcp "$WidthImage" 0 600000 128024 -gcp "$WidthImage" "$HeightImage" 600000 127424 "$TiffSource" temp.tif
if [ -f ../_Output/P13_Planche_9_DeFourcy_1858.tif ]
then
mv ../_Output/P13_Planche_9_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P13_Planche_9_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P13_Planche_9_DeFourcy_1858.tif

# De Fourcy 1858 ../P14_Planche_10_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P14_Planche_10_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599000 127424 -gcp 0 "$HeightImage" 599000 126824  -gcp "$WidthImage" 0 600000 127424 -gcp "$WidthImage" "$HeightImage" 600000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P14_Planche_10_DeFourcy_1858.tif ]
then
mv ../_Output/P14_Planche_10_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P14_Planche_10_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P14_Planche_10_DeFourcy_1858.tif

# De Fourcy 1858 ../P15_Planche_11_DeFourcy_1858*
elif [ "$TiffSource" == ../P15_Planche_11_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599000 126824 -gcp 0 "$HeightImage" 599000 126224  -gcp "$WidthImage" 0 600000 126824 -gcp "$WidthImage" "$HeightImage" 600000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P15_Planche_11_DeFourcy_1858.tif ]
then
mv ../_Output/P15_Planche_11_DeFourcy_1858.tif ../_TRASH_TEMP/P15_Planche_11_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -overwrite temp.tif ../_Output/P15_Planche_11_DeFourcy_1858.tif

# De Fourcy 1858 ../P16_Planche_12_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P16_Planche_12_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599000 126224 -gcp 0 "$HeightImage" 599000 125624  -gcp "$WidthImage" 0 600000 126224 -gcp "$WidthImage" "$HeightImage" 600000 125624 "$TiffSource" temp.tif
if [ -f ../_Output/P16_Planche_12_DeFourcy_1858.tif ]
then
mv ../_Output/P16_Planche_12_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P16_Planche_12_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P16_Planche_12_DeFourcy_1858.tif

# De Fourcy 1858 ../P16_Planche_12_Encart_DeFourcy_1860.tif
elif [ "$TiffSource" == ../P16_Planche_12_Encart_DeFourcy_1860.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599559 125654 -gcp 0 "$HeightImage" 599559 125452.5  -gcp "$WidthImage" 0 599844.5 125654 -gcp "$WidthImage" "$HeightImage" 599844.5 125452.5 "$TiffSource" temp.tif
if [ -f ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif ]
then
mv ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif ../_TRASH_TEMP/"$FileDate"_P16_Planche_12_Encart_DeFourcy_1860.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha -overwrite temp.tif ../_Output/P16_Planche_12_Encart_DeFourcy_1860.tif

# De Fourcy 1858 (Planche Seule) ../Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif
elif [ "$TiffSource" == ../Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 599500 125663 -gcp 0 "$HeightImage" 599500 125420  -gcp "$WidthImage" 0 599912 125663 -gcp "$WidthImage" "$HeightImage" 599912 125420 "$TiffSource" temp.tif
if [ -f ../_Output/Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif ]
then
mv ../_Output/Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif ../_TRASH_TEMP/"$FileDate"_Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha -overwrite temp.tif ../_Output/Plan_des_Catacombes_de_Paris_DeFourcy_1857.tif


# De Fourcy 1858 ../P17_Planche_13_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P17_Planche_13_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 598000 127424 -gcp 0 "$HeightImage" 598000 126824  -gcp "$WidthImage" 0 599000 127424 -gcp "$WidthImage" "$HeightImage" 599000 126824 "$TiffSource" temp.tif
if [ -f ../_Output/P17_Planche_13_DeFourcy_1858.tif ]
then
mv ../_Output/P17_Planche_13_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P17_Planche_13_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P17_Planche_13_DeFourcy_1858.tif

# De Fourcy 1858 ../P18_Planche_14_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P18_Planche_14_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 598000 126824 -gcp 0 "$HeightImage" 598000 126224  -gcp "$WidthImage" 0 599000 126824 -gcp "$WidthImage" "$HeightImage" 599000 126224 "$TiffSource" temp.tif
if [ -f ../_Output/P18_Planche_14_DeFourcy_1858.tif ]
then
mv ../_Output/P18_Planche_14_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P18_Planche_14_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P18_Planche_14_DeFourcy_1858.tif

# De Fourcy 1858 ../P19_Planche_15_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P19_Planche_15_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 597000 129824 -gcp 0 "$HeightImage" 597000 129224  -gcp "$WidthImage" 0 598000 129824 -gcp "$WidthImage" "$HeightImage" 598000 129224 "$TiffSource" temp.tif
if [ -f ../_Output/P19_Planche_15_DeFourcy_1858.tif ]
then
mv ../_Output/P19_Planche_15_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P19_Planche_15_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P19_Planche_15_DeFourcy_1858.tif

# De Fourcy 1858 ../P20_Planche_16_DeFourcy_1858.tif
elif [ "$TiffSource" == ../P20_Planche_16_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596000 129824 -gcp 0 "$HeightImage" 596000 129224  -gcp "$WidthImage" 0 597000 129824 -gcp "$WidthImage" "$HeightImage" 597000 129224 "$TiffSource" temp.tif
if [ -f ../_Output/P20_Planche_16_DeFourcy_1858.tif ]
then
mv ../_Output/P20_Planche_16_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P20_Planche_16_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P20_Planche_16_DeFourcy_1858.tif

# De Fourcy 1858 ../P21_Planche_17_DeFourcy_1858
elif [ "$TiffSource" == ../P21_Planche_17_DeFourcy_1858.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596000 129224 -gcp 0 "$HeightImage" 596000 128624  -gcp "$WidthImage" 0 597000 129224 -gcp "$WidthImage" "$HeightImage" 597000 128624 "$TiffSource" temp.tif
if [ -f ../_Output/P21_Planche_17_DeFourcy_1858.tif ]
then
mv ../_Output/P21_Planche_17_DeFourcy_1858.tif ../_TRASH_TEMP/"$FileDate"_P21_Planche_17_DeFourcy_1858.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P21_Planche_17_DeFourcy_1858.tif

# De Fourcy 1858 ../P00_Planche_0_Assemblage_DeFourcy_1958.tif
elif [ "$TiffSource" == ../P00_Planche_0_Assemblage_DeFourcy_1958.tif ]
then
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 596000 129824 -gcp 0 "$HeightImage" 596000 125024  -gcp "$WidthImage" 0 602000 129824 -gcp "$WidthImage" "$HeightImage" 602000 125024 "$TiffSource" temp.tif
if [ -f ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif ]
then
mv ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif ../_TRASH_TEMP/"$FileDate"_P00_Planche_0_Assemblage_DeFourcy_1958.tif
fi
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif ../_Output/P00_Planche_0_Assemblage_DeFourcy_1958.tif

#
# Fin des traitements particuliers
#

else
#
# Processing Standard $Abscissa & $Ordinate
#
echo "${white}---> \$Abscissa   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Abscissa"
echo "${white}---> \$Ordinate   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordinate"
echo "${white}---> \$AbscissaMultiple   -   -   -   -   -   -   -   -   -   -   -   ${orange}$AbscissaMultiple"
echo "${white}---> \$OrdinateMultiple   -   -   -   -   -   -   -   -   -   -   -   ${orange}$OrdinateMultiple"
#
# Condition: if the filename corresponds to the pattern: 25-50
# Si c'est une planche IGC nouveaux numéros post 1968
# Processing Gdal
# -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud"
#
if echo "$IGCPatternOrdinate" | grep '[0-9]"_"' &&  echo "$IGCPatternAbscissa" | grep '[0-9]"_"'
then
echo "${white}---> Nouveaux numéros - Post --> 1968 ${orange}("$Year") ${green}"$IGCPatternOrdinate"-"$IGCPatternAbscissa"${white}"

# Si Minute then alpha
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdal_translate -co COMPRESS=NONE -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

else
#
# Condition: if the filename corresponds to the pattern: 25X_
# Si c'est une planche IGC  numéros Depts de la Seine pre 1962
# Processing Gdal
# -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud"
#

#
# Sous condition numéros 26K, 72Y,
#
if [[ $IDCThirdLetter =~ [A-B] ]]
then
echo "${white}---> Numérotation du département de la Seine pre 1962 - ("${orange}""$Year")${green}      $NameNoExt $purple"
gdal_translate -co COMPRESS=NONE -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857"  temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16
else

#
# Condition: if the filename corresponds to else (Anciens numéros)
# Reservé pour le Processing Gdal des planches: Feuille-*
# Processing Gdal
# -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud"
#

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi

# Si Minute, then alpha
if [[ "$TiffSource" =~ "*_minute*" ]]
then
echo "---> Pocessing : Plan Minute"
gdal_translate -co COMPRESS=NONE -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -r bilinear -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16
else
echo "${white}---> Pocessing : Plan IDC O-A"
echo "${white}---> Proccess with no special Ordinate or Abscissa - ${green}$NameNoExt ${orange}("$Year")"
gdal_translate -co COMPRESS=NONE  -co ALPHA=YES -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif
gdalwarp -co COMPRESS=NONE -r bilinear -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"
gdaladdo -r average "../_Output/"$NameNoExt"_"$Year".tif" 2 4 8 16

fi
#
# Fin planches Numéros: Anciens / Nouveaux / Seine
#
fi



#
# Cas Particuliers:
#

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
gdal_translate -co ALPHA=YES -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -r bilinear -gcp 0 0 584500 146324  -gcp 0 "$HeightImage" 584500 109324 -gcp "$WidthImage" 0 621500 146324 -gcp "$WidthImage" "$HeightImage" 621500 109324 "$TiffSource" temp.tif
if [ -f ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif ]
then
mv ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif ../_TRASH_TEMP/"$FileDate"_Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif
fi
gdalwarp -r bilinear -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif ../_Output/Atlas_des_carrieres_souterraines_de_Paris_tableau_d_assemblage_1988.tif
fi
fi

#
##
#### Processing Feuille-*
##
#



echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "
${white}############################### Planche ${green}$Ordinate $Abscissa $Version $Year ${white}###############################
"
echo "${white}---> NTF (Paris) / Lambert Nord France  ${green}27561 ${white}            unit  :       ${green}meter           ${white}<---
${white}---> \"Nouvelle Triangulation Francaise (Paris)\""
echo "                                                                     Nord      Lambert 1"
echo "${white}---> \$Nord   Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Nord"
echo "                                                                     ${white}Sud      Lambert 1"
echo "${white}---> \$Sud    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Sud"
echo "                                                                     ${white}Est      Lambert 1"
echo "${white}---> \$Est    Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Est"
echo "                                                                     ${white}Ouest    Lambert 1"
echo "${white}---> \$Ouest  Lambert Nord    -   - EPSG:${green}27561${white}-   -   -   -   -   -   ${orange}$Ouest"

echo "
${white}---> WGS 84 (World Geodetic System 1984)EPSG:${green}4326 ${white}Corners unit  :       ${green}degree          ${white}<---
${white}---> \"World Geodetic System 1984 / -85.06,-180,85.06,180\""

echo "${white}---> \$NordOuest4326  -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordOuest4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"
echo "${white}---> \$NordEst4326    -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$NordEst4326"
echo "${white}---> \$SudEst4326 -   -   -   -   - EPSG:${green}4326${white} -   -   -   -   -   -   ${orange}$SudEst4326"

echo "
${white}---> WGS 84 / Pseudo-Mercator      EPSG:${green}3857 ${white}Corners      unit  :       ${green}meter           ${white}<---
${white}---> \"World Geodetic System 1984\""
echo "${white}---> \$NordOuest3857  -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordOuest3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"
echo "${white}---> \$NordEst3857    -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$NordEst3857"
echo "${white}---> \$SudEst3857 -   -   -   -   - EPSG:${green}3857${white} -   -   -   -   -   -   ${orange}$SudEst3857"

echo "${white}---> \$WidthImage${white} -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$WidthImage px"
echo "${white}---> \$HeightImage${white}    -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$HeightImage px"










fi

done












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
gdal_translate -co COMPRESS=NONE -a_srs EPSG:27561 -of GTiff -gcp 0 0 582000 141874 -gcp 0 "$HeightImage" 582000 113824 -gcp "$WidthImage" 0 617210 141874 -gcp "$WidthImage" "$HeightImage" 617210 113824 "../_Atlas_des_Carrière_du_département_1962.tif" temp.tif
if [ -f "../_Output/_Atlas_des_Carrière_du_département_1962.tif" ]
then
mv "../_Output/_Atlas_des_Carrière_du_département_1962.tif" "../_TRASH_TEMP/"$FileDate"_Atlas_des_Carrière_du_département_1962.tif"
fi

gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/_Atlas_des_Carrière_du_département_1962.tif"

fi

rm temp.tif

cd - 2>&1 &>/dev/null



