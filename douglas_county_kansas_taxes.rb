#!/usr/bin/ruby
require 'rubygems'
require 'mechanize'
# sudo gem install mechanize
require 'pp'
require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'
require "nokogiri"
require './BaseNode'
require './Way'
require './Property'

class GIS 
  
  def initialize()
    @properties=Array.new
    @datadir = "douglas_taxes/"
    @seen = Hash.new
  end
  
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
      html  = open(url) {|f| f.read }      
      File.open(local_filename, 'w') {|f| f.write(html) }
      return html
    end
  end

#check https://dgco.douglas-county.com/arcgis/rest/services/External/iparcel/MapServer/0?f=pjson
  def getfields ()
    x =  %w{  
OBJECTID
JOINPIN
owner1
plate
PID
Quickrefid
situs
APLINK
}.flatten
#Shape


    return x 

  end

  def process_prop(inprop)   
    data= inprop['attributes']
    p = Property.new()
    data.keys.each { |x|
      val = data[x]
      k = x.downcase
      k.sub(".","_")
      k = "data:" + k         
      p.kv( k, val.to_s)
    }

    @properties.push(p)
  end

  def lookup(street) 
    if @properties.include?(street)
      return @properties[street]
    end
    qry=URI::encode(street)

    fields3 = getfields()
    pp fields3
    fieldstr = CGI::escape(fields3.join(','))


          #https://dgco.douglas-county.com/arcgis/rest/services/External/iparcel/MapServer/0/query
    #https://dgco.douglas-county.com/ArcGIS/rest/services/External/iparcel/MapServer/0/query?spatialRel=esriSpatialRelIntersects&where=situs%20Like%20%27%2510%25%27&returnGeometry=true&f=json&outSR=4326&outFields=OBJECTID%2CJOINPIN%2Cowner1%2Cplate%2CPID%2CQuickrefid%2Csitus%2CAPLINK%2CShape
    #https://dgco.douglas-county.com/ArcGIS/rest/services/External/iparcel/MapServer/0/query?spatialRel=esriSpatialRelIntersects&where=situs%20Like%20%27%2510%25%27&returnGeometry=true&f=json&outSR=4326&outFields=OBJECTID%2CJOINPIN%2Cowner1%2Cplate%2CPID%2CQuickrefid%2Csitus%2CAPLINK%2CShape
    #https://dgco.douglas-county.com/ArcGIS/rest/services/External/iparcel/MapServer/0/query?spatialRel=esriSpatialRelIntersects&where=

    url = "https://dgco.douglas-county.com/ArcGIS/rest/services/External/iparcel/MapServer/0/query" \
    "?spatialRel=esriSpatialRelIntersects"  +
      "&where=situs%20Like%20%27%25" + qry + "%25%27" +
      "&returnGeometry=true"    +
      "&f=json" +
      "&outSR=4326" +
      "&outFields=" + fieldstr 

    print "\nURL:" + url + "\n"
    html = cache street,url
    #print html
    json = JSON.parse(html)
    if json 
      #print json 
      if json.include?('features')
        json['features'].each{ |inprop|
          #          warn "found : "
          #          p inprop
          process_prop(inprop)
        }
      else
        #        p json
        warn "nothing for " + street + "\n"
        return nil
      end
      
    end
    return p
  end

  def process (roads )
    found = 0
    roads.flatten.each { 
      |street|
      p= lookup( street)
    }
  end


  def fetchHtml(agent, link,local_filename)
    page = agent.get link
    puts link
    data = page.body
    File.open(local_filename, 'w') {|f| f.write(data) }
    doc = Nokogiri::HTML(data)  
  end

  def getTaxFromPinPlate(agent, pin, plate)
    pin.gsub!('-','')
    pin.gsub!('.','')
    plate.gsub!(' ','')
    year=2013
    url = "http://douglas-county.com/online_services/valuestaxes/results.asp?Pin=#{pin}&Plate=#{plate}&DisplayYear=#{year}"
    filename = @datadir + "#{pin}_#{plate}_#{year}"
    print "filename",filename,"\n"
    #print  @datadir + '#{@pin}_#{@plate}_#{@year}'
    fetchHtml agent, url, filename
  end

  def simple (x)
    @properties.clear
    process([x])
    if (@properties.count > 1)
      agent = Mechanize.new
      page = agent.get 'http://www.douglas-county.com/online_services/valuestaxes/source.asp'
      @properties.each { |d| 
        #pp x 
        situs = d.attributes["data:situs"]
        pid = d.attributes["data:pid"]
        pin = d.attributes["data:joinpin"]
        plate = d.attributes["data:plate"]
        print pid
        #        p situs 
        house = situs.match('^(\d+)')
        #        pp house
        hn = house[0]
        print "getTaxInfo Street:" + x + "House NUmber"+ hn.to_s, " pid: ", pid, " pin: ", pin, " plate: ", plate ,"\n"
        #getTaxInfo(agent,page,x,hn) 
        getTaxFromPinPlate(agent, pin, plate)
      }

    end
  end

  def check_cache(key)
    local_filename=@datadir + key
    if ! File.directory?(@datadir)
      Dir.mkdir(@datadir, 0700) #=> 0
    end
    if File.exists?(local_filename)
      File.open(local_filename, "r") {|f|
        html= f.read
        return html
      }
    end 
  end

  def get_cache(key, url )
    data=check_cache(key)
    if (data.nil?) 
      html  = open(url) {|f| f.read }      
      local_filename=@datadir + key
      File.open(local_filename, 'w') {|f| f.write(html) }
      return html
    end
  end

  def parseValueInfo(page)
    print "Value\n"
    rows = doc.xpath('//table[@id="Value_Information"]//td')
    rows.each do |row|
      print "row"
      pp row
    end
  end

  def parseTaxInfo(page) 
    print "Tax Info\n" 
    rows = doc.xpath('//table[@id="Tax_Information"]//td')
    rows.each do |row|
      print "row"
      pp row
    end
  end

  def parsePropertyDescription(page)
    rows = doc.xpath('//table[@id="Property_Description"]//td//text()')
    rows.each do |row|
      print "row"
      pp row
    end
  end

  def parseTaxPayment(doc,page, pin,   addr ,  city,  owner) 
    found = 0
    rows = doc.xpath('//table[@id="Tax_Payment_Information"]//tr')
    rows.each do |row|
      data= []
      cells = row.xpath('td')
      cells.each do |cell|
        att= cell.attributes 
        if (att.has_key?('scope')) 
          scope =cell.attr('scope') 
          if (scope == "row")
            data.push( cell.text)
          else
          end
        else
          data.push( cell.text)
        end
      end
      if (data.length() > 1)
