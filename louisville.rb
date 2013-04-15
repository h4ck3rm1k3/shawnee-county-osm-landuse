#!/usr/bin/ruby
# -*- coding: utf-8 -*-
require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'

class LandUse
  def church (obj)
    p obj
    abort "todo"
  end
end

class BaseNode 
  def self.initfields ()
    @@abbr= Hash.new
    @@abbr['AL'] = 	'Alley'
    @@abbr['ALY'] = 'ALLEY'
    @@abbr['ANX'] = 'ANNEX'
    @@abbr['APT'] = 'APARTMENT'
    @@abbr['ARC'] = 'ARCADE'
    @@abbr['AVE'] = 	'Avenue'
    @@abbr['AVE'] = 'AVENUE'
    @@abbr['BCH'] = 'BEACH'
    @@abbr['BG'] = 'BURG'
    @@abbr['BLDG'] = 'BUILDING'
    @@abbr['BLF'] = 'BLUFF'
    @@abbr['BLVD'] = 'BOULEVARD'
    @@abbr['BLVD'] = 'Boulevard'
    @@abbr['BND'] = 'BEND'
    @@abbr['BR'] = 'BRANCH'
    @@abbr['BRG'] = 'BRIDGE'
    @@abbr['BRK'] = 'BROOK'
    @@abbr['BSMT'] = 'BASEMENT'
    @@abbr['BTM'] = 'BOTTOM'
    @@abbr['BYP'] = 'BYPASS'
    @@abbr['BYU'] = 'BAYOU'
    @@abbr['CIR'] = 	'Circle'
    @@abbr['CIR'] = 'CIRCLE'
    @@abbr['CLB'] = 'CLUB'
    @@abbr['CLFS'] = 'CLIFF'
    @@abbr['CLFS'] = 'CLIFFS'
    @@abbr['COR'] = 'CORNER'
    @@abbr['CORS'] = 'CORNERS'
    @@abbr['CP'] = 'CAMP'
    @@abbr['CPE'] = 'CAPE'
    @@abbr['CRES'] = 'CRESCENT'
    @@abbr['CRK'] = 'CREEK'
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
    @@abbr['road'] = 'Road'

    @@codesl= Hash.new
    @@proto= LandUse.new

    @@bearing= Hash.new
    @@bearing['NW'] = 	'Northwest'
    @@bearing['NE'] = 	'Northeast'
    @@bearing['SE'] = 	'Southeast'
    @@bearing['SW'] = 	'Southwest'
    @@bearing['N'] = 	'North'
    @@bearing['E'] = 	'East'
    @@bearing['S'] = 	'South'
    @@bearing['W'] = 	'West'

    @@infields = %w{    
situs
owner1
owner2
owner3
address
city
state
zip
JOINPIN
plate
school
SYSCALACRES
OBJECTID
Shape.area
Shape.len


}

    @@fields = %w{    
addr:city
addr:postcode
addr:street
addr:housenumber
addr:suite
}




  end

  def self.getfields ()
    Property.initfields
    return [@@infields].flatten
  end

  def self.bearings 
    Property.initfields
    return @@bearing.keys
  end

  def initialize()
    super
    Property.initfields
  end

  @@count=0

  def attributes
    @attributes
  end 

  def setattributes(v)
    @attributes=v
  end 

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

    @@fields.each {|x| 
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

  def osmxml (ios)
    ios.write("<node id=\"#{@id}\" lat=\"#{@lat}\"  lon=\"#{@lon}\" >\n" )
    super
    ios.write("</node>\n")
  end

  def osmxmlref (ios)
    ios.write("<nd ref=\"#{@id}\" />\n")
  end

  def landuse 
  end

  def church 

  end

  def school

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

class Way  < BaseNode

  def initialize()
    super
    @nodes=Array.new
  end

  def nodes
    @nodes
  end
end

class Property  < Way
 

  def kv (k,v)
    @attributes[k]=v
  end

  def addpoint (lat,lon)
    p = Node.new(lat,lon)
    if (!p.nil?)
      @nodes.push(p)
    else
      abort "no node"
    end
  end

  def closeway
    if (!@nodes[0].nil?)
      @nodes.push(@nodes[0])
    else
    end
  end

  def midpoint 
    sumlat = 0
    sumlon = 0
    @nodes.each { |x| 
      sumlat += x.lat
      sumlon += x.lon
    }
    @middle=  Node.new(sumlat/@nodes.size,sumlon/@nodes.size)    

    @middle.setattributes( @attributes)
    @middle.landuse
    
  end


  def osmxml (ios)
    emitattr(ios)
    self.midpoint # calc the midpoint
    if (@middle.nil?)
      abort "midpoint not set"
      else      
      @middle.osmxml(ios)  #emit it
    end
  end

  def osmxml_way (ios)
    @nodes.each { |x| x.osmxml(ios) }
    ios.write("<way id=\"#{@id}\" >\n")

    emitattr(ios)

    @nodes.each { |x| x.osmxmlref(ios) }
    ios.write("</way>\n")
  end




  def cleanup

    if ! @attributes.include?("data:situs")
      abort('no address')
    end
    paddress=@attributes["data:situs"].capitalize()
    @attributes['addr:full']=paddress

    block = ""
    paddressa=paddress.split(%r{\s})
    housenumberorbearing = paddressa.shift
    @attributes['addr:housenumber'] =  housenumberorbearing

    endings = []

    #
    done = false
    while (!done)
      #paddressa or (! @attributes['addr:street_type'].nil?)
      streettype = paddressa.pop
      print "looking at " + streettype
      if (!streettype.nil?)
        streettypeu = streettype.upcase
        if ( @@abbr.include?(streettypeu))
          done = true
          @attributes['addr:street_type']=@@abbr[streettypeu]
          @attributes['addr:street_type']=@attributes['addr:street_type']
        else
          endings.push(streettype)          
        end
      else
        done = true
      end

    end

#    print endings

    paddressa.push(streettype) 
#    paddressa.push(blockname)
#    paddressa.push(blocknumber)

    @attributes['addr:street']=paddressa.join(" ") # the rest
    @attributes['addr:suite']=endings.join(" ") # the rest

    print "house number:"+ housenumberorbearing + "\t"
    print "address:"+ @attributes['addr:street'] + "\n"


    @attributes['addr:city']= @attributes["data:city"].capitalize()
    @attributes['addr:state']=@attributes["data:state"].capitalize()
    @attributes['addr:postcode']=@attributes["data:zip"].capitalize()
    @attributes['addr:country']="US"
    
  end 
end

require 'proj4'





class GIS 
  
  def initialize()
    @properties=Array.new
    @datadir="data_louisville/"
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

  def get(url)
  end

  def process_prop(inprop)
    
    fields3 = Property::getfields()
    data= inprop['attributes']
    p = Property.new()
#    fields3.each { |x|
#        if data.include?(x)
    data.keys.each { |x|
      val = data[x]
      k = x.downcase
      k.sub(".","_")
      k = "data:" + k         
      p.kv( k, val.to_s)

#      print "test:"+ k + val.to_s + "\n"
   #   else
      #     abort("missing" + x)
   #   end  
    }

    geo= inprop['geometry']['rings'][0]
    geo.each { |x| p.addpoint(x[1],x[0]) }
    p.closeway
    p.cleanup
    @properties.push(p)
  end



  def validate_address(sid,house)                       

   
    url = 'http://ags2.lojic.org/ArcGIS/rest/services/External/Address/MapServer/exts/AddressRestSoe/ValidateAddress?' +
      "token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw.."  +
      '&Houseno='+ house.to_s + 
      '&SifID='+sid.to_s + 
      '&Apt='+
      '&f=json'+
      'callback=dojo.io.script.jsonp_dojoIoScript52._jsonpCallback'

    html = cache  "house" + sid + "_house" + house ,url

    json = JSON.parse(html)
#    p json

    if json 
      if json.include?('Candidates')
        json['Candidates'].each{ |house|
#          warn "found : "
 
#LOUISVILLE SOUTH BASE 1/23
#feet   meters
#Northing/Y: 240989.4400 Northing/Y: 73453.728
#Easting/X: 1185268.1600 Easting/X: 361270.458
#Elevation/Z: 470.20 Elevation/Z: 143.459
#Convergence: -0 59 04.68869 Convergence: -0 59 04.68869
#Scale Factor: 0.999977225 Scale Factor: 0.999977225
#Combined Factor: 0.999959941 Combined
#Factor: 0.999959919

         
          #http://proj.maptools.org/gen_parms.html
          #http://www.lojic.org/apps/control/pdfs/techdocs/2005_RestoreDens/AppendixF_Meters05.pdf
          srcPoint = Proj4::Point.new(
                                      house["X" ] * 0.3048006 , # to meters
                                      house["Y" ] * 0.3048006 , #

                                      )

          #http://www.lojic.org/apps/control/pdfs/techdocs/2005_RestoreDens/AppendixD_LatLong05.pdf
          destPrj  = Proj4::Projection.new("+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs") 

          # http://spatialreference.org/ref/epsg/2205/proj4/
          #+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs 
          
# Position	1601 386536.474500541 83256.1817279209
# Zone	1601 - Kentucky North
#  	Meters	US Survey Feet	International Feet
# X	386536.475	1268161.750	1268164.286
# Y	83256.182	273149.656	273150.203
 
# Calculated Values - based on Degrees Lat Long to seven decimal places.
# Position Type	State Plane - Kentucky North
# Degrees Lat Long 	38.2428859°, -085.5461862°
# Degrees Minutes	38°14.57316', -085°32.77117'
# Degrees Minutes Seconds 	38°14'34.3894", -085°32'46.2703"
# State Plane X Y (Meters)	1601 386536.475mE 83256.180mN
# X Y (US Survey Feet)	1601 1268161.750ftUSE 273149.652ftUSN
# X Y (International Feet)	1601 1268164.286ftE 273150.198ftN
# UTM	16S 627222mE 4233763mN
# MGRS	16SFH2722233763
# Grid North	0.9°
# Maidenhead	EM78FF48KH90
# GEOREF	GJEJ27221457
          

          srcPrj = Proj4::Projection.new(
                                          "+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"
#                                         "epsg:2205"
                                         #"+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs <>"
                                         

                                         #"+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +to_meter=0.3048006096012192 +no_defs "
#                                         "+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=us-ft +no_defs "
                                         #"+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +to_meter=0.3048006096012192 +no_defs "
                                         #"+proj=lcc +lat_1=37.96666666666667 +lat_2=37.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +datum=NAD83 +units=m +no_defs "

                                         #"+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs "
                                         #"+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000 +y_0=0 +ellps=GRS80 +units=m +no_defs "
#                                         "+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=609601.2192024384 +y_0=0 +ellps=clrk66 +datum=NAD27 +to_meter=0.3048006096012192 +no_defs "
                                         #"+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +units=m +no_defs "
                                         #"+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=999999.9998983998 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 +no_defs "
                                         #"+proj=lcc +lat_1=37.08333333333334 +lat_2=38.66666666666666 +lat_0=36.33333333333334 +lon_0=-85.75 +x_0=1500000 +y_0=1000000 +ellps=GRS80 +datum=NAD83 +units=m +no_defs "
                                         #"+proj=lcc +lat_1=37.96666666666667 +lat_2=38.96666666666667 +lat_0=37.5 +lon_0=-84.25 +x_0=500000.0001016001 +y_0=0 +ellps=GRS80 +to_meter=0.3048006096012192 +no_defs "
                                         
                                         )

          

          point = srcPrj.transform(destPrj, srcPoint)
          p point 
#          p srcPoint

          #proj=lcc a=6378137 es=.0066943800229 lon_0=-84d15 lat_1=38d58 lat_2=37d58 lat_0=37d30 x_0=500000 y_0=0
        }
      end     
    end

  end


  def lookup_housenumbers(street, sid)    
    url = "http://ags2.lojic.org/ArcGIS/rest/services/External/Address/MapServer/exts/AddressRestSoe/ValidateHouseNumber?Houseno=-1&SifID=" + sid.to_s +
      "&token=XByufiRcTeZJOARKuu3jJV2mNkBRSCD--D1YqeBZDCuEij4BnbkuzNL3QcE-l3mwAnR7Rs9CoaKo-Xp8j4Tsuw.."  +
      '&f=json&dojo.preventCache=1365987076181&callback=dojo.io.script.jsonp_dojoIoScript49._jsonpCallback'

    html = cache street + "houses" + "",url

    data= /jsonpCallback\(([^\)]+)\);$/.match(html)
    html=data[1]
   
