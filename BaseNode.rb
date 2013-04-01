class BaseNode 

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
  

  def osmxml (ios)
    @attributes.keys.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil?)
        emitkv ios, k, v
      end
    }
  end
  
end
