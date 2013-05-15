#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'

# 
require 'proj4'

#from this page http://ags2.lojic.org/lojiconline/
#click on a parcel in high zoom to lookup a parcel

class BaseNode 

  def self.initfields ()
    @@abbr= Hash.new
    @@codesl= Hash.new
    @@proto= LandUse.new
    @@bearing= Hash.new

    @@abbr['AL'] =  'Alley'
    @@abbr['ALY'] = 'Alley'
    @@abbr['ANX'] = 'Annex'
    @@abbr['APT'] = 'Apartment'
    @@abbr['ARC'] = 'Arcade'
    @@abbr['AVE'] = 'Avenue'
    @@abbr['AVE'] = 'Avenue'
    @@abbr['BCH'] = 'Beach'
    @@abbr['BG'] = 'Burg'
    @@abbr['BLDG'] = 'Building'
    @@abbr['BLF'] = 'Bluff'
    @@abbr['BLVD'] = 'Boulevard'
    @@abbr['BND'] = 'Bend'
    @@abbr['BR'] = 'Branch'
    @@abbr['BRG'] = 'Bridge'
    @@abbr['BRK'] = 'Brook'
    @@abbr['BSMT'] =  'Basement'
    @@abbr['BTM'] = 'Bottom'
    @@abbr['BYP'] = 'Bypass'
    @@abbr['BYU'] = 'Bayou'
    @@abbr['CIR'] =  'Circle'
    @@abbr['CLB'] = 'Club'
    @@abbr['CLFS'] = 'Cliff'
    @@abbr['CLFS'] = 'Cliffs'
    @@abbr['COR'] = 'Corner'
    @@abbr['CORS'] = 'Corners'
    @@abbr['CP'] = 'Camps'
    @@abbr['CPE'] = 'Cape'
    @@abbr['CRES'] = 'Cresent'
    @@abbr['CRK'] = 'Creek'
    @@abbr['CRSE'] = 'COURSE'
    @@abbr['CSWY'] = 'CAUSEWAY'
    @@abbr['CT'] = 	'Court'
    @@abbr['CT'] = 'COURT'
    @@abbr['CTR'] = 'CENTER'
    @@abbr['CTS'] = 'COURTS'
    @@abbr['CV'] = 'COVE'
    @@abbr['CYN'] = 'CANYON'
    @@abbr['DEPT'] = 'DEPARTMENT'
    @@abbr['DL'] = 'DALE'
    @@abbr['DM'] = 'DAM'
    @@abbr['DR'] = 	'Drive'
    @@abbr['DR'] = 'DRIVE'
    @@abbr['DV'] = 'DIVIDE'
    @@abbr['EST'] = 'ESTATE'
    @@abbr['EXPY'] = 'EXPRESSWAY'
    @@abbr['EXT'] = 'EXTENSION'
    @@abbr['FL'] = 'FLOOR'
    @@abbr['FLD'] = 'FIELD'
    @@abbr['FLDS'] = 'FIELDS'
    @@abbr['FLS'] = 'FALLS'
    @@abbr['FLT'] = 'FLAT'
    @@abbr['FRD'] = 'FORD'
    @@abbr['FRG'] = 'FORGE'
    @@abbr['FRK'] = 'FORK'
    @@abbr['FRKS'] = 'FORKS'
    @@abbr['FRNT'] = 'FRONT'
    @@abbr['FRST'] = 'FOREST'
    @@abbr['FRY'] = 'FERRY'
    @@abbr['FT'] = 'FORT'
    @@abbr['FWY'] = 'FREEWAY'
    @@abbr['GDNS'] = 'GARDEN'
    @@abbr['GDNS'] = 'GARDENS'
    @@abbr['GLN'] = 'GLEN'
    @@abbr['GRN'] = 'GREEN'
    @@abbr['GRV'] = 'GROVE'
    @@abbr['GTWY'] = 'GATEWAY'
    @@abbr['HBR'] = 'HARBOR'
    @@abbr['HL'] = 'HILL'
    @@abbr['HLS'] = 'HILLS'
    @@abbr['HNGR'] = 'HANGER'
    @@abbr['HOLW'] = 'HOLLOW'
    @@abbr['HTS'] = 'HEIGHTS'
    @@abbr['HVN'] = 'HAVEN'
    @@abbr['HWY'] = 	'Highway'
    @@abbr['INLT'] = 'INLET'
    @@abbr['IS'] = 'ISLAND'
    @@abbr['ISS'] = 'ISLANDS'
    @@abbr['JCT'] = 'JUNCTION'
    @@abbr['KNLS'] = 'KNOLL'
    @@abbr['KNLS'] = 'KNOLLS'
    @@abbr['KY'] = 'KEY'
    @@abbr['LBBY'] = 'LOBBY'
    @@abbr['LCKS'] = 'LOCK'
    @@abbr['LCKS'] = 'LOCKS'
    @@abbr['LDG'] = 'LODGE'
    @@abbr['LF'] = 'LOAF'
    @@abbr['LGT'] = 'LIGHT'
    @@abbr['LK'] = 'LAKE'
    @@abbr['LKS'] = 'LAKES'
    @@abbr['LN'] = 	'Lane'
    @@abbr['LN'] = 'LANE'
    @@abbr['LNDG'] = 'LANDING'
    @@abbr['LOWR'] = 'LOWER'
    @@abbr['MDWS'] = 'MEADOW'
    @@abbr['MDWS'] = 'MEADOWS'
    @@abbr['ML'] = 'MILL'
    @@abbr['MLS'] = 'MILLS'
    @@abbr['MNR'] = 'MANOR'
    @@abbr['MSN'] = 'MISSION'
    @@abbr['MT'] = 'MOUNT'
    @@abbr['MTN'] = 'MOUNTAIN'
    @@abbr['NCK'] = 'NECK'
    @@abbr['OFC'] = 'OFFICE'
    @@abbr['ORCH'] = 'ORCHARD'
    @@abbr['PARK'] = 	'Park'
    @@abbr['PH'] = 'PENTHOUSE'
    @@abbr['PKWY'] = 'PARKWAY'
    @@abbr['PL'] = 	'Place'
    @@abbr['PL'] = 'PLACE'
    @@abbr['PLN'] = 'PLAIN'
    @@abbr['PLNS'] = 'PLAINS'
    @@abbr['PLZ'] = 'PLAZA'
    @@abbr['PNES'] = 'PINE'
    @@abbr['PNES'] = 'PINES'
    @@abbr['PR'] = 'PRAIRIE'
    @@abbr['PRT'] = 'PORT'
    @@abbr['PT'] = 'POINT'
    @@abbr['RADL'] = 'RADIAL'
    @@abbr['RD'] = 'ROAD'
    @@abbr['RD'] = 'Road'
    @@abbr['RDG'] = 'RIDGE'
    @@abbr['RIV'] = 'RIVER'
    @@abbr['RM'] = 'ROOM'
    @@abbr['RNCH'] = 'RANCH'
    @@abbr['ROAD'] = 'Road'
    @@abbr['RPDS'] = 'RAPID'
    @@abbr['RPDS'] = 'RAPIDS'
    @@abbr['RST'] = 'REST'
    @@abbr['SHL'] = 'SHOAL'
    @@abbr['SHLS'] = 'SHOALS'
    @@abbr['SHR'] = 'SHORE'
    @@abbr['SHRS'] = 'SHORES'
    @@abbr['SMT'] = 'SUMMIT'
    @@abbr['SPC'] = 'SPACE'
    @@abbr['SPG'] = 'SPRING'
    @@abbr['SPGS'] = 'SPRINGS'
    @@abbr['SQ'] = 	'Square'
    @@abbr['SQ'] = 'SQUARE'
    @@abbr['ST'] = 	'Street'
    @@abbr['STA'] = 'STATION'
    @@abbr['STE'] = 'SUITE'
    @@abbr['STR'] = 	'Street'
    @@abbr['STRA'] = 'STRAVENUE'
    @@abbr['STRM'] = 'STREAM'
    @@abbr['TER'] = 	'Terrace'
    @@abbr['TER'] = 'TERRACE'
    @@abbr['TPKE'] = 'TURNPIKE'
    @@abbr['TRAK'] = 'TRACK'
    @@abbr['TRCE'] = 'TRACE'
    @@abbr['TRFY'] = 'TRAFFICWAY'
    @@abbr['TRL'] = 'TRAIL'
    @@abbr['TRLR'] = 'TRAILER'
    @@abbr['TUNL'] = 'TUNNEL'
    @@abbr['UN'] = 'UNION'
    @@abbr['UPPR'] = 'UPPER'
    @@abbr['VIA'] = 'VIADUCT'
    @@abbr['VIS'] = 'VISTA'
    @@abbr['VL'] = 'VILLE'
    @@abbr['VLG'] = 'VILLAGE'
    @@abbr['VLY'] = 'VALLEY'
    @@abbr['VW'] = 'VIEW'
    @@abbr['WAY'] = 'WAY'
    @@abbr['WLS'] = 'WELL'
    @@abbr['WLS'] = 'WELLS '
    @@abbr['XING'] = 'CROSSING'

    @@bearing['NW'] = 	'Northwest'
    @@bearing['NE'] = 	'Northeast'
    @@bearing['SE'] = 	'Southeast'
    @@bearing['SW'] = 	'Southwest'
    @@bearing['N'] = 	'North'
    @@bearing['E'] = 	'East'
    @@bearing['S'] = 	'South'
    @@bearing['W'] = 	'West'

  end

  def self.bearings 
    return @@bearing.keys
  end

  @@count=0

  def initialize()
    @attributes=Hash.new
    @@count -= 1
    @id=@@count
  end

  def emitkv (ios, k, v) 
    k.sub(".","_")
    k=k.downcase
    ios.write "<tag k=\"#{k}\" v=\"#{v}\"/>\n"   
  end
  
  def emitattr(ios)
