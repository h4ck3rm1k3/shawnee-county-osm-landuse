#!/usr/bin/ruby
require 'street_address'
require 'facets/string/titlecase'

$LOAD_PATH.unshift(ENV["HOME"] + "/experiments/osmlib-base/lib" ) 

def check_even_odd(hn, even)
  r = (hn % 2)
  if r == 0
    if even == "even"
      return true
    elsif even == "odd"
      return false
    else
    end
  else # the number is odd
    # odd
    if even == "odd"  # we are looking for odd
    # ok
    elsif even == "even"
      return false
    else
      return true
    end
  end
end

def check_from_to

  if from == ""
    if to == ""
      if (check_even_odd(hn, even)) 
        i.setkv('school',school) # done
      end
    else
      if hn <= to
      # skip
      else
        if (check_even_odd(hn, even)) 
          i.setkv('school',school) # done
        end
      end                                              
    end
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
            #next
          end
        else
          print "skip too early :", hn, " cut off from", from,  "\n"
          ##next
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
            #next
          end
        else
          # badly formatted input
          #print "from < to", from,":", to, "in line",l,  "\n"
        end
      end
      
      ## now check even and odd
      if (check_even_odd(hn, even)) 
        i.setkv('school',school) # done
      end

    end # not to == ""
  end ## from


end



def main
  ARGV.each { |x|
    File.open(x, "r") {
      |f|
      #print "read", f, "\n"
      data = f.read
      lines = data.split("\n")
      lines.each { |l|
        l =l.chomp
        cols = l.split(",")
        school = cols[0]
        street = cols[1]
        from = cols[2]
        to = cols[3]
        even = cols[4]
        p = nil

        if street == 'road' # first row is the header
          next        
        end
        #

      } # each line
      
      #print "X",x, "\n"
      
    } # file open 
    
      

  } # ARGV
   
end

main;
