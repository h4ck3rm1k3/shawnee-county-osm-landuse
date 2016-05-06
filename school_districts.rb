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
      if from == "" 
        #print "skip", l, "\n"
        print school, "\t", street, "\t*\n"           
      else
        if to == "" 
          print "skip", l, "\n"
        else
          from = from.to_i
          to = to.to_i

          if from < to 
            #print "Check1",even,from,to, "\n"
            #print "Check",from..to, "\n"
            if even == "" 
              #print school, "\t", street, "\tALL\n"
              for n in (from .. to) do
                  print school, "\t", street, "\t", n , "\n"           
              end
              
            elsif  even == 'even'
              #print "Even\n"
              for n in (from .. to) do
                r = (n % 2)
                #print n % 2 , "\n"
                if r == 0
                  print school, "\t", street, "\t", n , "\n"           
                else
                  #print "Odd",r, school, "\t", street, "\t", n , "\n"           
                end
              end
            end
          else
            print "skip", l, "\n"           
          end
        end
      end
    }
  }  
}

