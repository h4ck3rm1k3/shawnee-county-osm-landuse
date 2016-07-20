require 'street_address'
class HouseMap

  def initialize
    @address = Hash.new()
  end
  
  
#  def new ()
  #  end
  def print()
    #puts self
    #puts @address

    for s in @address.keys.sort
      
      k = @address[s].keys
      
      if k.nil?
        puts "#{s};"
      else
        #puts "#{s} #{k}"
        #puts "#{s}  #{k}"
        puts "#{s}  #{k.sort.join(", ")}"
      end
      
    end
    
  end
  
  def add_num(key,n, value)
    return if key.nil?
    #return if n.nil?
    n = n.to_i
    if (@address[key].has_key?(n))
      o =@address[key][n]
      
      @address[key][n]=value
    else
      @address[key][n]=value
    end
    #puts "#{key} #{n} is now '#{@address[key][n]=1}'"
  end


  def process(addr, value)
    #if @address.nil?
    #  @address = Hash.new()
    #end
    #puts self
    #puts @address
    x= StreetAddress.parse(addr.downcase + ", lawrence, nj 08618")
    key = x['street'] + "|" + x['type']+ "|" + x['prefix']
    n = x['number']
    if !(@address.has_key?(key))
      @address[key]=Hash.new()
    end
    add_num(key,n, value)   

  end
end
