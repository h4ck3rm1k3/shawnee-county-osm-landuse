require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'

url = "http://gis.snco.us/ArcGIS/rest/services/Basemap_102100/MapServer?f=json&callback=dojo.io.script.jsonp_dojoIoScript1._jsonpCallback"
html  = open(url) {|f| f.read }
json = JSON.parse(html)
p json
