#!/usr/bin/ruby
require 'open-uri'
require 'json'
#require 'PP'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'
# home
$LOAD_PATH.unshift(ENV["HOME"] + "/experiments/osmlib-base/lib" ) 

require 'OSM'
require 'OSM/objects'
require 'OSM/StreamParser'

results= Hash.new
results2= Hash.new
objects_per_oid= Hash.new
results4= Hash.new


results4["NO"]= Array.new


class LandUse
  def church (obj)
    p obj
    abort "todo"
  end
end

class BaseNode

  def self.find_ending(streettypeu)
    if ( @@abbr.include?(streettypeu))
      return @@abbr[streettypeu]
    elsif ( @@abbr.include?(streettypeu + "."))
      return @@abbr[streettypeu]
    elsif ( @@rabbr.include?(streettypeu))
      return streettypeu
    elsif ( @@rabbr.include?(streettypeu + "."))
      return streettypeu
    else
      #print "unknown: ", streettypeu  
    end
  end 

  def self.load_abbr(k,v)
    @@abbr[k.upcase ]=v.upcase
    @@rabbr[v.upcase ]=k.upcase
  end

  def self.lookup_abbr(k)
    if not k.nil?
      e = k.upcase
      if ( @@rabbr.include?( e))
        e = @@rabbr[e]
      end
      
      if ( @@abbr.include?( e))
        return e
      else
        #print "Missing", e, "\n"
      end
    end

  end

  def self.initfields ()
    @@nullobjects= Hash.new
    @@okobjects= Hash.new
    @@abbr= Hash.new
    @@rabbr= Hash.new
    load_abbr('EXT','EXTENSION')
    load_abbr('CANAL BASIN','CANAL BASIN')
    load_abbr('AL','Alley')
    load_abbr('ALY','ALLEY')
    load_abbr('TOWPTH','TOWPATH')
    load_abbr('ANX','ANNEX')
    load_abbr('APT','APARTMENT')
    load_abbr('ARC','ARCADE'  )
    load_abbr('AVE','AVENUE')
    load_abbr('AV','AVENUE')
    load_abbr('BCH','BEACH')
    load_abbr('BG','BURG')
    load_abbr('BLDG','BUILDING')
    load_abbr('BLF','BLUFF')
    load_abbr('BLD','BOULEVARD')
    load_abbr('BLVD','BOULEVARD')
    load_abbr('BLV','BOULEVARD')
    load_abbr('BND','BEND')
    load_abbr('BR','BRANCH')
    load_abbr('BRG','BRIDGE')
    load_abbr('BRK','BROOK')
    load_abbr('BSMT','BASEMENT')
    load_abbr('BTM','BOTTOM')
    load_abbr('BYP','BYPASS')
    load_abbr('BYU','BAYOU')
    load_abbr('CR','CIRCLE')
    load_abbr('CIR','CIRCLE')
    load_abbr('CLB','CLUB')
    load_abbr('CLFS','CLIFF')
    load_abbr('CLFS','CLIFFS')
    load_abbr('COR','CORNER')
    load_abbr('CORS','CORNERS')
    load_abbr('CP','CAMP')
    load_abbr('CPE','CAPE')
    load_abbr('CRES','CRESCENT')
    load_abbr('PT','PATH')
    load_abbr('CRK','CREEK')
    load_abbr('CRSE','COURSE')
    load_abbr('CSWY','CAUSEWAY')
    load_abbr('CT','COURT')
    load_abbr('CTR','CENTER')
    load_abbr('CTS','COURTS')
    load_abbr('CV','COVE')
    load_abbr('CYN','CANYON')
    load_abbr('DEPT','DEPARTMENT')
    load_abbr('DL','DALE')
    load_abbr('DM','DAM')
    load_abbr('DR','DRIVE')
    load_abbr('DV','DIVIDE')
    load_abbr('EST','ESTATE')
    load_abbr('EXPY','EXPRESSWAY')
    load_abbr('EXT','EXTENSION')
    load_abbr('FL','FLOOR')
    load_abbr('FLD','FIELD')
    load_abbr('FLDS','FIELDS')
    load_abbr('FLS','FALLS')
    load_abbr('FLT','FLAT')
    load_abbr('FRD','FORD')
    load_abbr('FRG','FORGE')
    load_abbr('FRK','FORK')
    load_abbr('FRKS','FORKS')
    load_abbr('FRNT','FRONT')
    load_abbr('FRST','FOREST')
    load_abbr('FRY','FERRY')
    load_abbr('FT','FORT')
    load_abbr('FWY','FREEWAY')
    load_abbr('GDNS','GARDEN')
    load_abbr('GDNS','GARDENS')
    load_abbr('GLN','GLEN')
    load_abbr('GRN','GREEN')
    load_abbr('GRV','GROVE')
    load_abbr('GTWY','GATEWAY')
    load_abbr('HBR','HARBOR')
    load_abbr('HL','HILL')
    load_abbr('HLS','HILLS')
    load_abbr('HNGR','HANGER')
    load_abbr('HOLW','HOLLOW')
    load_abbr('HTS','HEIGHTS')
    load_abbr('HVN','HAVEN')
    load_abbr('HWY','Highway')
    load_abbr('INLT','INLET')
    load_abbr('IS','ISLAND')
    load_abbr('ISS','ISLANDS')
    load_abbr('JCT','JUNCTION')
    load_abbr('KNLS','KNOLL')
    load_abbr('KNLS','KNOLLS')
    load_abbr('KY','KEY')
    load_abbr('LBBY','LOBBY')
    load_abbr('LCKS','LOCK')
    load_abbr('LCKS','LOCKS')
    load_abbr('LDG','LODGE')
    load_abbr('LF','LOAF')
    load_abbr('LGT','LIGHT')
    load_abbr('LK','LAKE')
    load_abbr('LKS','LAKES')
    load_abbr('LA','LANE')
    load_abbr('LN','LANE')
    load_abbr('LNDG','LANDING')
    load_abbr('LOWR','LOWER')
    load_abbr('MDWS','MEADOW')
    load_abbr('MDWS','MEADOWS')
    load_abbr('ML','MILL')
    load_abbr('MLS','MILLS')
    load_abbr('MNR','MANOR')
    load_abbr('MSN','MISSION')
    load_abbr('MT','MOUNT')
    load_abbr('MTN','MOUNTAIN')
    load_abbr('NCK','NECK')
    load_abbr('OFC','OFFICE')
    load_abbr('ORCH','ORCHARD')
    load_abbr('PARK','Park')
    load_abbr('PH','PENTHOUSE')
    load_abbr('PKWY','PARKWAY')
    load_abbr('PL','Place')
    load_abbr('PL','PLACE')
    load_abbr('PLN','PLAIN')
    load_abbr('PLNS','PLAINS')
    load_abbr('PLZ','PLAZA')
    load_abbr('PNES','PINE')
    load_abbr('PNES','PINES')
    load_abbr('PR','PRAIRIE')
    load_abbr('PRT','PORT')
    load_abbr('PT','POINT')
    load_abbr('RADL','RADIAL')
    load_abbr('RD','ROAD')
    load_abbr('RDG','RIDGE')
    load_abbr('RIV','RIVER')
    load_abbr('RM','ROOM')
    load_abbr('RNCH','RANCH')
    load_abbr('RPDS','RAPID')
    load_abbr('RPDS','RAPIDS')
    load_abbr('RST','REST')
    load_abbr('SHL','SHOAL')
    load_abbr('SHLS','SHOALS')
    load_abbr('SHR','SHORE')
    load_abbr('SHRS','SHORES')
    load_abbr('SMT','SUMMIT')
    load_abbr('SPC','SPACE')
    load_abbr('SPG','SPRING')
    load_abbr('SPGS','SPRINGS')
    load_abbr('SQ','Square')
    load_abbr('SQ','SQUARE')
    load_abbr('ST','Street')
    load_abbr('STA','STATION')
    load_abbr('STE','SUITE')
    load_abbr('STR','Street')
    load_abbr('STRA','STRAVENUE')
    load_abbr('STRM','STREAM')
    load_abbr('TERR','TERRACE')
    load_abbr('TER','TERRACE')
    load_abbr('TPKE','TURNPIKE')
    load_abbr('PK','PIKE')
    load_abbr('TRAK','TRACK')
    load_abbr('TRCE','TRACE')
    load_abbr('TRFY','TRAFFICWAY')
    load_abbr('TRL','TRAIL')
    load_abbr('TRLR','TRAILER')
    load_abbr('TUNL','TUNNEL')
    load_abbr('UN','UNION')
    load_abbr('UPPR','UPPER')
    load_abbr('VIA','VIADUCT')
    load_abbr('VIS','VISTA')
    load_abbr('VL','VILLE')
    load_abbr('VLG','VILLAGE')
    load_abbr('VLY','VALLEY')
    load_abbr('VW','VIEW')
    load_abbr('W','WAY')
    load_abbr('WLS','WELL')
    load_abbr('WLS','WELLS ')
    load_abbr('XING','CROSSING')
    load_abbr('rd','Road')
    load_abbr('run','RUN')


    @@codesl= Hash.new
    @@proto= LandUse.new

    @@bearing= Hash.new
    @@bearing['NW'] =   'Northwest'
    @@bearing['NE'] =   'Northeast'
    @@bearing['SE'] =   'Southeast'
    @@bearing['SW'] =   'Southwest'
    @@bearing['N'] =    'North'
    @@bearing['E'] =    'East'
    @@bearing['S'] =    'South'
    @@bearing['W'] =    'West'

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
addr:full
source
school
}
  end

  def self.getfields ()
    return [@@infields].flatten
  end

  def self.bearings
    return @@bearing.keys
  end

  def initialize()
    super   
  end

  @@count= 1

  def attributes
    @attributes
  end

  def setattributes(v)
    @attributes=v
  end

  def setkv(k,v)
    @attributes[k]=v
    oid = @attributes["data:objectid"]
    @@okobjects[oid]=1

    if (! @@nullobjects.include?(oid))
      @@nullobjects.delete(oid) # mark for delete
    end

  end

  def setnull(k,v)

    #print "adding null: ", k
    #print "Current: ", @attributes[k]
    oid = @attributes["data:objectid"]

    if (! @@okobjects.include?(oid))
      @@nullobjects[oid]=self
    end

  end

  def self.final_missing()

    f = File.open("missing_way.osm", 'w')

    # emit all null objects
    @@nullobjects.each do |k, v|
      v.osmxml_way(f)      
    end

  end

  def getkv(k )
    return @attributes[k]
  end

  def initialize()
    @attributes=Hash.new
    #@@count -= 1
    @@count += 1 # for shape files
    @id=@@count
    #print "Using ", @id, "\n" 
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

