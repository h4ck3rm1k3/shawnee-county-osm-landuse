require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'

#myhttp://gis.snco.us/ArcGIS/rest/services/Basemap_102100/MapServer/7
url = "http://gis.snco.us/ArcGIS/rest/services/Basemap_102100/MapServer/7?f=json&pretty=true"
html  = open(url) {|f| f.read }
json = JSON.parse(html)

fields = []

if json 
if json.include?('fields')
  json['fields'].each { |x| fields.push(x['name'])}
end
end

srlatlong=4326
fieldstr = CGI::escape(fields.join(','))
#p fields

street="218 SW 1ST ST"
qry=URI::encode(street)

url2 = "http://gis.snco.us/ArcGIS/rest/services/Basemap_102100/MapServer/6/query" \
"?outFields=" + fieldstr +
"&spatialRel=esriSpatialRelIntersects" \
"&f=json" \
"&outSR=" + srlatlong.to_s + "&where=PADDRESS%20LIKE%20%27%25" + qry + "%25%27&returnGeometry=true"


html  = open(url2) {|f| f.read }
json = JSON.parse(html)

p json
