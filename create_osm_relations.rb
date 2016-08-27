require 'parse_mercer_county'
require 'school_districts'
require 'streetnames'

class MergeSets
  def main
    @s = SchoolDistrictReader.new()
    @s.main("../school-districts/Lawrence/lawrence_schools.csv")

    @o = OpenStreetMap.new()
    @o.main('../school-districts/Lawrence/lawrence-township_new-jersey.osm')
  end
  def report

    sa = @s.addresses
    oa = @o.addresses
    oh = @o.houses
    #print sa

    for sk in sa.keys.sort
      #print sk
      school = sa[sk]
      
      if not (oa.include?(sk))
        puts "In schools not in osm:"+sk#,mk
      else
        #puts "FOUND #{sk}\t#{oa[sk]}\t#{school}"
      end

      if (oh.include?(sk))
        #puts "DEBUG OSM HOUSE #{oh[sk]}"
        for hn in school.keys.sort
          sn = school[hn]
          hn = hn.to_s
          #puts "DEBUG1 #{hn} #{sn}"
          if (oh[sk].include?(hn))
            puts "FOUNDHOUSE #{sk}\t#{hn}\t#{oh[sk][hn]}\t#{sn}"
          else
            
            #puts "NO FOUNDHOUSE #{sk}\t#{oh[sk][hn]}\t#{sn}"
          end
          
        end

        #puts "DEBUG #{school}"
      end
    end
  end
end


m = MergeSets.new()
m.main
m.report