BaseNode.initfields

class Node  < BaseNode

  def osmxml (ios)
    ios.write("<node version=\"1\" id=\"#{@id}\" lat=\"#{@lat}\"  lon=\"#{@lon}\" >\n" )
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

  def self.do_cleanup(paddress)
    paddress=paddress.capitalize()
    paddress.gsub!("&"," and ")
    paddress.gsub!("- unit ","U-")
    paddress.gsub!("\(rear\)"," rear")

    addr_full=paddress # output
 
    block = ""
    paddress.gsub!("^\s+","")
    paddressa=paddress.split(%r{\s+})
    housenumberorbearing = paddressa.shift
    addrhousenumber =  housenumberorbearing # output
    endings = []

    done = false
    while (!done)

      streettype = paddressa.pop
      if ((!streettype.nil?) and (paddressa.length()> 0))
        streettypeu = streettype.upcase
        if streettypeu == '-'
          next
        end

        if (@@bearing.include?( streettypeu ))
          done = false
          addrbearing=@@bearing[streettypeu]
          #paddressa.push(streettype)

        elsif (@@bearing.include?( streettypeu + "."))
          done = false
          addrbearing=@@bearing[streettypeu]
           #paddressa.push(streettype)

        elsif ( @@abbr.include?(streettypeu))
          done = true
          addrstreet_type=@@abbr[streettypeu]          
        elsif ( @@abbr.include?(streettypeu + "."))
          done = true
          addrstreet_type=@@abbr[streettypeu]
        elsif ( @@rabbr.include?(streettypeu))
          done = true
          addrstreet_type=streettypeu
        elsif ( @@rabbr.include?(streettypeu + "."))
          done = true
          addrstreet_type=streettypeu
        else
          #print
          endings.push(streettype)
        end

      else
        done = true
      end
    end

    addrstreet_name=paddressa.join(" ") # the rest
   

    addrstreet=paddressa.join(" ") # the rest
    if addrstreet_type.nil? 
      #print "no type", addr_full, "\n"
      #exit(0)
      return ""
    else
      if addrstreet_name.nil?
        print "no name ",addrstreet_name, "\n"
        exit(0)
      else
        return addrstreet_name + " " + addrstreet_type        
      end      
    end

  end


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

    # filter out ones with no school
    if (@attributes.nil?)
      #return
    end
    if (not @attributes.include?( 'school' ))
      #return
    end

    @nodes.each { |x| x.osmxml(ios) }
    ios.write("<way version=\"1\" id=\"#{@id}\" >\n")

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
    paddress.gsub!("- unit ","U-")
    paddress.gsub!("\(rear\)"," rear")
    @attributes['addr:full']=paddress
    #print "Cleanup",paddress,"\n"
    block = ""
    paddress.gsub!("^\s+","")
    paddressa=paddress.split(%r{\s+})
    housenumberorbearing = paddressa.shift
    if /^\n+$/.match(housenumberorbearing)
      @attributes['addr:housenumber'] =  housenumberorbearing
    end

    #print "housenumberorbearing", housenumberorbearing, "\n"
    endings = []

    #
    done = false
    while (!done)

      streettype = paddressa.pop

      #print "Check type:", streettype, ' addr', paddressa, "\n"

      #if streettype == ""
      #   streettype = nil
      #end

      if ((!streettype.nil?) and (paddressa.length()> 0))

        streettypeu = streettype.upcase

        if streettypeu == '-'
          next
        end


        if (@@bearing.include?( streettypeu ))
          done = false
          @attributes['addr:bearing']=@@bearing[streettypeu]
          #paddressa.push(streettype)

        elsif (@@bearing.include?( streettypeu + "."))
          done = false
          @attributes['addr:bearing']=@@bearing[streettypeu]
          #paddressa.push(streettype)

        elsif ( @@abbr.include?(streettypeu))
          done = true
          @attributes['addr:street_type']=@@abbr[streettypeu]          
        elsif ( @@abbr.include?(streettypeu + "."))
          done = true
          @attributes['addr:street_type']=@@abbr[streettypeu]

        elsif ( @@rabbr.include?(streettypeu))
          done = true
          @attributes['addr:street_type']=streettypeu
        elsif ( @@rabbr.include?(streettypeu + "."))
          done = true
          @attributes['addr:street_type']=streettypeu
        else
          #print
          endings.push(streettype)
        end

      else
        done = true
      end
    end

    #print "Check attr:", @attributes, "\n"
    
    if @attributes['addr:street_type'] == ''
      #paddressa.push(streettype)
      #@attributes['addr:street_type'] = streettypeu
      print "No street type found", [paddress, endings]
      exit(0)
    end
    #    paddressa.push(blockname)
    #    paddressa.push(blocknumber)

    @attributes['addr:street']=paddressa.join(" ") # the rest
    @attributes['addr:suite']=endings.join(" ") # the rest

    if @attributes['addr:suite'] != ""
      #print "Final Suite: " + @attributes['addr:suite'] + ": " + paddress + "\n"
    end

    #@attributes['source']=endings.join(" ") # the rest

    #@attributes['addr:street'].sub("&"," and ")
    #print "house number:"+ housenumberorbearing + "\t"
    #print "address:"+ @attributes['addr:street'] + "\n"


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
      #print "Local :"+ local_filename + "\n"
      File.open(local_filename, "r") {|f|
        html= f.read
        return html
      }
    else
      #print "going to open:"+ url + "\n"
      html  = open(url) {|f| f.read }
      #print "got :" + html + "\n"
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
      return p
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

    @found=Array.new
    #print "\n" + url + "\n"
    html = cache street,url
    json = JSON.parse(html)
    if json
      if json.include?('features')
        json['features'].each{ |inprop|
          #          warn "found : "
          #          p inprop
          x = process_prop(inprop)
          @found.push(x)
        }
      else
        #        p json
        warn "nothing returned for " + street + "\n"
        return nil
      end

    end
    return @found
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
      #f = File.open(x + ".osm", 'w')
      #osmxml(f)
      f = File.open(x + "_way.osm", 'w')
      osmxml_way(f)
    else
      p "no found :" + x
    end

    @properties.clear
  end

