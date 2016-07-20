# coding: utf-8
require 'ruby_postal/expand'

$replace = Hash.new()

def load_cleanup

  filename = '/home/mdupont/experiments/school-districts/lawrence/cleanup.txt'
  File.open(filename, "r") {|f|
    data = f.read
    lines = data.split("\n")
    lines.each { |l|
      l =l.chomp
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
      l =l.chomp
      cols = l.split(",")
      address = cols[0]
      if address == 'address' # first row is the header
        next        
      end
      if ($replace.has_key?(address))
        address = $replace[address]
        #puts "#{address} => #{address2}"
      end
      

      e = Postal::Expand.expand_address(address)
      if e.length > 1
        e.each{ |i|
          if i.include? " doctor"
          elsif i.include? " saint"
          elsif i.include? " sankt"
          elsif i.include? " plain"
          elsif i.include? " avenida"
          elsif i.include? " sint"
          elsif i.include? " junction "
          elsif i.include? " 509 " # dix
          elsif i.include? " 50 " # mill
          elsif i.include? " right of way "            
          elsif i.include? " st "
          elsif i.include? " dokter"
          elsif i.include? " doctor"
          elsif i.include? " connecticut "
          elsif i.include? " ct "
          elsif i.include? " s "
          elsif i.include? " san "
          elsif i.include? " louisiana "
          elsif i.include? " la "
          else
            puts "#{address}\t#{i}"
          end
        }
      end
        

    }
  }
end


load_cleanup
#puts $replace;
load_address
