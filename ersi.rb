require 'mechanize'
require 'json'
require 'pp'
require 'filecache'
require 'open-uri'
require 'mongo'

include Mongo

mongo_client = MongoClient.new("localhost")
db = mongo_client.db("ersi")
$coll = db.collection("ersi")

def clean(result_hash)
  if result_hash.is_a? String    
    #print result_hash, "\n"
    
    return result_hash
  elsif result_hash.is_a? Array 
    ret = []
    result_hash.each do |item|
      ret.push(clean(item))
    end
    #print ret
    return ret
  elsif result_hash.is_a? Hash
    nh = Hash.new()
    result_hash.keys.each do |itemk|
      ns= itemk.gsub(".","_")
      item = result_hash[itemk]
      #print itemk,ns,"\n"
      nh[ns]=clean (item)                
    end
    #print nh
    return nh    
  else
    return result_hash
  end
end

def cache_query(agent, cache, jsonurl)
  print "\nGoing to get: ",jsonurl,"\n"
  old = nil
  old =  cache.get(jsonurl)
  if (old.nil?) 
    return
    page = agent.get jsonurl
    print "BEGINJSON\n", page.body, "\nENDJSON", "\n"
    result_hash = JSON.parse(page.body)
    print "fetched url: ",jsonurl,"\n"
    cache.set(jsonurl, result_hash)
  else
    result_hash = old
    #pp "Before",result_hash
    result_hash = clean(result_hash)
    #pp "Cleaned",result_hash
    #body = JSON.dump(result_hash)
    $coll.insert(
                 {
                  'url' => jsonurl,
                  'data' => result_hash
                }
                )
    #print "BEGINJSON\n", body, "\nENDJSON", "\n"
  end  
  return result_hash
end


def query_all_data(agent, cache, url, names)
  where = "where=" + URI::encode("OBJECTID is not NULL")
  fields = URI::encode(names.join(","))
  query_count = url + '/query?' + where + "&returnCountOnly=false&f=json&text=&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields="+ fields + "&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false"
  json= cache_query(agent,cache, query_count)
  pp "Query",query_count
  #"JSON",json
end 

def query_count(agent,cache, url)
  where = "where=" + URI::encode("OBJECTID is not NULL")
  query_count = url + '/query?' + where + "&returnCountOnly=true&f=json&text=&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&outFields=&returnGeometry=true&maxAllowableOffset=&geometryPrecision=&outSR=&returnIdsOnly=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&returnZ=false&returnM=false&gdbVersion=&returnDistinctValues=false"
  json= cache_query(agent,cache, query_count)
  #pp "Query",query_count,"JSON",
  count = json["count"]
  pp  "Query Count",query_count, count

end

def layer(agent, cache, url, layer_url)
  jsonurl = layer_url + '/?f=pjson'
  result_hash = cache_query(agent,cache, jsonurl)

  print "fetched old layer",layer_url, ' name: ', result_hash['name'], ' type: ' , result_hash['type'], ' id :',result_hash['id'], "\n"

  #pp result_hash['fields']
  names = []
  if (result_hash['fields']) 
    result_hash['fields'].each { |x| 
      names.push(x['name'])
    }
  end
  if names.length() > 0
    #print "fields",names,"\n"
    query_count(agent, cache, layer_url)
    query_all_data(agent, cache, layer_url, names)
  end

end 

def services(agent,cache,  url)
  jsonurl = url + '/?f=pjson'

  result_hash = cache_query(agent,cache, jsonurl)
  print "process services ", url, "\n"
  if (not result_hash['capabilities'].nil?)
    print "capabilities",result_hash['capabilities'], "\n"
    if result_hash['capabilities'].include?("Query")
      #print result_hash.keys(), "\n"
      if result_hash['layers']
        result_hash['layers'].each { |x| 
          id = x['id']
          layer_url = "#{url}/#{id}"
          print "Layer URL: ",layer_url,"\n"
          layer(agent,cache, url,layer_url)
        }    
      end
    end
  end
end


def folders(agent,cache,  base, url)
  jsonurl = url + '/?f=pjson'

  result_hash = cache_query(agent,cache, jsonurl)

  if (result_hash.nil?)
    print "NULL"
    return
  end
  print "Folder", result_hash.keys(), "\n"

  result_hash['folders'].each { |x| 
    folder_url = url + '/' + x
    folders(agent,cache,  url, folder_url)
  }
  result_hash['services'].each { |x| 
    name = x['name']
    type = x['type']
    service_url = "#{base}/#{name}/#{type}"
    print "Service URL",service_url, "\n"
    services(agent, cache, service_url)
  }
end

def main()
  agent = Mechanize.new
  cache = FileCache.new("ersi",".")
  baseurl=ARGV[0]
  print "starting: "+baseurl
  folders(agent,cache, baseurl, baseurl)
end


main()