end

g=GIS.new()
  
class MyCallbacks < OSM::Callbacks
  @@names= Hash.new

  def self.include(name)
    if @@names.include?(name)
      return true
    else
      return false
    end
  end

  def self.match(name)
    if @@names.include?(name)
      @@names[new_street] = 2
    end
  end

  def self.unmatched() 
    @@names.each do |key, value|
      if value == 1
        puts "Unused: ", key
      end
    end
  end

  def way(way)
    if not way.tags['name'].nil?
      n = way.tags['name']
      n.gsub!("&amp;"," and ")
      n.gsub!("&apos;","'")

      new_street = Property.do_cleanup("1 " +n).upcase

      if @@names.include?(new_street)
        #print "exists '",new_street, "'\n"
      else
        #print "'",new_street, "'\n"
        @@names[new_street] = 1
        @@names[new_street.gsub!("'",'')] = 1
      end
      
    end
  end
  
end


cb = MyCallbacks.new
parser = OSM::StreamParser.new(
                               :filename => ENV["HOME"] + '/experiments/school-districts/lawrence/lawrence_township.osm', 
                               :callbacks => cb
                               )
parser.parse


ARGV.each { |x|
  File.open(x, "r") {
    |f|
    #print "read", f, "\n"
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

      if street == 'road'
        next        
      end

      if street == ''
        #print "What", l, "\n"        
      end

      new_street = Property.do_cleanup("1 " +street).upcase

      #print "process:", l, "\n"
      steps=street.split(%r{\s})
      found = 0

      #print "Check1",steps,"\n"
      if (steps.length()  > 1 )
        simple = steps[0..-2].join(" ")

        ending = steps[-1]

        ending = BaseNode.find_ending(ending)

        print "Check: ",simple, " and ending : ", ending,"\n"

        p = g.simple(simple)

        if p
          #if False
          p.each { |i|
            if i
              print "Consider:", i.getkv('addr:full'), " ending:",ending,"\n"
              # no turn long names into short ons
              e = BaseNode.lookup_abbr(ending)
              # for each house found :
              #i.setkv('school',school)
              # first check the ending
              #rint i.attributes
              e2= i.getkv('addr:street_type')
              if e2
                e2 = e2.upcase
                if e == e2
                  hn = i.getkv('addr:housenumber').to_i
                  if hn == 0
                    #print "no number found:", hn, " from " 
                    #print from, " to ", to, " line:",l , " in:", i.getkv('addr:full'), "\n"
                    #print i.oattributes
                    #next
                    i.setnull('school',"UNKNOWN") # done
                    #next
                  end
                  #print "found: ", ending, " with type ",
                  #print            i.getkv('addr:street_type').upcase,"\n"
                  if from == ""
                    #print "skip", l, "\n"
                    #p = g.simple(street)
                    #i.setkv('school',school) # done
                  else
                    if to == ""
                      #print "skip", l, "\n"
                    else
                      from = from.to_i
                      to = to.to_i
                      if from < to
                        # get the
                        if hn >= from
                          if hn <= to
                          else
                            print "not before to", hn, "from", to,  "\n"
                            i.setnull('school',"NONE") # done
                            next
                          end
                        else
                          print "skip too early :", hn, " cut off from", from,  "\n"
                          next
                        end
                      elsif from == to
                        if from > 0
                          if from == hn
                            # ok
                          else
                            #print "does not equal from/to", hn, "==", from,  "\n"
                          end
                        end
                      else
                        if to == 0
                          # we take all over the from
                          if hn > from
                            # ok
                          else
                            print "not after from", hn, "from", from,  "in line",l,  "\n"
                            i.setnull('school',"NONE") # done
                            next
                          end
                        else
                          # badly formatted input
                          #print "from < to", from,":", to, "in line",l,  "\n"
                        end
                      end
                      ## now check even and odd
                      r = (hn % 2)
                      if r == 0
                        if even == "even"
                          # ok
                        elsif even == "odd"
                          #print "not odd", hn, "in",l,"\n"
                        else
                        end
                      else # the number is odd
                        # odd
                        if even == "odd"  # we are looking for odd
                          # ok
                        elsif even == "even"
                          print "not even", hn, "in",l,"\n"
                          i.setnull('school',"NONE") # done
                          next
                        else
                          # empty
                        end
                      end
                    end # not to == ""
                  end ## from
                end
                ###############


              end

## now check the rest
              street2 =i.getkv('addr:street')
              street_type =i.getkv('addr:street_type')
              if street2.nil? or street2 == ""
                #print "Street2 is null\n"
                street2="Unknown"
              end

              if street_type.nil? or street_type == ""
                #print "Street2 is null\n"
                street_type="Unknown"
              end

              st = street2.upcase + " " +street_type.upcase # done
              addr= i.getkv('addr:full')
              oid = i.getkv("data:objectid")

              objects_per_oid[oid]=i
              
              # is found
              if new_street.upcase == st
                print "found", i.getkv('addr:street'), i.getkv('addr:street_type'), "\n"
                i.setkv('school',school) # done
                found = found + 1
              else
                school = "NO"
                i.setnull('school',"NONE") # done
              end                

                results[addr]=school
                results2[oid]=school

              if ( !results4.include?(school) )
                print "adding school", school, "\n"
                results4[school]= Array.new
              else
                print "not adding school", school, "\n"
              end
              print oid,"\t", school,"\t", i,  "\n"
              results4[school] << oid
              
              #print results4[school],  "\n"
              
              #end              
            end
            
          }
        else
          print "Not found", simple, "\n"
        end

        if found ==0
         

          if MyCallbacks.include(new_street)
            print "found on osm: '", street, ' ->', new_street, "\n"
          else
            print "street: '", street, "' -> '", new_street, "' did not find any '",l,"' in mercer\n"
            print "missing on osm: '", new_street, ' ->', "'",l,"'\n"
          end

          
        else
          print "street", street, " found :",found, "\n"
        end
      end

    }
  }
  #print "X",x, "\n"

}

g.emit("all")

# osm processing
#MyCallbacks.unmatched()

# TODO : process them in order, hash by full address and overwrite the school
# emit only one property per address.
# results.each { |k,v|
#   print k,"\t",v,"\n"
# }

results4.each { |k,v|
  print k, "\t",v, "\n"
  f = File.open(k + "_way.osm", 'w')

  f.write("<osm version=\"0.6\" >\n")

  v.each { |i|
    #print i
    o1 = objects_per_oid[i]
    o1.osmxml_way(f)    
    print o1 , "\n"
  }
  f.write("</osm>\n")

} 

