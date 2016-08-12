for x in `grep -w BF report.txt | grep 9999 | cut -f2 | sort -u `; do printf "    <member type='way' ref='%d' role='whole_street' />\n" $x; done > bf.osm
for x in `grep -w LES report.txt | grep 9999 | cut -f2 | sort -u `; do printf "    <member type='way' ref='%d' role='whole_street' />\n" $x; done > les.osm
for x in `grep -w EP report.txt | grep 9999 | cut -f2 | sort -u `; do printf "    <member type='way' ref='%d' role='whole_street' />\n" $x; done > ep.osm
for x in `grep -w SL report.txt | grep 9999 | cut -f2 | sort -u `; do printf "    <member type='way' ref='%d' role='whole_street' />\n" $x; done > sl.osm