#        print "Tax Payment:\t" +        pin  + "\t" +         addr +"\t" +         city +"\t" +         owner +"\t" +         data[1] + "\t" +         data[2] + "\t" +         data[3] + "\n"
        found =1 
      end
    end
    if found ==0
      print "No Tax Payment found:\t" +        pin  + "\t" +         addr +"\t" +         city +"\t" +         owner +"\n" 
    end    
  end 

  def processLink(agent,street,house, link, values)
    #pp values
    pin = values[0]
    addr = values[1]
    city = values[2]
    owner = values[3]
#    print "Check" + link + "\n"
    if not @seen.has_key?(link)
      #    print link + "\n"
      @seen[link]=link
      key = "addr" +  city + pin 
      data=check_cache(key)
      local_filename=@datadir + key

      if (data.nil?) 
        page = agent.get link
        data = page.body

        File.open(local_filename, 'w') {|f| f.write(data) }
        doc = Nokogiri::HTML(data)  
        parseTaxPayment(doc,page,  pin,   addr ,  city,  owner )
      else
        #      print "Loading the page from disk for key "  + local_filename + "\n"
        page = Mechanize::Page.new( uri=nil, response={'content-type'=>'text/html'},  body=data,  code=nil,     mech=agent)
        doc = Nokogiri::HTML(data)  
        parseTaxPayment(doc,page,  pin,   addr ,  city,  owner )
      end
    end
  end

  def printForm(page)
    page2.forms.each {
      |frm| 
      print "each FORM NAME:", frm.name, "\n"
      frm.fields.each { |f| 
        print "Field: ", f.name , "\n"
      }
    }    
  end

  def getTaxInfo(agent,page, street,house) 
    form = page.form_with(:name => "formA",
                          :action => "/online_services/valuestaxes/source.asp")
                          #http://www.douglas-county.com/online_services/valuestaxes/source.asp
    #form.fields.each { |f| puts f.name }
    #form['rbPropertyType'] = 'Personal'
    form['hfShowPropertyTypeForm'] = 'True'
    form['selectSearchType']='RealAddress'
    print "selected FORM NAME:", form.name, "\n"
    form.fields.each { |f| 
      print "Field:",f.name,"\n"
    }
  
    page2 = agent.submit form
    form2 = page2.form_with(
                          :name => "formRealAddressSearch",
                          :action => "/online_services/valuestaxes/source.asp"
                          )
    form2['hfSearchTypeValue'] = 'RealAddress'
    form2['hfShowSearchDetailsForm'] = 'True'
    form2['txtRealStreetNbr'] =  house 
    form2['txtRealStreetNameStreetName'] = street
    key = "lawrence" + street + house.to_s
    #
    searchdata=nil # check_cache(key + "search")
    search_local_filename=@datadir + key + "search"
    if (searchdata.nil?) 
      page3 = agent.submit form2
      searchdata = page3.body
      puts "writing" + searchdata
      print "wrote the page: "  + search_local_filename + "\n"
      File.open(search_local_filename, 'w') {|f| f.write(searchdata) }
    else
      page = Mechanize::Page.new(
                                 uri=nil,
                                 response={'content-type'=>'text/html'},
                                 body=searchdata,
                                 code=nil,
                                 mech=agent)
    end

    doc = Nokogiri::HTML(searchdata)  
    rows = doc.xpath('//table[@id="Property_Search"]//tr')
    rows.each do |row|
      names = row.xpath('td')
      good = 0
      values = []
      names.each do |cell|
        att= cell.attributes 
        if (att.has_key?('scope')) 
          scope =cell.attr('scope') 

          if cell.text.match(/\d{3}\-\d{3}\-\d{2}\-\d\-\d\d\-\d\d\-\d\d\d\.\d\d-\d/)

            values.push cell.text
            good=1 
          end
        else
          if (good == 1)
            if (cell.text == "View Details") 
              link= 'http://www.douglas-county.com' + cell.xpath('a/@href').text

              #//DisplayYear=2012
              link = link.sub('DisplayYear=2012','DisplayYear=2011')
              processLink agent,street,house,link,values
            else
              values.push cell.text
            end
            
          end
        end
      end
    end
  end
  
end


print "Main"

def main () 
  g=GIS.new()

  ARGV.each { |x|
#    print x;
    g.simple(x)
  }
end


main()
