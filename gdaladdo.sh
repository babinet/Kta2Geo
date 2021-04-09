#!/bin/bash
# Run in root level Geoserver
if [ -f geotiflist.txt ]
then
rm geotiflist.txt
fi
 find . -name "*.geotiff" >> geotiflist.txt

while read -r geotiffiles
do
echo "---> Adding average optimized view to "$geotiffiles""
gdaladdo -r average $geotiffiles 2 4 8 16
done < geotiflist.txt

rm geotiflist.txt
