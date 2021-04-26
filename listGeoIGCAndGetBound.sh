
#!/bin/sh
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

if [ -f list_temp ]
then
rm list_temp
fi

allgeotif=$(sudo find . -name *.geotiff | sed 's/\/\//\//g')

echo "$allgeotif"  > AllTiffinServer
while read TiffinServer
do
GeotiffName=$(echo "$TiffinServer" |  awk -F '/' '{print $NF}')
#echo "$GeotiffName hello"
gdalinfo "$TiffinServer" > gdalinfo
coodinate=$(
while read gdalinfoline
do
echo "$gdalinfoline" |awk '/Size is / {print $0"|"}'| sed 's/Size is //g' | tr ',' 'x'| tr -d ' '
echo "$gdalinfoline" |awk '/Upper Left/'| awk -F'(' '{print $2 }'| awk -F')' '{print $1"|"}' | sed 's/ //g'
echo "$gdalinfoline" |awk '/Lower Left/'| awk -F'(' '{print $2 }'| awk -F')' '{print $1"|"}' | sed 's/ //g'
echo "$gdalinfoline" |awk '/Upper Right/'| awk -F'(' '{print $2 }'| awk -F')' '{print $1"|"}' | sed 's/ //g'
echo "$gdalinfoline" |awk '/Lower Right/'| awk -F'(' '{print $2 }'| awk -F')' '{print $1"|"}' | sed 's/ //g'
echo "$gdalinfoline" |awk '/Center/' | awk -F'(' '{print $2 }'| awk -F')' '{print $1"|"}' | sed 's/ //g'
done < gdalinfo
)
MachineName=$(echo planche"$GeotiffName" |tr '-' '_' | awk '{print tolower($0)}'| sed 's/.geotiff//g'|tr ' ' '_')
Allcoord=$(echo "$coodinate"| tr -d '\n')
Name=$(echo $GeotiffName | sed 's/.geotiff//g')
echo "$Name|$GeotiffName|$Allcoord$MachineName" >> list_temp
done < AllTiffinServer

echo "Name|Filname|Size|Upper_Left|Lower_Left|Upper_Right|Lower_Right|Center|MachineName" > Map_in_Geoserver.csv
cat list_temp | awk '!NF || !seen[$0]++' >> Map_in_Geoserver.csv


if [ -f list_temp ]
then
rm list_temp AllTiffinServer gdalinfo
fi

cd - 2>&1 &>/dev/null
