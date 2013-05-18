#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'
require 'pp'
# 
require 'proj4'
require './BaseNode'
require './Way'
require './Property'

#from this page http://ags2.lojic.org/lojiconline/
#click on a parcel in high zoom to lookup a parcel


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



  def process_prop(inprop2)
    
#    print "prop:"
#    pp inprop
#    print  "\n"
#    print "prop:results"+ inprop["results"]+ "\n"
#    print "prop:results0"+ inprop["results"][0]+ "\n"
#    print "prop:results0attr:"
#    pp  inprop["results"][0]
    inprop=inprop2["results"][0]

#      if (!v.nil? and v.length()  > 0 )
#"results"=>[
#{"layerId"=>3, "layerName"=>"Current Property Lines", "value"=>"016B00670000", "displayFieldName"=>"PARCEL ID NUMBER", 
    #"attributes"=>{"REVISED ON"=>"12/5/2003", "PARCEL ID NUMBER"=>"016B00670000", "PARCEL TYPE"=>"Parcel", "BLOCK"=>"016B", "LOT"=>"0067", "SUBLOT"=>"0000", "LRSN"=>"61176", "UNIT COUNT"=>"0", "EFFECTIVE DATE"=>"8/30/2007"}, "geometryType"=>"esriGeometryPolygon", "geometry"=>{"spatialReference"=>{"wkid"=>2246}, "rings"=>[[[1210031.28125, 276656.126249999], [1210065, 276651.1875], [1210096.65625, 276646.626249999], [1210130.5, 276641.6875], [1210179.125, 276634.625], [1210199.62625, 276631.625], [1210209.50125, 276630.1875], [1210225.03125, 276627.9375], [1210225.53125, 276631.25], [1210248.5325, 276627.748750001], [1210250, 276627.522499993], [1210318.53125, 276616.875], [1210343.75, 276613], [1210368.31375, 276609.1875], [1210397.09375, 276604.75], [1210413.875, 276602.125], [1210436.40625, 276598.6875], [1210460.93875, 276594.875], [1210484.56375, 276591.251249999], [1210553.78, 276580.498750001], [1210547.21875, 276537.25], [1210544.78125, 276521.25], [1210542.28125, 276504.873750001], [1210539.75, 276488.1875], [1210536.96875, 276470], [1210534.03125, 276450.6875], [1210532.34375, 276439.625], [1210525, 276391.4375], [1210521.28125, 276367.0625], [1210515.1875, 276326.875], [1210512, 276305.936250001], [1210508.5625, 276283.4375], [1210508.5, 276283.125], [1210502.5625, 276244.1875], [1210498.0325, 276214.375], [1210496.28125, 276202.875], [1210299.34375, 276231.873750001], [1210300.65625, 276242.625], [1210250, 276250.420000002], [1210152.40625, 276265.4375], [1210123.09375, 276269.9375], [1210093.90625, 276274.4375], [1210049.5, 276281.251249999], [1209975.8125, 276292.5], [1209980.5, 276323.0625], [1209998.375, 276440.188749999], [1210004.5625, 276480.9375], [1210007.875, 276502.4375], [1210031.28125, 276656.126249999]]]}}]}./louisville_parcel.rb:311:in `process_prop': undefined method `[]' for nil:NilClass (NoMethodError)
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
    geo.each { |x| 
      srcPoint = Proj4::Point.new( 
                                  x[0]  * 0.3048006 ,     x[1] * 0.3048006)
      point = @srcPrj.transform(@destPrj, srcPoint)
      lat = point.x  * Proj4::RAD_TO_DEG
      lon= point.y  * Proj4::RAD_TO_DEG
      p.addpoint(lon,lat)
    }
    p.closeway
    #    p.cleanup
    @properties.push(p)
    #    pp p
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
#      print "json"
#      print json
      return json
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
    f = File.open("louisville" + street + '_'+ from_number.to_s + '_' + to_number.to_s + '_' + number_step.to_s  + ".osm", 'w') 
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



