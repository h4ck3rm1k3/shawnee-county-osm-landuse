require './Node'

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
#    @middle.landuse
    
  end

  def osmxml (ios)
    @nodes.each { |x| x.osmxml(ios) }
    ios.write("<way id=\"#{@id}\" >\n")
    @attributes.keys.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil?)
        emitkv ios, k, v
      end

    }
    @nodes.each { |x| x.osmxmlref(ios) }
    ios.write("</way>\n")
  end


end
