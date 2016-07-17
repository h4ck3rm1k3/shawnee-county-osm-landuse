# coding: utf-8
require 'street_address'

$replace = Hash.new()



def load_cleanup

  filename = '/home/mdupont/experiments/school-districts/lawrence/cleanup.txt'
  File.open(filename, "r") {|f|
    data = f.read
    lines = data.split("\n")
    lines.each { |l|
      l =l.chomp.downcase
      cols = l.split("\t")
      old = cols[0]
      new = cols[1]
      #puts "Load #{old} => #{new}"
      $replace[old]=new
    }
  }

end

def load_address
  
  filename = '/home/mdupont/experiments/school-districts/lawrence/all_lawrence_addresses.csv'
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
      if ($replace.has_key?(address))
        address = $replace[address]
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
          puts x
        end
      end

    }
  }
end


load_cleanup
#puts $replace;
load_address
