require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'
require './BaseNode'
require './Node'
require './Way'
require './Property'


  
def cacheJson(name, url )
  print "\n" + "name:"+name + "\turl:" + url + "\n"
  dirname = "address"
  local_filename= dirname + "/" + name
  if ! File.directory?(dirname)
    Dir.mkdir(dirname, 0700) #=> 0
  end

  if File.exists?(local_filename)
    print "using :" + local_filename
    File.open(local_filename, "r") {|f|
      html= f.read
      json = JSON.parse(html)
      return json
    }
  else      

    html  = open(url) {|f| f.read }      
    json = JSON.parse(html)
    File.open(local_filename, 'w') {|f| f.write(html) }
    return json
  end
end

def process_prop(inprop)
  
  data= inprop['attributes']
  p = Property.new()
  data.keys.each { |x|
    if data.include?(x)
      val = data[x]
      val = CGI::escape(val.to_s)

      k = x.downcase
      k.sub(".","_")
      p.kv( k, val.to_s)
    else
      abort("missing" + x)
    end  
  }
#  print inprop
  geo= inprop['geometry']['paths'][0]
  geo.each { |x| p.addpoint(x[1],x[0]) }
#  p.closeway

  return p
end

def process_results (ios,json)

  ios.write("<osm version=\"0.6\" >\n")
  
  if json 
    if json.include?('features')
      
      json['features'].each{ |inprop|
        #          warn "found : "
        #          p inprop
        p = process_prop(inprop)
        p.osmxml_way(ios) 
      }
    else
      print json
      warn "nothing for \n"
      return nil
    end
  end
    ios.write("</osm>\n")
  
end

def main (basename,layer_url)

  metadata_url = layer_url + '?f=json&pretty=true'
  layer = cacheJson(
                    "address_layer" + basename , 
                    metadata_url)
  fields =[]
  layer['fields'].each{ |field|    fields.push(field["name"])  }
  fieldstr = CGI::escape(fields.join(','))
  srlatlong=4326
  url = layer_url + "/query" +
    "?outFields=" + fieldstr +
    "&spatialRel=esriSpatialRelIntersects" +
    "&f=json" +
    "&outSR=" + srlatlong.to_s + 
    "&where=" + CGI::escape("OBJECTID > 0 ") + 
    "&returnGeometry=true"    
  query = cacheJson("address_query" + basename ,url)
  f = File.open("test" + basename +".osm", 'w') 
  process_results f,query
 
end


main "MapBaseDataDynamic_layer_Roads", "http://gis.snco.us/ArcGIS/rest/services/BaseDataDynamic/MapServer/12"
main "MapBridgesforWeb_layer_Road ProjectCompleted", "http://gis.snco.us/ArcGIS/rest/services/BridgesforWeb/MapServer/3"
main "MapBridgesforWeb_layer_RoadProjectScheduledforConstruction", "http://gis.snco.us/ArcGIS/rest/services/BridgesforWeb/MapServer/4"
#main "MapLakeShawneeBasemap_layer_Camp_Roads","http://gis.snco.us/ArcGIS/rest/services/LakeShawneeBasemap/MapServer/18"
#main "MapLakeShawneeBasemap_layer_Gage Park Railroad","http://gis.snco.us/ArcGIS/rest/services/LakeShawneeBasemap/MapServer/20"
#main "MapLakeShawneeBasemap_layer_Roads","http://gis.snco.us/ArcGIS/rest/services/LakeShawneeBasemap/MapServer/17"
main "MapPublicWorks_layerCountyMaintainedRoads","http://gis.snco.us/ArcGIS/rest/services/PublicWorks/MapServer/2"
#main "MapPublicWorks_layerBridgesCountyMaintained","http://gis.snco.us/ArcGIS/rest/services/PublicWorks/MapServer/0"
#main "MapPublicWorks_layer_CulvertsCountyMaintained","http://gis.snco.us/ArcGIS/rest/services/PublicWorks/MapServer/1"
main "MapPublicWorks_layer_CountyMaintainedRoads","http://gis.snco.us/ArcGIS/rest/services/PublicWorks/MapServer/2"
main "MapLakeShawneeBasemap_layer_camp_sidewalks", "http://gis.snco.us/ArcGIS/rest/services/LakeShawneeBasemap/MapServer/7"
main "MapLakeShawneeBasemap_layer_sidewalks","http://gis.snco.us/ArcGIS/rest/services/LakeShawneeBasemap/MapServer/24"

  

