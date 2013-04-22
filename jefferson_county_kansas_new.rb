require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'

@datadir = "jefferson/"

def cache(street, url )
  local_filename=@datadir + street
  if ! File.directory?(@datadir)
    Dir.mkdir(@datadir, 0700) #=> 0
  end
  if File.exists?(local_filename)
    File.open(local_filename, "r") {|f|
      html= f.read
      return html
    }
  else   
    print url + "\n";
    html  = open(url,
                 "Referer" => "http://ags2.lojic.org/lojiconline/"
                 ) {|f| f.read }      
    File.open(local_filename, 'w') {|f| f.write(html) }
    return html
  end
end


#    http://www.jefferson.kansasgis.com/Map/QuickMap.aspx
#    POST
#Accept:text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8Accept-Encoding:gzip, deflateAccept-Language:en-us,en;q=0.5Connection:keep-aliveHost:www.jefferson.kansasgis.comReferer:http://www.jefferson.kansasgis.com/Map/QuickMap.aspxUser-Agent:Mozilla/5.0 (X11; Linux x86_64; rv:10.0.12) Gecko/20100101 Firefox/10.0.12 Iceweasel/10.0.12
# AgricultureInformation_AccordionExtender_ClientState:-1
# AppraisedInformation_AccordionExtender_ClientState:-1
# DeedInformation_AccordionExtender_ClientState:-1
# DwellingInformation_AccordionExtender_ClientState:-1
# GeneralInformation_AccordionExtender_ClientState:-1
# MarketLandInformation_AccordionExtender_ClientState:-1
# OtherImprovementComponentsInformation_AccordionExtender_ClientState:-1
# OtherImprovementsInformation_AccordionExtender_ClientState:-1
# OwnerInformation_AccordionExtender_ClientState:
# SalesInformation_AccordionExtender_ClientState:-1
# TaxDetailInformation_AccordionExtender_ClientState:-1
# #__EVENTARGUMENT:
# #__EVENTTARGET:
# #__EVENTVALIDATION:***
# __VIEWSTATE:***
# btnSubmit:
# Searchpropertyclassddl:
# rangeddl:
# secddl:
# townshipddl:
# txtOwner:
# txtPropAdd:topeka
# txtPropAddNum:
# txtPropZip:
# txtparcelid:
# txtquickref:

def GetPid (pid)
  url = 'http://gis.publicaccessnow.com/arcgis/rest/services/JeffersonKs/JeffersonKsDynamic/MapServer/0/query?f=json&where=PID%20IN%20(%27' + pid + '%27)&returnGeometry=true&spatialRel=esriSpatialRelIntersects&outFields=PID&outSR=3857&callback=dojo.io.script.jsonp_dojoIoScript5._jsonpCallback'
  
  html = cache pid,url
#  print html

#dojo.io.script.jsonp_dojoIoScript5._jsonpCallback({"displayFieldName":"PID","fieldAliases":{"PID":"PID"},"geometryType":"esriGeometryPolygon","spatialReference":{"wkid":102100,"latestWkid":3857},"fields":[{"name":"PID","type":"esriFieldTypeString","alias":"PID","length":16}],"features":[{"attributes":{"PID":"1930500000015000"},"geometry":{"rings":[[[-10610952.3222,4751302.4099000022],[-10610995.8979,4751255.5700000003],[-10610995.898,4751255.5776999965],[-10610999.606899999,4751607.6837000027],[-10610998.3225,4751607.6881000027],[-10610487.2721,4751608.4025999978],[-10610485.105599999,4751232.8156000003],[-10610485.054400001,4751223.9285999984],[-10610515.100400001,4751168.2723999992],[-10610539.6675,4751154.1988999993],[-10610620.7092,4751160.9237999991],[-10610657.3146,4751176.7969999984],[-10610667.0348,4751188.4311999977],[-10610693.783199999,4751196.3672999963],[-10610712.624199999,4751195.6005000025],[-10610829.467599999,4751218.4095999971],[-10610833.072899999,4751251.3435999975],[-10610831.899900001,4751253.6237000003],[-10610764.029300001,4751385.5459999964],[-10610725.4365,4751460.5590000004],[-10610809.846899999,4751451.8379999995],[-10610813.3353,4751447.9174999967],[-10610855.781400001,4751400.2150000036],[-10610875.218699999,4751359.9239000008],[-10610895.3179,4751338.8357999995],[-10610952.3222,4751302.4099000022]]]}}]});

    data= /jsonpCallback\(([^\)]+)\);$/.match(html)
#  print data
    html=data[1]
#  print data
  json = JSON.parse(html)
  
  if json 
    p json
  end
end

ARGV.each { 
  |x|
  GetPid(x)
}
