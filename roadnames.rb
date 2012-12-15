
#require 'OSM/Database'
require 'rubygems'

gem 'osmlib-base'
require 'OSM/API'
require 'OSM/StreamParser'


class MyCallbacks < OSM::Callbacks

  def initialize()
    @seen=Hash.new
  end

    def node(node)
    end

    def way(way)
      n =way.tags['name']
      if (! n.nil? )
        if ! @seen.include?(n)
          p n
          @seen[n]=1
        end
      end

    end

    def relation(relation)
    end

  end

cb = MyCallbacks.new
#parser = OSM::StreamParser.new(:filename => 'topekatest.osm', :callbacks => cb)
parser = OSM::StreamParser.new(:filename => 'topekaroads.osm', :callbacks => cb)
parser.parse
