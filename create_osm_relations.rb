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
    #print sa
    for sk in sa.keys.sort
      #print sk
      school = sa[sk]
      
      if not (oa.include?(sk))
        puts "In schools not in osm:"+sk#,mk
      else
        puts "FOUND #{sk}\t#{oa[sk]}\t#{school}"
      end      
    end
    
  end
end


m = MergeSets.new()
m.main
m.report
