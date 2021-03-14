for geotifffiles in _Output/*
do
echo "---> Adding average optimized view to $geotifffiles"
gdaladdo -r average "$geotifffiles" 2 4 8 16
done
