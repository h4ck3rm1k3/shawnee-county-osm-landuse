require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'

class BaseNode 
  def attributes
    @attributes
  end 

  def initialize()
    @attributes=Hash.new

  end

  def osmxml (ios)
    
    @attributes.each { |k, v|  ios.write "<tag k=\"#{k}\" v=\"#{v}\"/>\n"    }
  end

end

class Node  < BaseNode
  
  @@count=-1

  def osmxml (ios)

    ios.write ("<node id=\"#{@id}\" lat=\"#{@lat}\" >\n")
    super
    ios.write ("</node>\n")

  end

  def osmxmlref (ios)
    ios.write ("<nd ref=\"#{@id}\" />\n")
  end

  def initialize(lat,lon)
    super()
    @@count = @@count -1
    @id=@@count
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

  def initialize()
    super
  end

  def kv (k,v)
    @attributes[k]=v
  end

  def addpoint (lat,lon)
    p = Node.new(lat,lon)
    @nodes.push(p)
  end
  def closeway
    @nodes.push(@nodes[0])
  end
  
  def osmxml (ios)

    @nodes.each { |x| x.osmxml(ios) }

    ios.write ("<way>\n")
    super
    @nodes.each { |x| x.osmxmlref(ios) }
    ios.write ("</way>\n")

  end

end


class GIS 
  
  def initialize()
    @properties=Array.new
  end
  
  def lookup(street) 

    if @properties.include?(street)
      return @properties[street]
    end


    qry=URI::encode(street)
    srlatlong=4326

    fields = %w{    OBJECTID     PARCELNUM    ACRES    PIN     PID     QUICKREFID    ONAME     PADDRESS    PADDRESS2    MAILNAME     MAILADDRESS 
    MAILADDRESS2    DBOOKPAGE     SUBS     NBHD     TAXUNIT    USD     LBCSFUNCTION     LBCSACTIVITY     CLASS     BLDGVAL     LDVAL 
    TOTVAL    Shape     WebLink     PRC_Link     Shape.area     Shape.len }

    fieldstr = CGI::escape(fields.join(','))

    url = "http://gis.snco.us/ArcGIS/rest/services/Parcels/MapServer/0/query" \
    "?outFields=" + fieldstr +
      "&spatialRel=esriSpatialRelIntersects" \
    "&f=json" \
    "&outSR=" + srlatlong.to_s + "&where=PADDRESS%20LIKE%20%27%25" + qry + "%25%27&returnGeometry=true"    

    html  = open(url) {|f| f.read }
    json = JSON.parse(html)
#    p json
    p = Property.new()

    if json 
      if json.include?('features')
        data= json['features'][0]['attributes']
        fields.each { |x|
          val = data[x]
          p.kv( x.to_s, val.to_s)
        }
        geo= json['features'][0]['geometry']['rings'][0]
        geo.each { |x| p.addpoint(x[0],x[1]) }
        p.closeway
      end
    end
    @properties.push(p)
    return p
  end
  def osmxml (ios)
    ios.write ("<osm>\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml(ios) 
    }
    ios.write ("</osm>\n")
  end

end

g=GIS.new()
p=g.lookup("218 SW 1ST ST")
ios = IO.new STDOUT.fileno
g.osmxml(ios)
