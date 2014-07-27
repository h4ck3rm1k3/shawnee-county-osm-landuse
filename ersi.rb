require 'mechanize'
require 'json'
require 'pp'
require 'filecache'

def layer(agent, cache, url, layer_url)
  jsonurl = layer_url + '/?f=pjson'
  old =  cache.get(layer_url)
  if (old.nil?) 
    page = agent.get jsonurl
    result_hash = JSON.parse(page.body)
    puts "fetched layer",layer_url
    #pp result_hash
    cache.set(layer_url, result_hash)
  else
    #puts "got old",url
    puts "fetched old layer",layer_url
    result_hash = old
  end  
end 

def services(agent,cache,  url)
  jsonurl = url + '/?f=pjson'

  old =  cache.get(url)
  if (old.nil?) 
    page = agent.get jsonurl
    result_hash = JSON.parse(page.body)
  else
    #puts "got old2",url
    result_hash = old
  end  

  puts "process services ", url
  #pp result_hash
  if result_hash['layers']
    result_hash['layers'].each { |x| 
      id = x['id']
      layer_url = "#{url}/#{id}"
      puts layer_url
      layer(agent,cache, url,layer_url)
      
    }    
  end
end


def folders(agent,cache,  base, url)
  jsonurl = url + '/?f=pjson'
  old =  cache.get(url)
  if (old.nil?) 
    page = agent.get jsonurl
    result_hash = JSON.parse(page.body)
  else
    #puts "got old3",url
    result_hash = old
  end
  result_hash['folders'].each { |x| 
    folder_url = url + '/' + x
    folders(agent,cache,  url, folder_url)
  }
  result_hash['services'].each { |x| 
    name = x['name']
    type = x['type']
    service_url = "#{base}/#{name}/#{type}"
    puts service_url
    services(agent, cache, service_url)
  }
end

def main()
  agent = Mechanize.new
  cache = FileCache.new("ersi",".")
  baseurl="https://dgco.douglas-county.com/arcgis/rest/services"
  folders(agent,cache, baseurl, baseurl)
end


main()