#debug    print "emit :\n"
#debug    print @attributes

    @attributes.keys.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil? and v.length()  > 0 )
        emitkv ios, k, v
      end
    }
  
  end

  def osmxml (ios)
    emitattr(ios)
  end
  
end

class Node  < BaseNode

  def kv (k,v)
    @attributes[k]=v
  end

  def osmxml (ios)
    ios.write("<node id=\"#{@id}\" lat=\"#{@lat}\"  lon=\"#{@lon}\" >\n" )
    super
    ios.write("</node>\n")
  end

  def osmxmlref (ios)
    ios.write("<nd ref=\"#{@id}\" />\n")
  end

  def initialize(lat,lon)
    super()
    @lat=lat
    @lon=lon
  end

  def id
    @id
  end

  def lat
    @lat
  end

  def lon  
    @lon
  end
end

class GIS 
  
  def initialize()
    @properties=Array.new
    @datadir="data_louisville/"
    @destPrj  = Proj4::Projection.new("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs") 
    # the projection is kentucky north 
    # NAD83 / Kentucky North
    #<2205> +proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs no_defs <>
    @srcPrj = Proj4::Projection.new("+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"  )
  end

  def cache(street, url )
    local_filename=@datadir + street
    if ! File.directory?(@datadir)
      Dir.mkdir(@datadir, 0700) #=> 0
    end
    if File.exists?(local_filename)
      File.open(local_filename, "r") {|f|
        html= f.read
        return html
      }
    else   
      print url + "\n";
      html  = open(url,
                   "Referer" => "http://ags2.lojic.org/lojiconline/"
                   ) {|f| f.read }      
      File.open(local_filename, 'w') {|f| f.write(html) }
      return html
    end
  end


  def process_prop(inprop)
    
    print inprop

    data= inprop['attributes']

    p = Property.new()
   data.keys.each { |x|
      val = data[x]
      k = x.downcase
      k.sub(".","_")
      k = "data:" + k         
      p.kv( k, val.to_s)
    }

    geo= inprop['geometry']['rings'][0]
    geo.each { |x| p.addpoint(x[1],x[0]) }
    p.closeway
    p.cleanup
    @properties.push(p)
  end


  # use this webpage for analysis http://jeffersonpva.ky.gov/property-search/property-details/40046/?StrtNum=4219
  #lookup the parcel short
  def lookup_parcel_by_xy(x,y)
