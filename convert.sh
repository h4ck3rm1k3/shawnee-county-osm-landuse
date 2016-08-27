
ruby osm_lookup_by_house.rb  ~/experiments/school-districts/lawrence/lawrence_schools.csv

for x in *.osm;
do echo $x;
    DIR=`basename $x _way.osm`
    mkdir $DIR
    
    ogr2ogr -nlt MULTIPOLYGON $DIR  $x -skipfailure -overwrite
done
