# coding: utf-8
require 'street_address'

class MercerCountyLoader


  
  def load_cleanup

    filename = '../school-districts/Lawrence/cleanup.txt'
    File.open(filename, "r") {|f|
      data = f.read
      lines = data.split("\n")
      lines.each { |l|
        l =l.chomp.downcase
        cols = l.split("\t")
        old = cols[0]
        new = cols[1]
        #puts "Load #{old} => #{new}"
        @replace[old]=new
      }
    }

  end

  def add_num(key,n)
    return if key.nil?
    #return if n.nil?
    n = n.to_i
    if (@address[key].has_key?(n))
      o =@address[key][n]
      
      @address[key][n]=o+1
    else
      @address[key][n]=1
    end
    #puts "#{key} #{n} is now '#{@address[key][n]=1}'"
  end


  def load_address(filename)
    
    #filename = 
    File.open(filename, "r") {|f|
      data = f.read
      lines = data.split("\n")
      lines.each { |l|
        l =l.chomp.downcase
        
        cols = l.split(",")
        address = cols[0]
        if address == 'address' # first row is the header
          next        
        end
        if (@replace.has_key?(address))
          address = @replace[address]
          #puts "#{address} => #{address2}"
        end
        
        #puts "#{address}"

        x= StreetAddress.parse(address + ", lawrence, nj 08618")
        if x['number'] == ''
          #puts address
          x= StreetAddress.parse("1 " +address + ", lawrence, nj 08618")

        end

        if x['number'] == ''
        #puts address
        #x= StreetAddress.parse("1 " +address + ", lawrence, nj 08618")
        else

          if x['street'] == ''
            puts "#{address}\t#{address}"
          else
            #puts x
            #{"number"=>"1", "prefix"=>"", "street"=>"zoar", "type"=>"st", "suffix"=>"", "city"=>"lawrence", "state"=>"nj", "zip"=>"08618"}
            key = x['street'] + "|" + x['type']+ "|" + x['prefix']

            n = x['number']
            if (@address.has_key?(key))


              #puts "'#{n}'"
              g = /^\s*(\d+)\-(\d+)\s*$/.match(n)
              if not g.nil?
                #puts("#{g[1]} - #{g[2]}")
                n2 = g[1].to_i
                while n2 <= g[2].to_i do
                  add_num(key,n2)
                  n2 = n2+1
                end
              else
                add_num(key,n)              
              end
              

            else
              @address[key]=Hash.new()
              add_num(key,n)
              
            end

          end
        end

      }
    }
  end

  def addresses
    return @address.keys.sort
  end

  def address(n)
    return @address[n]
  end

  def report
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
  def main(filename)
    @replace = Hash.new()
    load_cleanup
    @address = Hash.new()
    load_address(filename)
    
  end

end