# box
    c = 200
    x1 = x - c
    x2 = x + c
    y1 = y - c
    y2 = y + c

    url =  "http://ags2.lojic.org/ArcGIS/rest/services/External/LOJICOnlineIdentify/MapServer/identify?" +
      "token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw..&"  +
      "f=json&" + 
      "geometry={\"x\":"+ x.to_s + ",\"y\":"+ y.to_s + ",\"spatialReference\":{\"wkid\":2246}}&" +
      "tolerance=4&" + 
      "returnGeometry=true" + 
      "&mapExtent={" + 
         "\"xmin\":" + x1.to_s + 
        ",\"ymin\":" + y1.to_s    + 
        ",\"xmax\":" + x2.to_s    + 
        ",\"ymax\":" + y2.to_s   + 
        ",\"spatialReference\":{\"wkid\":2246}" +
       "}&"  +
      "imageDisplay=1600,260,96&"    + 
      "geometryType=esriGeometryPoint&"    + 
      "sr=2246&"    + 
#      "sr=4326&"    + 
      "layers=all:3"    + 
      "&callback=dojo.io.script.jsonp_dojoIoScript35._jsonpCallback"


#    print "before encode:" + url + "\n"
    url = URI::encode(url)
#    print url + "\n"
# load the url
    html = cache "point_" + x.to_s + "_" + y.to_s ,url
    data= /jsonpCallback\(([^\)]+)\);$/.match(html)
    html=data[1]
    json = JSON.parse(html)
    if json 
      print "json"
      print json
    end
    #

