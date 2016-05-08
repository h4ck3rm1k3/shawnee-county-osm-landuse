#!/usr/bin/ruby
require 'open-uri'
require 'json'
#require 'PP'
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

# the fields to query from the system
    @@infields = %w{    
OBJECTID
HADD
MUNICIPALITY
BLOCK
LOT
QCODE
MUN
PAMS_PIN
}

    @@fields = %w{  
addr:city
addr:postcode
addr:street
addr:housenumber
addr:suite
source
school
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

  def setkv(k,v)
    @attributes[k]=v
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
    #print @@fields

    @@fields.each {
      |x| 
      #print x
      k=x
      v=@attributes[k]
      if (!v.nil?  )
        #print "Value:",v, "\n"
        if ( v.length()  > 0 )
          emitkv ios, k, v
        end
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

    if ! @attributes.include?("data:hadd")
      
      abort('no address')
    end
    paddress=@attributes["data:hadd"].capitalize()
    paddress.gsub!("&"," and ")
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

      if (!streettype.nil?)
        print "Street type: " + streettype + ","
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

    paddressa.push(streettype) 
#    paddressa.push(blockname)
#    paddressa.push(blocknumber)

    @attributes['addr:street']=paddressa.join(" ") # the rest
    @attributes['addr:suite']=endings.join(" ") # the rest
    #@attributes['source']=endings.join(" ") # the rest

    #@attributes['addr:street'].sub("&"," and ")
    print "house number:"+ housenumberorbearing + "\t"
    print "address:"+ @attributes['addr:street'] + "\n"


    @attributes['addr:city']= @attributes["data:municipality"].capitalize()
#    @attributes['addr:state']=@attributes["data:state"].capitalize()
#    @attributes['addr:postcode']=@attributes["data:zip"].capitalize()
    #@attributes['addr:country']="US"
    
  end 
end

class GIS 
  
  def initialize()
    @properties=Array.new
    @datadir="data_douglas/"
  end
  
  def cache(street, url )
    local_filename=@datadir + street
    if ! File.directory?(@datadir)
      Dir.mkdir(@datadir, 0700) #=> 0
    end
    if File.exists?(local_filename)
      print "Local :"+ local_filename + "\n"
      File.open(local_filename, "r") {|f|
        html= f.read
        return html
      }
    else      
      print "going to open:"+ url + "\n"
      html  = open(url) {|f| f.read }      
      print "got :" + html + "\n"
      File.open(local_filename, 'w') {|f| f.write(html) }
      return html
    end
  end

  def get(url)
  end

  def process_prop(inprop)
    
#    p inprop 

    fields3 = Property::getfields()
    data= inprop['attributes']
    p = Property.new()
#    fields3.each { |x|
#        if data.include?(x)
    data.keys.each { |x|

      val = data[x]
      #print x,val,"\n"
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

    if data['MUNICIPALITY'] =='LAWRENCE TWP'
      @properties.push(p)
    end

  end

  def lookup(street) 
    if @properties.include?(street)
      return @properties[street]
    end
    qry=URI::encode(street)

    fields3 = Property::getfields()
    fieldstr = CGI::escape(fields3.join(','))


    base='http://maps.mercercounty.org/arcgis/rest/services/PIPortal/MercerPortalMap/MapServer/5/query'
    #?f=json&where=Upper(HADD)%20LIKE%20%27%25128%20W%20STATE%20ST%25%27%20AND%20MUN%20IN%20(%271101%27%2C%271102%27%2C%271103%27%2C%271104%27%2C%271105%27%2C%271106%27%2C%271107%27%2C%271108%27%2C%271114%27%2C%271112%27%2C%271111%27%2C%271113%27)&returnGeometry=true&spatialRel=esriSpatialRelIntersects&outFields=OBJECTID%2CHADD%2CMUNICIPALITY%2CBLOCK%2CLOT%2CQCODE%2CMUN%2CPAMS_PIN&outSR=102100' -H 'Host: maps.mercercounty.org' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101 Firefox/45.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Referer: http://pip.mercercounty.org/mapsearch' -H 'Origin: http://pip.mercercounty.org' -H 'Connection: keep-alive'

    url = base + 
      "?spatialRel=esriSpatialRelIntersects"  +
      "&where=upper(HADD)%20Like%20%27%25" + qry + "%25%27" +
      "&returnGeometry=true"    +
      "&f=json" +
      "&outSR=4326" +
      "&outFields=*" # + fieldstr 

    print "\n" + url + "\n"
    html = cache street,url
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
        warn "nothing returned for " + street + "\n"
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
      return p
    }
  end

  def simple (x)
    return process([x.upcase])
  end

  def emit (x)
    #p "found:" + x.to_s + " count: "+@properties.count.to_s

    
    if (@properties.count > 0)
      p "going to output" + x + ".osm"
      f = File.open(x + ".osm", 'w') 
      osmxml(f)
      f = File.open(x + "_way.osm", 'w') 
      osmxml_way(f)
    else
      p "no found :" + x 
    end
    
    @properties.clear
  end
  
end

g=GIS.new()


#ARGV.each { |x|
#  print x;
#  g.simple(x)
#  }

#print "school,street,number\n"           

ARGV.each { |x|
  File.open(x, "r") {
    |f|
    data = f.read
    lines = data.split("\n")
    lines.each { |l|
      cols = l.split(",")      
      school = cols[0]
      street = cols[1]
      from = cols[2]
      to = cols[3]
      even = cols[4]
      p = nil

      steps=street.split(%r{\s})
      print "Check1",steps,"\n"
      if (steps.length()  > 1 )
        simple = steps[0..-2].join(" ")
        print "Check",simple,"\n"
        p = g.simple(simple)       
      end
      #p = g.simple(street)           
      
      # if False
      #   if from == "" 
      #     #print "skip", l, "\n"
      #     p = g.simple(street)           
      #   else
      #     if to == "" 
      #       #print "skip", l, "\n"
      #     else
      #       from = from.to_i
      #       to = to.to_i

      #       if from < to 
      #         #print "Check1",even,from,to, "\n"
              
      #         if even == "" 
      #           #print school, ",", street, ",ALL\n"
      #           print "Check from ",from, "To:", to, "\n"
      #           for n in (from .. to) do
      #             p = g.simple(n.to_s + " " + street)   
      #           end
                
      #         elsif  even == 'even'
      #           #print "Even\n"
      #           for n in (from .. to) do
      #             r = (n % 2)
      #             #print n % 2 , "\n"
      #             if r == 0
      #               #print school, ",", street, ",", n , "\n"           
      #               p= g.simple(n.to_s + " " + street)   
      #             else
      #               #print "Odd",r, school, ",", street, ",", n , "\n"           
      #             end
      #           end
      #         end
      #       else
      #         #print "skip", l, "\n"           
      #       end
      #     end
      #   end
      # end
      if p
        p.setkv('school',school)
      end

    }
  }  
  #print "X",x, "\n"
  g.emit(x)
}

