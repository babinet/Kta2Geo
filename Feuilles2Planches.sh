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
mkdir -p ../Output ../GOODNAME

for Alltif in ../*tif
do

NameSeul=$(echo "$Alltif" | sed 's/.tif//g'  | sed 's/..\///g' )
#echo "$NameSeul"
Year=$( echo "$Alltif" | awk -F'\(' '{print $2}' | awk -F'\)' '{print $1}' )
#echo $Year
SourceName=$( echo "$Alltif" | awk -F'feuille\ ' '{print $2}' | awk -F'\ ' '{print $1}' | sed 's/..\///g')
echo $SourceName
echo $$Year
echo $Alltif
#echo $SourceName | SED 's/..\///g'
if [ "$SourceName" == "14" ];then convert "$Alltif" ../GOODNAME/25-34_"$Year".tif ;fi

if [ "$SourceName" == "106" ];then convert "$Alltif" ../GOODNAME/31-40"$Version$Year".tif ;fi
if [ "$SourceName" == "106-107" ];then convert "$Alltif" ../GOODNAME/"$Version$Year".tif ;fi
if [ "$SourceName" == "107" ];then convert "$Alltif" ../GOODNAME/32-40"$Version$Year".tif ;fi
if [ "$SourceName" == "110" ];then convert "$Alltif" ../GOODNAME/18-41"$Version$Year".tif ;fi
if [ "$SourceName" == "111" ];then convert "$Alltif" ../GOODNAME/19-41"$Version$Year".tif ;fi
if [ "$SourceName" == "112" ];then convert "$Alltif" ../GOODNAME/20-41"$Version$Year".tif ;fi
if [ "$SourceName" == "113" ];then convert "$Alltif" ../GOODNAME/21-41"$Version$Year".tif ;fi
if [ "$SourceName" == "124" ];then convert "$Alltif" ../GOODNAME/32-33-41"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "124-125" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "126" ];then convert "$Alltif" ../GOODNAME/34-41-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "126-144" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "128" ];then convert "$Alltif" ../GOODNAME/18-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "129" ];then convert "$Alltif" ../GOODNAME/19-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "130" ];then convert "$Alltif" ../GOODNAME/20-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "14" ];then convert "$Alltif" ../GOODNAME/25-34"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "142" ];then convert "$Alltif" ../GOODNAME/32-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "143" ];then convert "$Alltif" ../GOODNAME/33-42"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "146" ];then convert "$Alltif" ../GOODNAME/18-43"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "147" ];then convert "$Alltif" ../GOODNAME/19-43"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "147-148" ];then convert "$Alltif" ../GOODNAME/20-43"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "15" ];then convert "$Alltif" ../GOODNAME/26-34"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "160" ];then convert "$Alltif" ../GOODNAME/32-43"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "161" ];then convert "$Alltif" ../GOODNAME/25-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "161-162" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "162" ];then convert "$Alltif" ../GOODNAME/34-43"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "164" ];then convert "$Alltif" ../GOODNAME/18-44"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "165" ];then convert "$Alltif" ../GOODNAME/19-44"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "179" ];then convert "$Alltif" ../GOODNAME/33-44"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "207" ];then convert "$Alltif" ../GOODNAME/24-46"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "208" ];then convert "$Alltif" ../GOODNAME/25-46"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "209" ];then convert "$Alltif" ../GOODNAME/26-46"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "225" ];then convert "$Alltif" ../GOODNAME/23-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "226" ];then convert "$Alltif" ../GOODNAME/24-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "227" ];then convert "$Alltif" ../GOODNAME/25-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "228" ];then convert "$Alltif" ../GOODNAME/26-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "229" ];then convert "$Alltif" ../GOODNAME/27-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "230" ];then convert "$Alltif" ../GOODNAME/28-47"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "243" ];then convert "$Alltif" ../GOODNAME/22-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "244" ];then convert "$Alltif" ../GOODNAME/23-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "245" ];then convert "$Alltif" ../GOODNAME/24-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "246" ];then convert "$Alltif" ../GOODNAME/25-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "247" ];then convert "$Alltif" ../GOODNAME/26-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "248" ];then convert "$Alltif" ../GOODNAME/27-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "249" ];then convert "$Alltif" ../GOODNAME/28-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "253" ];then convert "$Alltif" ../GOODNAME/32-48"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "254-273" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "255" ];then convert "$Alltif" ../GOODNAME/34-48-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "26" ];then convert "$Alltif" ../GOODNAME/25-35"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "261" ];then convert "$Alltif" ../GOODNAME/21-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "262" ];then convert "$Alltif" ../GOODNAME/22-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "263" ];then convert "$Alltif" ../GOODNAME/23-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "264" ];then convert "$Alltif" ../GOODNAME/24-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "265" ];then convert "$Alltif" ../GOODNAME/25-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "266" ];then convert "$Alltif" ../GOODNAME/26-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "267" ];then convert "$Alltif" ../GOODNAME/27-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "268" ];then convert "$Alltif" ../GOODNAME/28-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "269" ];then convert "$Alltif" ../GOODNAME/29-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "27" ];then convert "$Alltif" ../GOODNAME/26-35"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "272" ];then convert "$Alltif" ../GOODNAME/32-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "273" ];then convert "$Alltif" ../GOODNAME/33-48-49"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "274" ];then convert "$Alltif" ../GOODNAME/34-49-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "275" ];then convert "$Alltif" ../GOODNAME/35-49-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "276" ];then convert "$Alltif" ../GOODNAME/20-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "276-277" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "277" ];then convert "$Alltif" ../GOODNAME/21-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "278" ];then convert "$Alltif" ../GOODNAME/22-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "279" ];then convert "$Alltif" ../GOODNAME/23-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "28" ];then convert "$Alltif" ../GOODNAME/27-35"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "280" ];then convert "$Alltif" ../GOODNAME/24-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "281" ];then convert "$Alltif" ../GOODNAME/25-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "282" ];then convert "$Alltif" ../GOODNAME/26-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "283" ];then convert "$Alltif" ../GOODNAME/27-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "284" ];then convert "$Alltif" ../GOODNAME/28-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "285" ];then convert "$Alltif" ../GOODNAME/29-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "288" ];then convert "$Alltif" ../GOODNAME/32-50"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "291" ];then convert "$Alltif" ../GOODNAME/20-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "292" ];then convert "$Alltif" ../GOODNAME/21-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "293" ];then convert "$Alltif" ../GOODNAME/22-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "294" ];then convert "$Alltif" ../GOODNAME/23-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "295" ];then convert "$Alltif" ../GOODNAME/24-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "296" ];then convert "$Alltif" ../GOODNAME/25-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "297" ];then convert "$Alltif" ../GOODNAME/26-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "298" ];then convert "$Alltif" ../GOODNAME/27-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "299" ];then convert "$Alltif" ../GOODNAME/28-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "300" ];then convert "$Alltif" ../GOODNAME/29-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "300-301" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "301" ];then convert "$Alltif" ../GOODNAME/30-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "304" ];then convert "$Alltif" ../GOODNAME/33-34-51"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "305" ];then convert "$Alltif" ../GOODNAME/21-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "306" ];then convert "$Alltif" ../GOODNAME/22-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "307" ];then convert "$Alltif" ../GOODNAME/23-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "308" ];then convert "$Alltif" ../GOODNAME/24-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "309" ];then convert "$Alltif" ../GOODNAME/25-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "310" ];then convert "$Alltif" ../GOODNAME/26-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "311" ];then convert "$Alltif" ../GOODNAME/27-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "312" ];then convert "$Alltif" ../GOODNAME/28-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "313" ];then convert "$Alltif" ../GOODNAME/29-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "314" ];then convert "$Alltif" ../GOODNAME/30-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "315" ];then convert "$Alltif" ../GOODNAME/22-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "316" ];then convert "$Alltif" ../GOODNAME/23-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "317" ];then convert "$Alltif" ../GOODNAME/24-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "318" ];then convert "$Alltif" ../GOODNAME/25-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "319" ];then convert "$Alltif" ../GOODNAME/26-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "321" ];then convert "$Alltif" ../GOODNAME/28-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "322" ];then convert "$Alltif" ../GOODNAME/29-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "323" ];then convert "$Alltif" ../GOODNAME/30-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "324" ];then convert "$Alltif" ../GOODNAME/24-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "325" ];then convert "$Alltif" ../GOODNAME/25-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "326" ];then convert "$Alltif" ../GOODNAME/26-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "328" ];then convert "$Alltif" ../GOODNAME/28-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "329" ];then convert "$Alltif" ../GOODNAME/29-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "330" ];then convert "$Alltif" ../GOODNAME/30-54"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "331" ];then convert "$Alltif" ../GOODNAME/25-55"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "332" ];then convert "$Alltif" ../GOODNAME/26-55"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "334" ];then convert "$Alltif" ../GOODNAME/28-55"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "335" ];then convert "$Alltif" ../GOODNAME/29-55"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "39" ];then convert "$Alltif" ../GOODNAME/25-36"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "40" ];then convert "$Alltif" ../GOODNAME/26-36"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "41" ];then convert "$Alltif" ../GOODNAME/27-36"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "42" ];then convert "$Alltif" ../GOODNAME/28-35"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "45" ];then convert "$Alltif" ../GOODNAME/31-35"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "46" ];then convert "$Alltif" ../GOODNAME/32-36"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "53" ];then convert "$Alltif" ../GOODNAME/26-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "54" ];then convert "$Alltif" ../GOODNAME/27-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "55" ];then convert "$Alltif" ../GOODNAME/28-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "56" ];then convert "$Alltif" ../GOODNAME/29-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "57" ];then convert "$Alltif" ../GOODNAME/30-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "58" ];then convert "$Alltif" ../GOODNAME/31-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "59" ];then convert "$Alltif" ../GOODNAME/32-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "60" ];then convert "$Alltif" ../GOODNAME/33-37"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "62" ];then convert "$Alltif" ../GOODNAME/20-52"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "66K" ];then convert "$Alltif" ../GOODNAME/36-53"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "67U" ];then convert "$Alltif" ../GOODNAME/41-55"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "71" ];then convert "$Alltif" ../GOODNAME/29-38"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "72" ];then convert "$Alltif" ../GOODNAME/30-38"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "73" ];then convert "$Alltif" ../GOODNAME/31-38"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "76" ];then convert "$Alltif" ../GOODNAME/34-35-38"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "77" ];then convert "$Alltif" ../GOODNAME/19-39"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "88" ];then convert "$Alltif" ../GOODNAME/30-39"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "89" ];then convert "$Alltif" ../GOODNAME/31-39"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "93" ];then convert "$Alltif" ../GOODNAME/18-40"$Version"_"$Year".tif ;fi
if [ "$SourceName" == "96-113" ];then convert "$Alltif" ../GOODNAME/"$Version"_"$Year".tif ;fi

##echo "if [ "$SourceName" == "106" ];then NameTiff=$(echo "31-40") convert "$Alltif" ../GOODNAME/"$NameTiff"_"$Year".tif ;fi
#$NameTiff NameTiff
#"

done




cd -
