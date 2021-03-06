require 'OSM'
require 'OSM/objects'
require 'OSM/StreamParser'
require 'street_address'


#class MyCallbacks 
 
#end

class OpenStreetMap < OSM::Callbacks

  def normalize(address)
    address =address.chomp.downcase
    x= StreetAddress.parse(address + ", lawrence, nj 08618")
    if x['number'] == ''
      #puts address
      x= StreetAddress.parse("1 " +address + ", lawrence, nj 08618")
    end
    
    if x['number'] == ''
    #puts address  
    else
      
      if x['street'] == ''
      #puts "#{address}\t#{address}"
      else
        
        key = x['street'] + "|" + x['type']+ "|" + x['prefix']
        #      puts "KEY : #{key}"
        return key
      end      
    end
    return "None"
end
  
  @@names= Hash.new
  @@houses= Hash.new
  @@schools= Hash.new
  
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
    #id = way.tags['id']
    id2 = way.id
    
    if not way.tags['name'].nil?
      h = way.tags['highway']
      a = way.tags['access']
      return if a == 'private';
      n = way.tags['name']
      n.gsub!("&amp;"," and ")
      n.gsub!("&apos;","'")
      new_street = "1 #{n}"
      if @@names.include?(new_street)
        #print "exists '",new_street, "'\n"
      else
        if  ! h.nil?
          #print "'",h, " ", new_street, "'\n"
          
          @@names[normalize(new_street)] = id2          
          @@names[new_street] = id2
          @@names[new_street.gsub!("'",'')] = id2
           
        end
      end
      
    end
  end

  def node(way)
    #id = way.tags['id']
    id2 = way.id

    
    if not way.tags['addr:street'].nil?
      n = way.tags['addr:street']
      c = way.tags['addr:city']
      hn = way.tags['addr:housenumber']
      return if c != 'Lawrence twp';

      n.gsub!("&amp;"," and ")
      n.gsub!("&apos;","'")
      new_street = "1 #{n}"

      #puts "Test #{@@houses}"
      
      if @@houses.include?(new_street)
        #print "exists '",new_street, "'\n"
      else
        if  ! hn.nil?

          n = normalize(new_street)
          
          if @@houses[n].nil?
            
            #@h = Hash.new
            @@houses[n] = Hash.new
           # @@houses[normalize(new_street)] = h
           # @@houses[new_street.gsub!("'",'')] = h
          end
          hn = hn.to_s
          #puts "Test #{@@houses[new_street]}"
          @@houses[n][hn] = id2         
           
        end
      end
    end
  end


  # def db=(x)    
  # end
  # def on_start_document()   
  # end

  # def start_document()
  # end
  
  # def start_document()
  # end
  
  def main(filename)
    #cb = MyCallbacks.new
    parser = OSM::StreamParser.new(  :filename => filename,   :callbacks => self    )
    parser.parse    
  end

  def addresses
    
    return @@names
    
  end
  def houses    
    return @@houses
  end
  
end
