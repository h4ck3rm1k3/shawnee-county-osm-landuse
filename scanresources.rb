require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'


def cacheJson(name, url )
  print url + "\n"
  local_filename="scan/" + name
  if ! File.directory?("scan")
    Dir.mkdir("scan", 0700) #=> 0
  end

  if File.exists?(local_filename)
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


def getMapServerLayer(base,name,layerno,layername)

  #http://gis.snco.us/ArcGIS/rest/services/Cadastral/MapServer/1
  
  layer = cacheJson(
                    "Map" + name + "_layer_" + layername , 
                    base + '/'  + name + '/MapServer/' + layerno.to_s + '?f=json&pretty=true')
  print layer
end

def getMapServer(base,name)
  mapserver = cacheJson("Map" + name, base + '/'  + name + '/MapServer?f=json&pretty=true')
  #print services

  mapserver['layers'].each{ |layer|
    id = layer["id"]
    lname = layer["name"]    
    getMapServerLayer(base,name,id,lname)
  }
  
end

def getServices (base)

 
  services = cacheJson("allServices",base + '?f=json&pretty=true')
  services['services'].each{ |service|
    
    name = service['name']
    type = service['type']
    print "name:",name, "\ttype:",type , "\n"
    
    if (type == 'MapServer')
      getMapServer(base,name)
    end
  }
end 


getServices 'http://gis.snco.us/ArcGIS/rest/services'