#resone: dojo.io.script.jsonp_dojoIoScript35._jsonpCallback(
#     {"results":[
#                 {"layerId":3,"layerName":"Current Property Lines","value":"007A00460000","displayFieldName":"PARCEL ID NUMBER",
#                   "attributes":{"REVISED ON":"1/1/1992","PARCEL ID NUMBER":"007A00460000","PARCEL TYPE":"Parcel","BLOCK":"007A","LOT":"0046","SUBLOT":"0000","LRSN":"40699","UNIT COUNT":"0","EFFECTIVE DATE":"2/29/2008"},"geometryType":"esriGeometryPolygon","geometry":{"spatialReference":{"wkid":2246},"
    # rings":[[[1188674.875,280000.001249999],[1188651.0625,279868.688749999],[1188571.21875,279881.747500002],[1188557.71875,279862.8125],[1188550.52500001,279868.046250001],[1188570.1125,279894.627499998],[1188599.45874999,279934.452500001],[1188599.97624999,279936.012500003],[1188632.3125,280033.4375],[1188641.5625,280032],[1188679.71875,280025.875],[1188674.875,280000.001249999]]]}}]});
  end


# takes the street name, sid and house number, the house number will be used in the tak.
  def validate_address(street,sid,house_nr) 

    url = 'http://ags2.lojic.org/ArcGIS/rest/services/External/Address/MapServer/exts/AddressRestSoe/ValidateAddress?' +
      "token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw.."  +
      '&Houseno='+ house_nr.to_s + 
      '&SifID='+sid.to_s + 
      '&Apt='+
      '&f=json'+
      'callback=dojo.io.script.jsonp_dojoIoScript52._jsonpCallback'

    html = cache  "house" + sid + "_house" + house_nr ,url

    json = JSON.parse(html)

    if json 
      if json.include?('Candidates')
        json['Candidates'].each{ |house|

          # lookup the parcel info
          json = lookup_parcel_by_xy( house["X" ] ,house["Y" ]  )
          
          process_prop(json)
        }
      end     
    end

  end

  def lookup_housenumbers(street, sid, number)    
    ns= number.to_s
    print "Check lookup_housenumbers :street" + street
    print "sid" + sid.to_s
    print "number" + ns + "\n"
    validate_address(street,sid.to_s,ns)
  end



  #---------------------------------------------------
  # lookup parcel boundry :
  #http://ags2.lojic.org/ArcGIS/rest/services/External/Parcel/MapServer/0/query?token=XByufiRcTeZJOARKuu3jJavph6GoisEjGELL_yk-xkwMECl-c3o3_qDEf-FmWyjyZCEPjmhS5GnuTWO2WtTWbw..&f=json&where=LRSN%20%3D%2040046&returnGeometry=true&spatialRel=esriSpatialRelIntersects&outFields=OBJECTID%2CUNIT_COUNT&callback=dojo.io.script.jsonp_dojoIoScript7._jsonpCallback

  #---------------------------------------------------
  #lookup parcel details 
