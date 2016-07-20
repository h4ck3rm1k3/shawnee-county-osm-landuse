print "school,street,number\n"           
require 'house_map'

hm = HouseMap.new()
puts hm
hm.print
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
      if from.nil?  or from == ''
        #print "skip", l, "\n"
      #print school, ",", street, ",*\n"
        hm.process("9999999 #{street}",school)
      else
        #puts "check #{l} from:'#{from}' "
        if to.nil? or to == ''
          puts "skip3 #{l}"
        else          
          nfrom = from.to_i
          nto = to.to_i

          if nfrom <= nto 
            #print "Check1",even,from,to, "\n"
            #print "Check",from..to, "\n"
            if even.nil? or even == "" 
              #print school, ",", street, ",ALL\n"
              for n in (nfrom .. nto) do
                #print school, ",", street, ",", n , "\n"
                hm.process("#{n} #{street}",school)
              end
              
            elsif  even == 'even'
              for n in (nfrom .. nto) do
                r = (n % 2)
                if r == 0
                  hm.process("#{n} #{street}",school)
                end
              end
            elsif  even == 'odd'
              for n in (nfrom .. nto) do
                r = (n % 2)
                if r == 1
                  hm.process("#{n} #{street}",school)
                end
              end
            else
              #puts "skip1 #{l}"
            end
          else
            puts "skip2 #{l} from:'#{from}' to:'#{to}' nfrom:#{nfrom} nto:#{nto}"
          end
        end
      end
    }
  }  
}

hm.print