#    warn html

    json = JSON.parse(html)
    if json 
      if json.include?('Candidates')
        json['Candidates'].each{ |house_obj|
         # warn "found : "
          #p inprop
          validate_address(sid.to_s,house_obj["Houseno"].to_s)
        }
      else
#        p json
        warn "nothing for " + street + "\n"
        return nil
      end     
    end
    return p
  end

  def lookup(street) 
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

    
#    warn html
    json = JSON.parse(html)
    if json 
# did we find any candidates?

      if json.include?('Candidates')
        
        json['Candidates'].each{ |street_obj|
          lookup_housenumbers(street, street_obj["SifID"])
        }
      else
#        p json
        warn "nothing for " + street + "\n"
        return nil
      end
      
    end
    return p
  end

  def osmxml (ios)
    ios.write("<osm version=\"0.6\" >\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml(ios) 
    }
    ios.write("</osm>\n")
  end

  def osmxml_way (ios)
    ios.write("<osm version=\"0.6\" >\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml_way(ios) 
    }
    ios.write("</osm>\n")
  end

  def process (roads )
    found = 0
    roads.flatten.each { 
      |street|
      p= lookup( street)
    }
  end

  def simple (x)
    @properties.clear
    process([x])
  end
  
end

g=GIS.new()


ARGV.each { |x|
  print x;
  g.simple(x)
  }

