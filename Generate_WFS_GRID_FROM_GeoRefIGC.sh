#!/bin/bash -e
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
cd "$dir"
mkdir -p tmp

if [ -f tmp/List_Special_Planches.csv ]
then
rm tmp/List_Special_Planches.csv
fi

cat GeoRefIGC_N_Make_WFS.sh | tr -d '\n' | sed 's/elif \[\[ "$TiffSource"/\
 /g' | sed 's/if \[\[ "$TiffSource"/\
 /g'|awk '/"\.\.\//' |awk '/gdal_translate/' | awk -F' 2 4 8 16' '{print $1}' > tmp/list_planche_Pour_corners_special_Cases.txt

IFS=$'\n'       # Processing line
set -f          # disable globbing



#elif [[ "$TiffSource" =~ "../26-50-union_"* ]]||[[ "$TiffSource" =~ "../Feuille-282-union_"* ]]||[[ "$TiffSource" =~ "../55U-union_"* ]]

for list_planche_Pour_corners in $(cat tmp/list_planche_Pour_corners_special_Cases.txt)
do
planche_name=$(echo "$list_planche_Pour_corners" |awk -F'"../' '{print $2}'|awk -F'"' '{print $1}')
OldName=$(echo "$list_planche_Pour_corners" |awk -F'\TiffSource' '{print $2}'|awk -F'"../' '{print $2}'|awk -F'"' '{print $1}')
Seine=$(echo "$list_planche_Pour_corners"|awk -F'\TiffSource' '{print $3}'|awk -F'"../' '{print $2}'|awk -F'"' '{print $1}')

if [[ "$OldName" == "_Output_3857/" ]]
then
OldName=""
fi
if [[ "$Seine" == "_Output_3857/" ]]
then
Seine=""
fi


lefttop=$(echo "$list_planche_Pour_corners" |awk -F'-gcp' '{print $2}'|awk  '{print $3, $4}')
leftbottom=$(echo "$list_planche_Pour_corners" |awk -F'-gcp' '{print $3}'|awk  '{print $3, $4}')
righttop=$(echo "$list_planche_Pour_corners" |awk -F'-gcp' '{print $4}'|awk  '{print $3, $4}')
rightbottom=$(echo "$list_planche_Pour_corners" |awk -F'-gcp' '{print $5}'|awk  '{print $3, $4}')


lefttop3857=$(echo "$lefttop" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
leftbottom3857=$(echo "$leftbottom" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
righttop3857=$(echo "$righttop" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')
rightbottom3857=$(echo "$rightbottom" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857 | awk '{print $1, $2}')

lefttop4326=$(echo "$lefttop" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $2, $1}')
leftbottom4326=$(echo "$leftbottom" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $2, $1}')
righttop4326=$(echo "$righttop" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $2, $1}')
rightbottom4326=$(echo "$rightbottom" | gdaltransform -s_srs EPSG:27561 -t_srs EPSG:4326 | awk '{print $2, $1}')
echo $white $planche_name lefttop $lefttop leftbottom $leftbottom righttop $righttop rightbottom $rightbottom

echo $orange lefttop3857 $lefttop3857
echo "$planche_name|$OldName|$Seine|$lefttop|$leftbottom|$righttop|$rightbottom|$lefttop3857|$leftbottom3857|$rightbottom3857|$righttop3857|$lefttop4326|$leftbottom4326|$rightbottom4326|$righttop4326|Polygon (($lefttop3857, $leftbottom3857, $rightbottom3857, $righttop3857, $lefttop3857))" >> tmp/List_Special_Planches.csv

#| gdaltransform -s_srs EPSG:27561 -t_srs EPSG:3857
done

cd - 2>&1 &>/dev/null
