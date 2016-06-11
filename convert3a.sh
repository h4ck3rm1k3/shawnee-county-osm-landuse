export GDAL_DATA=`pwd`
for x in *.osm;
do echo $x;
    DIR=`basename $x _way.osm`
    /usr/bin/ogr2ogr -nlt MULTIPOLYGON $DIR  $x -skipfailure -overwrite
    /usr/bin/ogr2ogr ${x}.shp ${DIR}/lines.shp -dialect sqlite -sql "SELECT ST_Union(geometry), school FROM lines GROUP BY school"

done

