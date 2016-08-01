require 'parse_mercer_county'
require 'school_districts'
require 'streetnames'

class MergeSets
  def main
    @m = MercerCountyLoader.new()       
    @m.main('../school-districts/Lawrence/all_lawrence_addresses.csv')

    @s = SchoolDistrictReader.new()
    @s.main("../school-districts/Lawrence/lawrence_schools.csv")

    @o = OpenStreetMap.new()
    @o.main('../school-districts/Lawrence/lawrence-township_new-jersey.osm')
  end
  def report

    ma = @m.addresses
    sa = @s.addresses
    oa = @o.addresses
    
    for ms in ma
      if not (oa.include?(ms))
        puts "Missing:"+ms#,mk
      end
    end

    for sk in sa
      if not (oa.include?(sk))
        puts "In schools not in osm:"+sk#,mk
      end      
    end
    
  end
end


m = MergeSets.new()
m.main
m.report
