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

@seen = Hash.new
@datadir = "douglas_taxes/"

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
#  else   
#    return nil
#  end
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

def cache_data(key, newdata)

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
#      print "Tax Payment:\t" +        pin  + "\t" +         addr +"\t" +         city +"\t" +         owner +"\t" +         data[1] + "\t" +         data[2] + "\t" +         data[3] + "\n"
      found =1 
    end
  end

  if found ==0
    print "No Tax Payment found:\t" +
      pin  + "\t" + 
      addr +"\t" + 
      city +"\t" + 
      owner +"\n" 
  end
 
end 



def processLink(agent,street,house, link, values)
  #pp values
  pin = values[0]
  addr = values[1]
  city = values[2]
  owner = values[3]

#  addr2 = addr
#  addr2.replace(/\s+/_/)
  
  if not @seen.has_key?(link)
#    print link + "\n"
    @seen[link]=link
    key = "addr" +  city + pin 
    data=check_cache(key)
    local_filename=@datadir + key
    if (data.nil?) 
      page = agent.get link
      data = page.body
      print "wrote the page: "  + local_filename + "\n"
      File.open(local_filename, 'w') {|f| f.write(data) }
    else
#      print "Loading the page from disk for key "  + local_filename + "\n"
      page = Mechanize::Page.new( uri=nil, response={'content-type'=>'text/html'},  body=data,  code=nil,     mech=agent)
      doc = Nokogiri::HTML(data)  
      parseTaxPayment(doc,page,  pin,   addr ,  city,  owner )
    end
  end
end


def getTaxInfo(agent,page, street,house) 
  form = page.form_with(:action => "/online_services/valuestaxes/source.asp")
  form['hfSearchType'] = 'Address'
  form['hfFormB'] = 'True'
  form['StreetNbr'] =  house 
  form['StreetName'] = street
  key = "lawrence" + street + house.to_s
  #
  searchdata=check_cache(key + "search")
  search_local_filename=@datadir + key + "search"
  if (searchdata.nil?) 
    page = agent.submit form
    searchdata = page.body
#    puts "writing" + searchdata
    print "wrote the page: "  + search_local_filename + "\n"
    File.open(search_local_filename, 'w') {|f| f.write(searchdata) }
  else
#    puts "loaded:" + searchdata
    #load the page from html
#    print "Loading the page from disk for key "  + search_local_filename + "\n"
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
#          print "Row:" + "\n"
#          print "field name:" + cell.text + "\n"
              values.push cell.text
            good=1 
        end
      else
          if (good == 1)
            if (cell.text == "View Details") 
              link= 'http://www.douglas-county.com' + cell.xpath('a/@href').text
              processLink agent,street,house,link,values
            else
              values.push cell.text
            end
            
          end
      end
    end
  end
end


def main () 
  agent = Mechanize.new
  page = agent.get 'http://www.douglas-county.com/online_services/valuestaxes/source.asp'
  #grep addr:house done/Arkansas\ St.osm  | cut -d\" -f4 | sort -u
  for house in %w( 0 100 131 1812 1816 1820 1824 207 211 215 219 223 227 231 235 239 2403 2410 2411 2416 2417 2422 2423 2428 2429 243 2434 2435 2442 2443 2448 2449 2454 2455 2465 2502 2503 2508 2514 2515 2520 2523 2528 2529 2535 2536 2541 2542 2547 2552 2553 2554 2559 2560 2565 2571 2601 2607 2622 2626 2630 2635 2636 2639 2642 2643 2647 2651 401 404 407 409 412 420 422 424 425 437 441 443 445 446 628 630 634 640 700 704 705 708 709 712 715 716 719 720 723 726 727 730 731 733 734 737 738 742 745 746 800 801 804 806 809 815 818 819 820 823 824 827 828 829 832 833 837 838 841 844 846 900 904 907 912 916 918 929 930 932 934 951)      
#    puts "Value of local variable is #{house}"     
    getTaxInfo(agent,page,"Arkansas",house) 
  end
end


main()
