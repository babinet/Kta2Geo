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
Ordoned=10
Absis=35
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72H_* ]
then
Ordoned=23
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27A_* ]
then
Ordoned=11
Absis=31
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27B_* ]
then
Ordoned=12
Absis=31
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27F_* ]
then
Ordoned=11
Absis=32
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27K_* ]
then
Ordoned=11
Absis=33
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27L_* ]
then
Ordoned=12
Absis=33
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27P_* ]
then
Ordoned=11
Absis=34
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27Q_* ]
then
Ordoned=12
Absis=34
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../27X_* ]
then
Ordoned=14
Absis=35
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../35D_* ]
then
Ordoned=9
Absis=36
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../35O_* ]
then
Ordoned=10
Absis=38
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../35Y_* ]
then
Ordoned=11
Absis=38
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../95I_* ]
then
Ordoned=19
Absis=72
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../70E_* ]
then
Ordoned=15
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../70J_* ]
then
Ordoned=15
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../70O_* ]
then
Ordoned=15
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71A_* ]
then
Ordoned=16
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71B_* ]
then
Ordoned=17
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71C_* ]
then
Ordoned=18
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71D_* ]
then
Ordoned=19
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71E_* ]
then
Ordoned=20
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71F_* ]
then
Ordoned=16
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71G_* ]
then
Ordoned=17
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71H_* ]
then
Ordoned=18
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71I_* ]
then
Ordoned=19
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71J_* ]
then
Ordoned=20
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../71K_* ]
then
Ordoned=16
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../71L_* ]
then
Ordoned=17
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../71M_* ]
then
Ordoned=18
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../71N_* ]
then
Ordoned=19
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../71O_* ]
then
Ordoned=20
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../71R_* ]
then
Ordoned=18
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71S_* ]
then
Ordoned=19
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71T_* ]
then
Ordoned=20
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71W_* ]
then
Ordoned=18
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71X_* ]
then
Ordoned=19
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../71Y_* ]
then
Ordoned=20
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72A_* ]
then
Ordoned=21
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72B_* ]
then
Ordoned=22
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72C_* ]
then
Ordoned=23
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72D_* ]
then
Ordoned=24
Absis=56
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72F_* ]
then
Ordoned=21
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72G_* ]
then
Ordoned=22
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72H_* ]
then
Ordoned=23
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72I_* ]
then
Ordoned=24
Absis=57
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72K_* ]
then
Ordoned=21
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72L_* ]
then
Ordoned=22
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72M_* ]
then
Ordoned=23
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72N_* ]
then
Ordoned=24
Absis=58
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../72P_* ]
then
Ordoned=21
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72Q_* ]
then
Ordoned=22
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"



elif [ "$TiffSource" == ../72R_* ]
then
Ordoned=23
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../72S_* ]
then
Ordoned=24
Absis=59
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72U_* ]
then
Ordoned=21
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72V_* ]
then
Ordoned=22
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72W_* ]
then
Ordoned=23
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../72X_* ]
then
Ordoned=24
Absis=60
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"
#
#
#

elif [ "$TiffSource" == ../80C_* ]
then
Ordoned=18
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../80D_* ]
then
Ordoned=19
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../80E_* ]
then
Ordoned=20
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../80J_* ]
then
Ordoned=20
Absis=62
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81A_* ]
then
Ordoned=21
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81B_* ]
then
Ordoned=22
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81C_* ]
then
Ordoned=23
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81F_* ]
then
Ordoned=21
Absis=62
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81G_* ]
then
Ordoned=22
Absis=62
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81H_* ]
then
Ordoned=23
Absis=62
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81L_* ]
then
Ordoned=22
Absis=63
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../81D_* ]
then
Ordoned=24
Absis=61
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../95D_* ]
then
Ordoned=19
Absis=71
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../95E_* ]
then
Ordoned=20
Absis=71
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../95I_* ]
then
Ordoned=19
Absis=72
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../95J_* ]
then
Ordoned=20
Absis=72
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../96A_* ]
then
Ordoned=21
Absis=71
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../96F_* ]
then
Ordoned=21
Absis=72
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"





#
# lundi 16 octobre
#