# http://ags2.lojic.org/ArcGIS/rest/services/External/Parcel/MapServer/exts/ParcelRestSoe/GetReport?token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw..&LRSN=40046&f=json&dojo.preventCache=1368406527611&callback=dojo.io.script.jsonp_dojoIoScript38._jsonpCallback
  #dojo.io.script.jsonp_dojoIoScript38._jsonpCallback({"ErrorMessage":"None","LRSN":"40046","Block":"007B","Lot":"0007","Sublot":"0000","PropertyAddress":"4219 W MUHAMMAD ALI BLVD","ParentParcel":"01","GISAcres":"   0.12390","PropertyClass":"R - Res 1 Family Dwelling","Homestead":" ","Lastname":"AVERY","Firstname":"STEPHANIE A","Name":" ","Address1":"4219 W MUHAMMAD ALI BLVD","Address2":" ","City":"LOUISVILLE","State":"KY","Zipcode":"40212-2439","LandValue":"$5,000.00","ImprovementValue":"$61,500.00","TotalValue":"$66,500.00","YearAssessed":"2013","SatelliteCity":"N","Neighborhood":"101149","SchoolDistrict":" ","FireDistrict":"23","OldDistrict":"01","YearBuilt":"1939","SquareFeet":"1219","ConstructionType":"1.5 STORY","WallType":"BRICK","Bathrooms":"1","CentralAir":"YES","Basement":"FULL","Fireplaces":"1","GarageType":"DETACHED","GarageSize":"2 CAR","Transfers":[{"Grantee":"AVERY STEPHANIE A","Grantee2":"","Grantor":"OMEARA GERALD & BOOKER D","Grantor2":"","DeedBook":"7082","DeedPage":"0706","SaleDate":"8/3/1998","SalePrice":"$48,000.00"}]});

# if you want to guess at them, use -1 for the from, to and step
  def lookup(street,from_number,to_number,number_step) 
    if @properties.include?(street)
      return @properties[street]
    end
    qry=URI::encode(street) 
#query the street name to get the SifID
    url = "http://ags2.lojic.org/ArcGIS/rest/services/External/Address/MapServer/exts/AddressRestSoe/ValidateStreetName?StreetName="+ qry + 
      "&token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw.."  +
      '&f=json&dojo.preventCache=1365987076181&callback=dojo.io.script.jsonp_dojoIoScript49._jsonpCallback'
# load the url
    html = cache street + "",url
#convert jsonp into json
    data= /jsonpCallback\(([^\)]+)\);$/.match(html)
    html=data[1]
    json = JSON.parse(html)
    if json 
      if json.include?('Candidates')        
        json['Candidates'].each{ |street_obj|
          $current_number = from_number
          while $current_number < to_number do 
            print "going to lookup "+ $current_number.to_s + "\n"
            lookup_housenumbers(street, street_obj["SifID"],$current_number)
            $current_number = $current_number + number_step
          end
        }
      else
        warn "nothing for " + street + "\n"
        return nil
      end      
    end
    return p
  end

# write the xml file
  def osmxml (ios)
    ios.write("<osm version=\"0.6\" >\n")
    @properties.each { |x| 
      x.osmxml(ios) 
    }
    ios.write("</osm>\n")
  end

  # look up this street and scan the house number from number to number with a step between them defined.
  def simple (street,from_number,to_number,number_step)
    @properties.clear
    #process([x])
    p= lookup( street,from_number,to_number,number_step)
    f = File.open("lousville" + street + '_'+ from_number.to_s + '_' + to_number.to_s + '_' + number_step.to_s  + ".osm", 'w') 
    osmxml(f)
  end
  
end

g=GIS.new()

street_name  = ARGV[0]
from_number  = ARGV[1].to_i
to_number    = ARGV[2].to_i
number_step    = ARGV[3].to_i
if (number_step == 0) 
  print "number step must be non null\n"
  exit
end
  
print "going to process " + street_name
g.simple(street_name,from_number,to_number,number_step)



