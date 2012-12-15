require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'

street="218 SW 1ST ST"
qry=URI::encode(street)


sr=102100

fields = %w{
    OBJECTID 
    PARCELNUM
    ACRES
    PIN 
    PID 
    QUICKREFID
    ONAME 
    PADDRESS
    PADDRESS2
    MAILNAME 
    MAILADDRESS 
    MAILADDRESS2
    DBOOKPAGE 
    SUBS 
    NBHD 
    TAXUNIT
    USD 
    LBCSFUNCTION 
    LBCSACTIVITY 
    CLASS 
    BLDGVAL 
    LDVAL 
    TOTVAL
    Shape 
    WebLink 
    PRC_Link 
    Shape.area 
    Shape.len 
}

fieldstr = CGI::escape(fields.join(','))
p fieldstr

url = "http://gis.snco.us/ArcGIS/rest/services/Parcels/MapServer/0/query" \
"?outFields=" + fieldstr +
"&spatialRel=esriSpatialRelIntersects" \
"&f=json" \
"&outSR=" + sr.to_s + "&where=PADDRESS%20LIKE%20%27%25" + qry + "%25%27&returnGeometry=true"


html  = open(url) {|f| f.read }
#html =  ScraperWiki::scrape(url)

json = JSON.parse(html)

xs=[]
ys=[]

if json 
if json.include?('features')
  data= json['features'][0]['attributes']
  oname =data["ONAME"]
  paddress = data["PADDRESS"]
  paddress2= data["PADDRESS"]
  link1 =data["PRC_Link"]
  link2 =data["WebLink"]
  pid =data["PID"]
  acres =data["ACRES"]          
  total =data["TOTVAL"]
  building =data["BLDGVAL"]
  land =data["LDVAL"]
  nbhd =data["NBHD"]
  func =data["LBCSFUNCTION"]
  func2 =data["LBCSACTIVITY"]
  objid =data["OBJECTID"]
  geo= json['features'][0]['geometry']['rings'][0]
  geo.each { |x| 
#    p x[0].to_s + "|" + x[1].to_s 
    xs.push(x[0])
    ys.push(x[1])
  }
end

end

p [xs.min,ys.min,xs.max,ys.max].join(',')