elif [ "$TiffSource" == ../36U_* ]
then
Ordoned=11
Absis=40
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../44E_* ]
then
Ordoned=10
Absis=41
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../45A_* ]
then
Ordoned=11
Absis=41
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../61Y__* ]
then
Ordoned=15
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62J_* ]
then
Ordoned=20
Absis=62
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62P_* ]
then
Ordoned=16
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62R_* ]
then
Ordoned=18
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"


elif [ "$TiffSource" == ../62T_* ]
then
Ordoned=20
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62U_* ]
then
Ordoned=16
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62V_* ]
then
Ordoned=17
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62V_* ]
then
Ordoned=17
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../62Y_* ]
then
Ordoned=20
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63K_* ]
then
Ordoned=21
Absis=53
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63P_* ]
then
Ordoned=21
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63Q_* ]
then
Ordoned=22
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63R_* ]
then
Ordoned=23
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63U_* ]
then
Ordoned=21
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63V_* ]
then
Ordoned=22
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63W_* ]
then
Ordoned=23
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

elif [ "$TiffSource" == ../63X_* ]
then
Ordoned=24
Absis=55
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"

#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordoned=21
#Absis=72
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#
#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordoned=21
#Absis=72
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#
#elif [ "$TiffSource" == ../96F_* ]
#then
#Ordoned=21
#Absis=72
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#













#
## Ancienne Numérotation 281 = 25-500
#

elif [ "$TiffSource" == ../324_* ]
then
Ordoned=24
Absis=54
echo "${red}---> Ordoned suptitut : $Ordoned"
echo "${red}---> Absis suptitut : $Absis"




#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordoned=15
#Absis=58
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordoned=15
#Absis=58
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordoned=15
#Absis=58
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#
#
#
#elif [ "$TiffSource" == ../70O_* ]
#then
#Ordoned=15
#Absis=58
#echo "${red}---> Ordoned suptitut : $Ordoned"
#echo "${red}---> Absis suptitut : $Absis"
#





# END ABSIS FIX
else

Ordoned=$(echo $NameNoExt | awk -F'-' '{print $1}'| tr -d ' ' | sed 's/..\///g')
Absis=$(echo $NameNoExt | awk -F'-' '{print $2}' | tr -d ' '  | awk -F'_' '{print $1}'| sed 's/..\///g')
# END ABSIS
fi
echo "${white} ---> \$Absis $Absis"
echo "${white} ---> \$Ordoned $Ordoned"










AbsisMultiple=$(echo "$Absis"-50 |bc -l)
OrdonedMultiple=$(echo "$Ordoned"-25 | bc -l)
# Image Info
ExifInfo=$(exiftool "$TiffSource")
#echo $SerialPoster
WidthImage=$(echo $ExifInfo | awk -F'Image Width : ' '{print $2}' | awk '{print $1}')
HeightImage=$(echo $ExifInfo | awk -F'Image Height : ' '{print $2}' | awk '{print $1}')

# Position Origin (Mètres) 600000 126224 Zéro de l'observatoire de Paris

Nord=$(echo 126224-$Hauteur*$AbsisMultiple |bc -l)
Sud=$(echo 125824-$Hauteur*$AbsisMultiple|bc -l )
Est=$(echo 600000+\($OrdonedMultiple*$Largeur\) |bc -l )
Ouest=$(echo 599400+\($OrdonedMultiple*$Largeur\) |bc -l )

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
IGCPatternOrdoned=$(echo $NameNoExt | awk -F'-' '{print $1}' )
IGCPatternAbsis=$(echo $NameNoExt | awk -F'-' '{print $2}' )



echo "${white}---> \$TiffSource -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$TiffSource"
echo "${white}---> \$NameNoExt  -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$NameNoExt"
echo "${white}---> \$Year   -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Year"
echo "${white}---> \$Absis  -   -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Absis"
echo "${white}---> \$Ordoned    -   -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$Ordoned"
echo "${white}---> \$AbsisMultiple  -   -   -   -   -   -   -   -   -   -   -   -   ${orange}$AbsisMultiple"
echo "${white}---> \$OrdonedMultiple    -   -   -   -   -   -   -   -   -   -   -   ${orange}$OrdonedMultiple"
echo "
${white}############################### Planche ${green}$Ordoned $Absis $Version $Year ${white}###############################
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

# Planche 07-58
elif [ "$NameNoExt" == 07-58 ]
then
echo "${purple}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
WidthImage=7734
HeightImage=5284
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 588550 123024 -gcp 0 "$HeightImage" 588550 122574 -gcp "$WidthImage" 0 589200 123024 -gcp "$WidthImage" "$HeightImage" 589200 122574 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif

fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

elif [ "$NameNoExt" == "8-9-51-52" ]
then
#echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589500 125624 -gcp 0 "$HeightImage" 589500 125224 -gcp "$WidthImage" 0 590100 125624 -gcp "$WidthImage" "$HeightImage" 590100 125224 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif

fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

elif [ "$NameNoExt" == "08-44" ]
then
echo "${red}$NameOut NameOut ${green}$HeightImage HeightImage${reset}"
gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 589200 128624 -gcp 0 "$HeightImage" 589200 128124 -gcp "$WidthImage" 0 589800 128624 -gcp "$WidthImage" "$HeightImage" 589800 128124 "$TiffSource" temp.tif
if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
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

# Planche ../71P_*
elif [ "$TiffSource" == ../71P_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 594600 122324 -gcp 0 "$HeightImage" 594600 121724 -gcp "$WidthImage" 0 595200 122324 -gcp "$WidthImage" "$HeightImage" 595200 121724 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif

fi
gdalwarp -co COMPRESS=NONE -dstalpha -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../71V_*
elif [ "$TiffSource" == ../71V_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 594600 122324 -gcp 0 "$HeightImage" 594600 121664 -gcp "$WidthImage" 0 595200 122324 -gcp "$WidthImage" "$HeightImage" 595200 121664 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"


# Planche ../10-35
elif [ "$TiffSource" == ../10-35_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 590400 132324 -gcp 0 "$HeightImage" 590400 131824 -gcp "$WidthImage" 0 591000 132324 -gcp "$WidthImage" "$HeightImage" 591000 131824 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

# Planche ../41-42_Encart*
elif [ "$TiffSource" == ../41-42_Encart* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 609347 128673 -gcp 0 "$HeightImage" 609347 128570 -gcp "$WidthImage" 0 609500 128673 -gcp "$WidthImage" "$HeightImage" 609500 128570 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" temp.tif "../_Output/41-42_Encart_"/$Year".tif"

# Planche ../41-42-45_*
elif [ "$TiffSource" == ../41-42-45_* ]
then

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 609300 127424 -gcp 0 "$HeightImage" 609300 127424 -gcp "$WidthImage" 0 609900 127024 -gcp "$WidthImage" "$HeightImage" 609900 127024 "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
mv "../_Output/"$NameNoExt"_"$Year".tif" ../_TRASH_TEMP/"$FileDate"_"$NameNoExt"_"$Year".tif
fi
gdalwarp -co COMPRESS=NONE -s_srs "EPSG:27561" -t_srs "EPSG:3857" -dstalpha temp.tif "../_Output/"$NameNoExt"_"$Year".tif"

else



#
# Condition: if the filename corresponds to the pattern e.g: 25-50
# Si c'est une planche IGC nouveaux numéros post 1968
#

if echo "$IGCPatternOrdoned" | grep '[0-9]' &&  echo "$IGCPatternAbsis" | grep '[0-9]'
then
echo "${green}---> IGC New Name Post --> 1968                       ${orange}"$IGCPatternOrdoned"-"$IGCPatternAbsis""

gdal_translate -a_srs EPSG:27561 -of GTiff -gcp 0 0 "$Ouest" "$Nord" -gcp 0 "$HeightImage" "$Ouest" "$Sud" -gcp "$WidthImage" 0 "$Est" "$Nord" -gcp "$WidthImage" "$HeightImage" "$Est" "$Sud" "$TiffSource" temp.tif

if [ -f "../_Output/"$NameNoExt"_"$Year".tif" ]
then
# rm "../_Output/"$NameNoExt"_"$Year".tif"
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
# rm "../_Output/"$NameNoExt"_"$Year".tif"
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
echo $green YEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEES $purple $NameNoExt
else

echo $red NOOOOOOOOO $NameNoExt IDCThirdLetter $IDCThirdLetter
fi




fi

##mv temp.tif ../temp$NameNoExt.tif












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

            LÉGENDE

            - Feuilles comprenant d’anciennes carrières de Calcaire Grossier.

            Feuilles comprenant d'anciennes carrières de Gypse.

            - Feuilles comprenant d'anciennes carrières de Calcaire Grossier et de Gypse.

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

