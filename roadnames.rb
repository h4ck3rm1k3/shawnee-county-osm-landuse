
#require 'OSM/Database'
require 'rubygems'

gem 'osmlib-base'
require 'OSM/API'
require 'OSM/StreamParser'


class MyCallbacks < OSM::Callbacks

  def initialize()
    @seen=Hash.new

    @@abbr= Hash.new
    
    @@bearing= Hash.new

    @@bearing['NW'] = 	'Northwest'
    @@bearing['NE'] = 	'Northeast'
    @@bearing['SE'] = 	'Southeast'
    @@bearing['SW'] = 	'Southwest'
    @@bearing['N'] = 	'North'
    @@bearing['E'] = 	'East'
    @@bearing['S'] = 	'South'
    @@bearing['W'] = 	'West'

    @@abbr['AL'] = 	'Alley'
    @@abbr['PARK'] = 	'Park'
    @@abbr['AVE'] = 	'Avenue'
    @@abbr['DR'] = 	'Drive'
    @@abbr['PL'] = 	'Place'
    @@abbr['LN'] = 	'Lane'
    @@abbr['TER'] = 	'Terrace'
    @@abbr['HWY'] = 	'Highway'
    @@abbr['road'] = 'Road'
    @@abbr['RD'] = 'Road'
    @@abbr['BLVD'] = 'Boulevard'
    @@abbr['CT'] = 	'Court'
    @@abbr['CIR'] = 	'Circle'
    @@abbr['ST'] = 	'Street'
    @@abbr['STR'] = 	'Street'
    @@abbr['SQ'] = 	'Square'

  end

    def node(node)
    end

    def way(way)
      h =way.tags['highway']
      n =way.tags['name']
      if (! n.nil? )
        if (! h.nil? )
          if ! @seen.include?(n)
#            p n
            @seen[n]=1
          end
        end
      end
    end

    def report

      @seen.each {|s, v| 
        @@abbr.each {|a, b| 
          s= s.gsub(b,a)
        }

        @@bearing.each {|a, b| 
          s= s.gsub(b,a)
        }
        print "g.simple(\'" + s + "\')\n"
      }
    end
    
  end

cb = MyCallbacks.new
#parser = OSM::StreamParser.new(:filename => 'topekatest.osm', :callbacks => cb)
parser = OSM::StreamParser.new(:filename => 'osm/topeka.osm', :callbacks => cb)
#parser = OSM::StreamParser.new(:filename => 'test.osm', :callbacks => cb)
parser.parse
cb.report
