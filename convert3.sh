export GDAL_DATA=`pwd`
#ruby osm_lookup_by_house.rb  ~/experiments/school-districts/Lawrence/lawrence_schools.csv

for x in *_way.osm;
do echo $x;
    DIR=`basename $x _way.osm`
    mkdir $DIR
    
    ogr2ogr -nlt MULTIPOLYGON $DIR  $x -skipfailure -overwrite

    ogr2ogr ${x}.shp ${DIR}/lines.shp -dialect sqlite -sql "SELECT ST_Union(geometry), dissolve_field FROM input GROUP BY dissolve_field"

done

