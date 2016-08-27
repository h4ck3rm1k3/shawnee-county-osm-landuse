for x in `grep -w BF report2.txt |  cut -f3 | sort -u `; do printf "    <member type='node' ref='%d' role='house' />\n" $x; done > bf.osm
for x in `grep -w LES report2.txt | cut -f3 | sort -u `; do printf "    <member type='node' ref='%d' role='house' />\n" $x; done > les.osm
for x in `grep -w EP report2.txt | cut -f3 | sort -u `; do printf "    <member type='node' ref='%d' role='house' />\n" $x; done > ep.osm
for x in `grep -w SL report2.txt | cut -f3 | sort -u `; do printf "    <member type='node' ref='%d' role='house' />\n" $x; done > sl.osm
