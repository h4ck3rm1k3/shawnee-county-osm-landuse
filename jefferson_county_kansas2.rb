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
    OBJECTID 
    Shape 
    FNODE_ 
    TNODE_ 
    LPOLY_ 
    RPOLY_ 
    JFCO_ROADS 
    JFCO_ROA_1 
    RECNUM 
    L_F_ADD 
    L_T_ADD 
    R_F_ADD 
    R_T_ADD 
    FCC 
    ZIPL 
    ZIPR 
    COVER 
    SYMBOL 
    OWNER 
    MAINTAINER 
    ESN_EVEN 
    ESN_ODD 
    SURFACE 
    GRADERDIST
    COMMDIST 
    PRE_DIR 
    STR_NAM 
    STR_TYPE 
    SUF_DIR 
    SHAPE_Leng
    COMML 
    COMMR 
    ROADTYPE
    AUTOID
    Shape_Length
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




  def osmxml_way (ios)
    @nodes.each { |x| x.osmxml(ios) }
    ios.write("<way id=\"#{@id}\" >\n")

    emitattr(ios)

    @nodes.each { |x| x.osmxmlref(ios) }
    ios.write("</way>\n")
  end




end

class GIS 
  
  def initialize()
    @properties=Array.new
    @datadir="data_jefferson/"
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
      html  = open(url) {|f| f.read }      
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

    geo= inprop['geometry']['paths'][0]
    geo.each { |x| p.addpoint(x[1],x[0]) }
#    p.closeway

    @properties.push(p)
  end

  def lookup(street) 
    if @properties.include?(street)
      return @properties[street]
    end
    qry=URI::encode(street)

    fields3 = Property::getfields()
    fieldstr = CGI::escape(fields3.join(','))



#    http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsDynamic/MapServer/13?f=pjson
#    http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsStreet/MapServer/0/query
#    http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsHybrid/MapServer/0/query
#http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsHybrid/MapServer/0?f=pjson
    url = "http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsDynamic/MapServer/12/query" \
    "?spatialRel=esriSpatialRelIntersects"  +
      "&where=STR_NAM%20Like%20%27%25" + qry + "%25%27" +
      "&returnGeometry=true"    +
      "&f=json" +
      "&outSR=4326" +
      "&outFields=" + fieldstr 

    print "\n" + url + "\n"
    html = cache street,url
#    print html
    json = JSON.parse(html)
   
    if json 
      if json.include?('features')
        json['features'].each{ |inprop|
#          warn "found : "
#          p inprop
          process_prop(inprop)
        }
      else
#        p json
        warn "nothing for " + street + "\n"
        return nil
      end
      
    end
    return p
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
    if (@properties.count > 1)
#      p "found:" + x.to_s + " count: "+@properties.count.to_s
      f = File.open(x + "_way.osm", 'w') 
      osmxml_way(f)
    else
      p "no found :" + x 
    end
  end
  
end

g=GIS.new()


newstuff =[
           "kiowa",
           "edwards",
           "decatur",
           "jackson",
           "osage",
           "shawnee",
           "a",
           "e",
           "i",
           "o",
           "u",

]

newstuff.each { |x|
#  print x;
  g.simple(x)
  }
