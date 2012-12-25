require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'

class LandUse
  def church (obj)
    p obj
    abort "todo"
  end
end

class BaseNode 
  def self.initfields ()
    @@abbr= Hash.new
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
    @@codesl= Hash.new
    @@proto= LandUse.new
    @@fcodesl= Hash.new

    @@fcodesl['1101']= lambda {|o|       
      o.attributes['building'] = 'residential'
    }

    @@fcodesl['5232']= lambda {|o|       
      o.attributes['tourism'] = 'zoo'
    }

    @@fcodesl['6420']= lambda {|o|       
      o.attributes['amenity'] = 'police'
    }

    @@fcodesl['2171']= lambda {|o|       
      o.attributes['amenity'] = 'car_wash'
    }

    @@fcodesl['1172']= lambda {|o|       
      o.attributes['building'] = 'residential'
    }

    @@fcodesl['6831']= lambda {|o|       
      o.attributes['building'] = 'civic'
    }

    @@fcodesl['4242']= lambda {|o|       
      o.attributes['amenity'] = 'library'
    }


    @@fcodesl['8190']= lambda {|o|       
      o.attributes['resource'] = 'mineral'
    }

    @@fcodesl['1250']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
      o.attributes['residential'] = 'assisted'
    }

    @@fcodesl['1220']= lambda {|o|       
      o.attributes['building'] = 'residential'
      o.attributes['residential'] = 'congregate'
    }

    @@fcodesl['4139']= lambda {|o|       
      o.attributes['highway'] = 'private'
    }

    @@fcodesl['1120']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
    }

    @@fcodesl['1160']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'trailer_park'
    }

#
    @@fcodesl['5430']= lambda {|o|       
      o.attributes['tourism'] = 'campsite'    
    }

    @@fcodesl['5420']= lambda {|o|       
      o.attributes['tourism'] = 'campsite'    
    }

    @@fcodesl['5371']= lambda {|o|       
      o.attributes['building'] = 'gymnasium'    
    }
    

    @@fcodesl['5373']= lambda {|o|       
      o.attributes['building'] = 'tennis_club'    
      o.attributes['sport'] = 'tennis'    
    }
    

    @@fcodesl['6310']= lambda {|o|       
      o.attributes['building'] = 'military'    
      o.attributes['military'] = 'yes'    
    }
    

    @@fcodesl['5390']= lambda {|o|       
      o.attributes['sport'] = 'skating'    
    }

    @@fcodesl['5390']= lambda {|o|       
      o.attributes['sport'] = 'skating'    
    }

    @@fcodesl['5390']= lambda {|o|       
      o.attributes['sport'] = 'skating'    
    }
    #landuse=raceway
    @@fcodesl['5130']= lambda {|o|       
      o.attributes['landuse'] = 'raceway'    
    }

    @@fcodesl['4133']= lambda {|o|       
      o.attributes['public_transport'] = 'stop_position'    
      #public_transport	{stop_position=1}
    }

    @@fcodesl['9900']= lambda {|o|       
      o.attributes['disused'] = 'yes'    
    }

    @@fcodesl['6300']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'construction'    
      o.attributes['governmental'] = 'yes'    
    }

    @@fcodesl['3222']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'paperboard'    
    }


    @@fcodesl['3114']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'bakery'    
    }

    @@fcodesl['3312']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'asphalt'    
    }

    @@fcodesl['5341']= lambda {|o|       
      o.attributes['building'] = 'gymnasium'    
    }

    @@fcodesl['9230']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'crop_harvesting'    
    }


    @@fcodesl['3332']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'glass'    
    }

#    @@fcodes['9230']='Crop harvesting & post harvest crop activities (including drying, storage, etc.)'

    
    @@fcodesl['4213']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['industrial'] = 'printer'    
    }

    @@fcodesl['4137']= lambda {|o|       
      o.attributes['amenity'] = 'taxi'    
    }

    @@fcodesl['4345']= lambda {|o|       
      o.attributes['landuse'] = 'landfill'    
    }

    @@fcodesl['5410']= lambda {|o|       
      o.attributes['tourism'] = 'trailer_site'    
    }

    @@fcodesl['5376']= lambda {|o|       
      o.attributes['sport'] = 'golf'    
      o.attributes['golf'] = 'driving_range'    
    }

    @@fcodesl['5375']= lambda {|o|       
      o.attributes['sport'] = 'golf'    
      o.attributes['golf'] = 'course'    
    }
    
    @@fcodesl['2721']= lambda {|o|       
      o.attributes['amenity'] = 'animal_shelter'    
    }

    @@fcodesl['9520']= lambda {|o|       
      o.attributes['landuse'] = 'hunting'    
      o.attributes['leisure'] = 'park'    
    }

    @@fcodesl['5377']= lambda {|o|       
      o.attributes['leisure'] = 'playground'    
    }

    @@fcodesl['1165']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'trailer_park'
    }

    @@fcodesl['6410']= lambda {|o|       
      o.attributes['amenity'] = 'fire_station'    
    }

    @@fcodesl['4236']= lambda {|o|       
      o.attributes['studio'] = 'radio_station'    
      o.attributes['amenity'] = 'studio'    
      o.attributes['building'] = 'commercial'

    }

    @@fcodesl['6530']= lambda {|o|       
      o.attributes['amenity'] = 'hospital'    
    }

    @@fcodesl['1180']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'appartment'
    }

    @@fcodesl['2800']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'appartment'
      o.attributes['office'] = 'yes'
    }

    @@fcodesl['2404']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['office'] = 'condo'
    }

    @@fcodesl['1150']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'appartment'
    }

    @@fcodesl['1176']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'appartment'
    }

    @@fcodesl['1170']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'appartment'
    }

    @@fcodesl['3333']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'concrete'
    }

    @@fcodesl['3115']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'beverage'
    }


    @@fcodesl['4120']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['railway'] = 'unknown'
    }


    @@fcodesl['9940']= lambda {|o|       
      o.attributes['landuse'] = 'unused'
    }

    @@fcodesl['3210']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'wood'
    }

    @@fcodesl['3334']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'concrete'
    }

    @@fcodesl['8510']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'
      o.attributes['industrial'] = 'sand_pit'
    }

    @@fcodesl['3230']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'furniture'
    }

    @@fcodesl['3350']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'Machines'
    }

    @@fcodesl['3321']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'rubber'
    }

    @@fcodesl['3335']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'stone'
    }

    @@fcodesl['8500']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'
      o.attributes['industrial'] = 'quarry'
    }

    @@fcodesl['4110']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['aeroway'] = 'unknown'
    }

    @@fcodesl['9910']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
    }

    @@fcodesl['1104']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
    }

    @@fcodesl['5381']= lambda {|o|       
      o.attributes['sport'] = 'bowls'
    }

    @@fcodesl['5378']= lambda {|o|       
      o.attributes['sport'] = 'swimming'
    }


    @@fcodesl['5374']= lambda {|o|       
      o.attributes['sport'] = 'golf'
    }

    @@fcodesl['5372']= lambda {|o|       
      o.attributes['sport'] = 'racquet'
    }

    @@fcodesl['1155']= lambda {|o|       
      o.attributes['leisure'] = 'common'
    }


    @@fcodesl['1102']= lambda {|o|       
      o.attributes['building'] = 'residential'
    }
    @@fcodesl['1103']= lambda {|o|       
      o.attributes['building'] = 'residential'
    }

    @@fcodesl['9965']= lambda {|o|       
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['2102']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'yes'
    }

    @@fcodesl['2108']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'regional'
    }

    @@fcodesl['2107']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'community'
    }

    @@fcodesl['2106']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'yes'
    }

    @@fcodesl['2123']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'lawn'
    }

    @@fcodesl['2124']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'supermarket'
    }

    @@fcodesl['2114']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'boat'
    }

    @@fcodesl['2113']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'atv'
    }


    @@fcodesl['2111']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'truck'
    }

    @@fcodesl['4234']= lambda {|o|       
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['4237']= lambda {|o|       
      o.attributes['amenity'] = 'studio'    
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['6562']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'kindergarten'
    }
   

    @@fcodesl['2176']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'car_repair'
      o.attributes['car_repair'] = 'lube'
    }

    @@fcodesl['2116']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'car_repair'
      o.attributes['car_repair'] = 'full_service'
    }

    @@fcodesl['2211']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'bank'
    }

    @@fcodesl['2212']= lambda {|o|       
      o.attributes['amenity'] = 'bank'
      o.attributes['atm'] = 'yes'
    }

    @@fcodesl['2210']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'bank'
    }

    @@fcodesl['6222']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'jail'
    }

    @@fcodesl['5111']= lambda {|o|       
      o.attributes['building'] = 'theater'
      o.attributes['amenity'] = 'theater'
    }

    @@fcodesl['5116']= lambda {|o|       
      o.attributes['building'] = 'theater'
      o.attributes['amenity'] = 'theater'
    }

    @@fcodesl['5114']= lambda {|o|       
      o.attributes['building'] = 'theater'
      o.attributes['amenity'] = 'theater'
    }

    @@fcodesl['5112']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'theater'
    }

    @@fcodesl['5000']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'theater'
    }

    @@fcodesl['6810']= lambda {|o|       
      o.attributes['building'] = 'civic'
    }

    @@fcodesl['4310']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'power'
    }

    @@fcodesl['4331']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'water purification'
    }

    @@fcodesl['4321']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'natural_gas'
    }

    @@fcodesl['3216']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'Millwork / veneer / plywood mfg'
    }

    @@fcodesl['3111']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'meat'
    }

    @@fcodesl['3324']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'plastic'
    }

    @@fcodesl['3400']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'manufacturing'
    }

    @@fcodesl['7100']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'construction'
    }

    @@fcodesl['9231']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'grain elevator'
    }

    @@fcodesl['3113']= lambda {|o|       
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'grain_milling'
    }

    @@fcodesl['9201']= lambda {|o|       
      o.attributes['building'] = 'farmhouse'
    }

    @@fcodesl['4140']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'freight'
    }

    @@fcodesl['2332']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'tractor'
    }

    @@fcodesl['9235']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'farm'
    }

    @@fcodesl['9330']= lambda {|o|       
      o.attributes['building'] = 'farm'
      o.attributes['farm'] = 'pig'
    }

    @@fcodesl['9010']= lambda {|o|       
      o.attributes['landuse'] = 'farmyard'    
      o.attributes['building'] = 'farm'
    }

    @@fcodesl['9020']= lambda {|o|       
      o.attributes['landuse'] = 'farmyard'    
      o.attributes['building'] = 'farm'
    }


    @@fcodesl['2175']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'car_repair'
    }

    @@fcodesl['4000']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['2105']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'yes'
    }

    @@fcodesl['2112']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'trailer'
    }

    @@fcodesl['3519']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'salvage'
    }

    @@fcodesl['3519']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'salvage'
    }

    @@fcodesl['6000']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
    }


    @@fcodesl['2510']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['amenity'] = 'restaurant'
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['2522']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['amenity'] = 'restaurant'
      o.attributes['cuisine'] = 'fast_food'
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['2521']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['amenity'] = 'restaurant'
      o.attributes['cuisine'] = 'fast_food'
      o.attributes['building'] = 'commercial'
    }


    @@fcodesl['2117']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['6720']= lambda {|o|       
      o.attributes['landuse'] = 'cemetery'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'funeral directors'      
    }

    @@fcodesl['6710']= lambda {|o|       
      o.attributes['landuse'] = 'cemetery'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'funeral directors'      
    }

    @@fcodesl['6511']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['office'] = 'doctor'      

    }

    @@fcodesl['4346']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'waste disposal'      
    }

    @@fcodesl['2172']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['9920']= lambda {|o|       
      o.attributes['landuse'] = 'industrial'    
      o.attributes['building'] = 'industrial'
      o.attributes['industrial'] = 'waste disposal'      
    }

    @@fcodesl['2101']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'yes'      
    }

    @@fcodesl['2104']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'yes'      
    }

    @@fcodesl['2151']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'supermarket'      
    }

    @@fcodesl['2152']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'convenience'      
    }

    @@fcodesl['2174']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'car_service'      
    }

    @@fcodesl['2126']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['shop'] = 'building'      
    }

    @@fcodesl['2540']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'nightclub'
    }

    @@fcodesl['2541']= lambda {|o|       
      o.attributes['building'] = 'nightclub'
      o.attributes['amenity'] = 'nightclub'
    }

    @@fcodesl['2403']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['office'] = 'yes'      
    }

    @@fcodesl['2402']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['office'] = 'yes'      
    }

    @@fcodesl['2660']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'parking'      
      o.attributes['parking'] = 'garage'      
    }

    @@fcodesl['3670']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = 'parking'      
      o.attributes['parking'] = 'truck terminal'      
    }

    @@fcodesl['4170']= lambda {|o|       
      o.attributes['landuse'] = 'commercial'    
      o.attributes['building'] = 'commercial'
      o.attributes['commercial']="postal"

    }

    @@fcodesl['6610']= lambda {|o|  o.attributes['amenity'] = "place_of_worship"   
      o.attributes['building'] = "church"
    }

    @@fcodesl['2118']= lambda {|o|  
      o.attributes['shop'] = "car"  
      o.attributes['building'] = 'commercial'
    }

    @@fcodesl['6121']= lambda {|o|  
      o.attributes['amenity'] = "school" 
      o.attributes['building'] = "school"
    }

    @@fcodesl['6110']= lambda {|o|  
      o.attributes['amenity'] = "kindergarten"
    }

    @@fcodesl['6620']= lambda {|o|  
      o.attributes['amenity'] = "school" 
      o.attributes['building'] = "school"
    }

    @@fcodesl['6122']= lambda {|o|  
      o.attributes['amenity'] = "school" 
      o.attributes['building'] = "school"
    }

    @@fcodesl['6132']= lambda {|o|  
      o.attributes['amenity'] = "university" 
      o.attributes['building'] = "school"
    }

    @@fcodesl['6126']= lambda {|o|  
      o.attributes['amenity'] = "school" 
      o.attributes['school'] = "adult_education"
    }

    @@fcodesl['6140']= lambda {|o|  
      o.attributes['amenity'] = "school" 
      o.attributes['building'] = "school"
    }

    @@fcodesl['4238']= lambda {|o|    
      o.attributes['man_made'] = 'tower'
      o.attributes['tower'] = 'communcations'
    }

    @@fcodesl['2128']= lambda {|o|       o.attributes['shop'] = 'variety shop'  
      o.attributes['building'] = "commercial"
}

    @@fcodesl['2000']= lambda {|o|       
      o.attributes['shop'] = 'yes'  
      o.attributes['building'] = "commercial"
      o.attributes['landuse'] = "commercial"
}

    @@fcodesl['9050']= lambda {|o|       o.attributes['landuse'] = 'farmland'    
      o.attributes['building'] = "farm"
    }
    @@fcodesl['6123']= lambda {|o|       o.attributes['amenity'] = "school" 
      o.attributes['building'] = "school"
    } 
    @@fcodesl['3620']= lambda {|o|       o.attributes['building'] = "warehouse" }
    @@fcodesl['3610']= lambda {|o|       o.attributes['building'] = "warehouse" }
    @@fcodesl['3660']= lambda {|o|       o.attributes['building'] = "warehouse" }
    @@fcodesl['3640']= lambda {|o|       o.attributes['building'] = "warehouse" }
    @@fcodesl['3630']= lambda {|o|       o.attributes['building'] = "warehouse" }
    @@fcodesl['9970']= lambda {|o|       o.attributes['building'] = "commercial" }
    @@fcodesl['3342']= lambda {|o|       
      o.attributes['building'] = "industrial"
      o.attributes['industrial'] = "Steel fabrication"
    }

    @@fcodesl['3341']= lambda {|o|       
      o.attributes['building'] = "industrial"
      o.attributes['industrial'] = "Steel and Iron Foundry"
    }

    @@fcodesl['4215']= lambda {|o|       
      o.attributes['building'] = "industrial"
      o.attributes['industrial'] = "Printing"
    }

    @@fcodesl['5210']= lambda {|o|       
      o.attributes['building'] = "commercial"
      o.attributes['commercial'] = "unknown"
    }

    @@fcodesl['1175']= lambda {|o|       
      o.attributes['building'] = "commercial"
    }


    @@fcodesl['2321']= lambda {|o|       
      o.attributes['building'] = "warehouse"
    }

    @@fcodesl['6832']= lambda {|o|       
      o.attributes['building'] = "Fraternal institution"
    }

    @@fcodesl['1332']= lambda {|o|       
      o.attributes['tourism'] = "hotel"
    }
    @@fcodesl['1330']= lambda {|o|       
      o.attributes['tourism'] = "motel"
    }

    @@fcodesl['1331']= lambda {|o|       
      o.attributes['tourism'] = "motel;restaurant"
    }

    @@fcodesl['1310']= lambda {|o|       
      o.attributes['tourism'] = "motel"
    }

    @@fcodesl['1320']= lambda {|o|       
      o.attributes['tourism'] = "hostel"
    }

    @@fcodesl['9950']= lambda {|o|       o.attributes['landuse'] = "unused" }
    @@fcodesl['2650']= lambda {|o|       o.attributes['amenity'] = "parking" }
    @@fcodesl['2401']= lambda {|o|       
      o.attributes['office'] = "yes"
      o.attributes['building'] = "office"
    }
      


    @@fcodesl['6630']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
      o.attributes['amenity'] = "place_of_worship"   
    }

    @@fcodesl['6570']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
      o.attributes['amenity'] = "charity"   
    }

    @@fcodesl['6560']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
      o.attributes['amenity'] = "welfare"   
    }


    @@fcodesl['5510']= lambda {|o|       
      o.attributes['leisure'] = "park"   
    }

    @@fcodesl['5520']= lambda {|o|       
      o.attributes['leisure'] = "park"   
    }

    @@fcodesl['5220']= lambda {|o|       
      o.attributes['tourism'] = "museum"   
    }


    @@fcodesl['1199']= lambda {|o|       
      o.attributes['landuse'] = 'residential'    
      o.attributes['building'] = 'residential'
      o.attributes['amenity'] = "parking"   
    }

    @@fcodesl['2418']= lambda {|o|       
      o.attributes['building'] = 'commercial'
      o.attributes['amenity'] = "veterinary"   
    }

    @@fcodesl['6210']= lambda {|o|       
      o.attributes['building'] = 'government'
    }

    @@fcodesl['5379']= lambda {|o|       
      o.attributes['lesiure'] = 'stadium'
    }
    
    

    # from http://aims.jocogov.org/OtherResources/luval.aspx?n=LBCS%20Activity&t=lulbcsactivity&f1=code&f2=description
    #LBCSACTIVITY
    @@codes= Hash.new
    @@codes['1000']='Residential activities'
    @@codes['1100']='Household activities'
    @@codes['1200']='Transient living'
    @@codes['1300']='Institutional living'
    @@codes['1400']='Residential Support'
    @@codes['2000']='Shopping, business, trade activities'
    @@codes['2100']='Shopping'
    @@codes['2110']='Goods-oriented shopping'
    @@codes['2120']='Service-oriented shopping'
    @@codes['2200']='Restaurant-type activity'
    @@codes['2210']='Restaurant-type activity with drive-through'
    @@codes['2220']='Bar, club, restaurant activity with entertainment or dancing'
    @@codes['2300']='Office activities'
    @@codes['2310']='Office activities with high turnover of people'
    @@codes['2320']='Office activities with high turnover of automobiles'
    @@codes['3000']='Industrial, manufacturing, waste related activities'
    @@codes['3100']='Plant, factory, heavy goods storage, handling activities'
    @@codes['3110']='Primarily plant or factory-type activities'
    @@codes['3120']='Primarily goods storage or handling activities'
    @@codes['3200']='Solid waste management activities'
    @@codes['3210']='Solid waste collection and storage'
    @@codes['3220']='Landfill or dumping'
    @@codes['3230']='Waste processing, salvage or recycling'
    @@codes['3300']='Construction activities (grading, digging, etc.)'
    @@codes['4000']='Social, institutional, infrastructure-related activities'
    @@codes['4100']='School or library activities'
    @@codes['4110']='Classroom-type activities'
    @@codes['4120']='Training or instructional activities outside the classroom'
    @@codes['4130']='Other instructional or library activities'
    @@codes['4200']='Emergency response or public safety related activities'
    @@codes['4210']='Fire and rescue related activities'
    @@codes['4220']='Police, security, protection-related activities'
    @@codes['4230']='Emergency or disaster related activities'
    @@codes['4300']='Utility service (water, sewer, power, etc.) activities'
    @@codes['4310']='Water supply related activities'
    @@codes['4311']='Water storing, pumping, or piping'
    @@codes['4312']='Water purification and filtration activities'
    @@codes['4313']='Irrigation water storage and distribution activities'
    @@codes['4314']='Flood control dams and other large irrigation activities'
    @@codes['4320']='Sewer-related control, monitoring, distribution, activities'
    @@codes['4321']='Sewage storing, pumping, or piping'
    @@codes['4322']='Sewer treatment and processing'
    @@codes['4330']='Power generation, control, distribution activities'
    @@codes['4331']='Power transmission lines or control activities'
    @@codes['4332']='Power generation, storage, processing activities'
    @@codes['4340']='Telecommunications-related control, monitoring, distribution'
    @@codes['4350']='Natural gas, fuels-related control, monitoring, distribution'
    @@codes['4400']='Mass storage, inactive'
    @@codes['4410']='Water storage'
    @@codes['4420']='Natural gas or fuels storage'
    @@codes['4430']='Chemical, nuclear, other materials storage'
    @@codes['4500']='Health care, medical, treatment activities'
    @@codes['4600']='Internment, cremation, grave digging activities'
    @@codes['4700']='Military base activities'
    @@codes['4710']='Ordnance storage'
    @@codes['4720']='Range and test activities'
    @@codes['4800']='Incarceration activities'
    @@codes['4900']='Charitable, scientific, or benevolent activities'
    @@codes['5000']='Travel or movement activities'
    @@codes['5100']='Pedestrian movement'
    @@codes['5200']='Vehicular movement'
    @@codes['5210']='Vehicular parking, storage, etc.'
    @@codes['5220']='Drive-in, drive through, stop-n-go, etc.'
    @@codes['5400']='Trains and other railroad movement'
    @@codes['5410']='Rail maintenance, storage or related activities'
    @@codes['5500']='Port, marine, boating and water-based activities'
    @@codes['5510']='Boat docking, mooring, or servicing'
    @@codes['5520']='Port, ship-building, and related activities'
    @@codes['5600']='Aircraft takeoff, landing, taxiing and parking'
    @@codes['5700']='Spacecraft launching and related activities'
    @@codes['6000']='Mass assembly of people'
    @@codes['6100']='Passenger assembly'
    @@codes['6200']='Spectator sports assembly'
    @@codes['6300']='Movies, concerts, entertainment shows'
    @@codes['6400']='Fairs, exhibitions, gatherings'
    @@codes['6500']='Mass training, drills, etc.'
    @@codes['6600']='Religious, social, cultural assembly'
    @@codes['6700']='Museums, zoological parks, galleries, aquariums, etc.'
    @@codes['6800']='Historical or cultural celebrations, reenactments, etc.'
    @@codes['7000']='Leisure activities'
    @@codes['7100']='Active leisure sports and related activities'
    @@codes['7110']='Running, jogging, bicycling, aerobics, exercising, etc.'
    @@codes['7120']='Equestrian sporting activities'
    @@codes['7130']='Hockey, ice skating, etc.'
    @@codes['7140']='Skiing, snowboarding, etc.'
    @@codes['7150']='Automobile and motorbike racing'
    @@codes['7160']='Golf'
    @@codes['7180']='Tennis'
    @@codes['7190']='Track and field, team sports, or other sports'
    @@codes['7200']='Passive leisure activity'
    @@codes['7210']='Camping'
    @@codes['7220']='Gambling'
    @@codes['7230']='Hunting'
    @@codes['7240']='Promenading and other park activity'
    @@codes['7250']='Shooting'
    @@codes['7260']='Trapping'
    @@codes['7300']='Flying or air-related sports'
    @@codes['7400']='Water sports and related activities'
    @@codes['7410']='Boating and sailing'
    @@codes['7420']='Canoeing and Kayaking'
    @@codes['7430']='Swimming and diving'
    @@codes['7440']='Fishing and angling'
    @@codes['7450']='Scuba diving and snorkeling'
    @@codes['7460']='Water-skiing'
    @@codes['8000']='Natural resources-related activities'
    @@codes['8100']='Farming, plowing, tilling, harvesting, or related activities'
    @@codes['8200']='Livestock related activities'
    @@codes['8300']='Pasturing, grazing, etc.'
    @@codes['8400']='Logging'
    @@codes['8500']='Quarrying or stone cutting'
    @@codes['8600']='Mining (surface and subsurface)'
    @@codes['8700']='Drilling, dredging, etc.'
    @@codes['9000']='No human activity'
    @@codes['9200']='Unclassifiable activity'
    @@codes['9300']='Subsurface activity'

    # from www.ksrevenue.org/pdf/dir11-044.pdf
    #LBCSFUNCTION     
    @@fcodes= Hash.new
    @@fcodes['1101']='Single-family residence (detached)'
    @@fcodes['1102']='Duplex'
    @@fcodes['1103']='Triplex'
    @@fcodes['1104']='Fourplex'
    @@fcodes['1105']='Townhouse unit or attached living unit in a multifamily structure [condo]'
    @@fcodes['1120']='Multiple dwelling parcel'
    @@fcodes['1150']='Apartment unit [e.g. single family condo unit]'
    @@fcodes['1155']='Residential common area & support facilities'
    @@fcodes['1160']='Manufactured home site'
    @@fcodes['1161']='Manufactured home site in a park or community'
    @@fcodes['1165']='Manufactured home park'
    @@fcodes['1170']='Garden apartment complex (1-3 stories)'
    @@fcodes['1171']='Federally subsidized apartment complex'
    @@fcodes['1172']='Low -rise (walk-up) apartment'
    @@fcodes['1175']='Mid-Rise apartment (4-7 stories)'
    @@fcodes['1176']='High-rise apartment (8+ stories)'
    @@fcodes['1179']='Single room occupancy housing (converted motel, hotel)'
    @@fcodes['1180']='Dwelling converted to apartments'
    @@fcodes['1190']='Temporary residential use (tent, travel trailer, portable shelter)'
    @@fcodes['1199']='Accessory residential support use (garage, shed)'
    @@fcodes['1210']='Retirement housing'
    @@fcodes['1220']='Congregate living facility'
    @@fcodes['1230']='Assisted-living facility'
    @@fcodes['1240']='Life care or continuing care services'
    @@fcodes['1250']='Skilled-nursing services'
    @@fcodes['1310']='Bed and breakfast inn'
    @@fcodes['1320']='Rooming and boarding house'
    @@fcodes['1330']='Hotel / motel'
    @@fcodes['1331']='Hotel / motel with restaurant'
    @@fcodes['1332']='Hotel - high-rise (5+ stories)'
    @@fcodes['1340']='Casino hotel'
    @@fcodes['1342']='Resort / dude ranch'
    @@fcodes['1344']='Health Spa'
    @@fcodes['2000']='General sales or services (not elsewhere classified)'
    @@fcodes['2101']='Downtown row store'
    @@fcodes['2102']='Retail store'
    @@fcodes['2103']='Retail unit (within a structure) [condo]'
    @@fcodes['2104']='Convenience retail center'
    @@fcodes['2105']='Strip store center'
    @@fcodes['2106']='Neighborhood shopping center'
    @@fcodes['2107']='Community shopping center'
    @@fcodes['2108']='Regional shopping center'
    @@fcodes['2109']='Super regional shopping center'
    @@fcodes['2111']='Automobile / light truck / RV dealership'
    @@fcodes['2112']='Mobile home / manufactured housing dealership'
    @@fcodes['2113']='Motorcycle / ATV dealer'
    @@fcodes['2114']='Boat / marine craft dealer'
    @@fcodes['2116']='Auto service station (full service with garage bays)'
    @@fcodes['2117']='Self-service gas station (may have convenience food mart)'
    @@fcodes['2118']='Car lot / used car dealership'
    @@fcodes['2121']='Furniture / home furnishings center'
    @@fcodes['2122']='Hardware / home improvement center'
    @@fcodes['2123']='Lawn and garden supply / feed store'
    @@fcodes['2124']='Department store / warehouse club / superstore'
    @@fcodes['2125']='Big box store (electronics / appliances)'
    @@fcodes['2126']='Lumberyard / building materials store'
    @@fcodes['2128']='Discount store'
    @@fcodes['2130']='Durable consumer goods sales and services'
    @@fcodes['2151']='Grocery store / supermarket'
    @@fcodes['2152']='Convenience store'
    @@fcodes['2153']='Specialty food / health food store'
    @@fcodes['2154']='Fruit and vegetable market'
    @@fcodes['2161']='Pharmacy / drug store'
    @@fcodes['2170']='Automotive specialized services'
    @@fcodes['2171']='Automatic car wash'
    @@fcodes['2172']='Self-service car wash'
    @@fcodes['2174']='Automobile service center'
    @@fcodes['2175']='Service garage / paint shop / detailing'
    @@fcodes['2176']='Quick lube shop'
    @@fcodes['2180']='Specialized retail center'
    @@fcodes['2181']='Fashion/specialty shopping center (high-end, fashion-oriented stores)'
    @@fcodes['2182']='Power center (category-dominated anchors with few small tenants)'
    @@fcodes['2183']='Theme or festival shopping center (leisure, tourist-oriented, restaurants)'
    @@fcodes['2184']='Outlet or discount shopping center (manufacturer outlet stores)'
    @@fcodes['2210']='Bank / savings institution'
    @@fcodes['2211']='Branch bank (drive up facility)'
    @@fcodes['2212']='Bank / ATM kiosk or remote facility'
    @@fcodes['2321']='Mini-storage warehouse / self-storage'
    @@fcodes['2331']='Car rental agency'
    @@fcodes['2332']='Tractor / heavy trucks / trailer, dealership / leasing'
    @@fcodes['2333']='Recreational goods rental'
    @@fcodes['2334']='Leasing commercial / industrial machinery and equipment'
    @@fcodes['2335']='Consumer goods rental'
    @@fcodes['2401']='General office buildings (1-4 stories)'
    @@fcodes['2402']='General office buildings (5+ stories)'
    @@fcodes['2403']='Strip office center'
    @@fcodes['2404']='Office unit (within a structure) [condo]'
    @@fcodes['2405']='Office / retail common area and facilities'
    @@fcodes['2418']='Veterinary office / clinic'
    @@fcodes['2510']='Full-service restaurant'
    @@fcodes['2520']='Cafeteria / limited service restaurant'
    @@fcodes['2521']='Drive-in restaurant'
    @@fcodes['2522']='Fast food restaurant'
    @@fcodes['2530']='Snack / nonalcoholic bar'
    @@fcodes['2540']='Bar / tavern / lounge'
    @@fcodes['2541']='Night club / dinner theater'
    @@fcodes['2560']='Caterer / commissary'
    @@fcodes['2650']='Parking lot (uncovered)'
    @@fcodes['2660']='Parking garage (covered)'
    @@fcodes['2721']='Animal shelter / pound'
    @@fcodes['2722']='Kennel / boarding services'
    @@fcodes['2800']='Retail / office / apartment combination'
    @@fcodes['3110']='Food and beverage mfg.'
    @@fcodes['3111']='Meat products mfg.'
    @@fcodes['3112']='Dairy products mfg.'
    @@fcodes['3113']='Grain milling products mfg.'
    @@fcodes['3114']='Bakery products mfg.'
    @@fcodes['3115']='Beverage products mfg.'
    @@fcodes['3120']='Tobacco products mfg.'
    @@fcodes['3130']='Textile (mill products) mfg.'
    @@fcodes['3131']='Clothing mfg.'
    @@fcodes['3140']='Leather and allied products mfg.'
    @@fcodes['3210']='Wood products mfg.'
    @@fcodes['3215']='Sawmill'
    @@fcodes['3216']='Millwork / veneer / plywood mfg.'
    @@fcodes['3221']='Paper manufacturing'
    @@fcodes['3222']='Paperboard/cardboard / box mfg.'
    @@fcodes['3230']='Furniture and related products mfg.'
    @@fcodes['3311']='Petroleum refining'
    @@fcodes['3312']='Paving and roofing materials mfg.'
    @@fcodes['3321']='Rubber products mfg.'
    @@fcodes['3322']='Paint / varnish / lacquer mfg.'
    @@fcodes['3323']='Drug / pharmaceutical mfg.'
    @@fcodes['3324']='Plastic mfg.'
    @@fcodes['3325']='Industrial chemical mfg.'
    @@fcodes['3331']='Flat glass mfg.'
    @@fcodes['3332']='Glass and glassware products mfg.'
    @@fcodes['3333']='Cement mfg.'
    @@fcodes['3334']='Gypsum / plaster / concrete products mfg.'
    @@fcodes['3335']='Cut stone and stone products mfg.'
    @@fcodes['3340']='Primary metal mfg.'
    @@fcodes['3341']='Steel and iron foundries'
    @@fcodes['3342']='Steel fabrication'
    @@fcodes['3350']='Machinery mfg.'
    @@fcodes['3351']='Automobile / truck manufacturing'
    @@fcodes['3352']='Aircraft manufacturing'
    @@fcodes['3353']='Instrument / high-technology manufacturing'
    @@fcodes['3360']='Electrical equipment / appliance / components manufacturing'
    @@fcodes['3370']='Heavy transportation equipment mfg. (railroad / pipeline)'
    @@fcodes['3400']='Miscellaneous manufacturing'
    @@fcodes['3519']='Salvage Yard / recycle center'
    @@fcodes['3610']='Warehouse distribution / storage facility'
    @@fcodes['3620']='Warehouse-office strip / complex'
    @@fcodes['3630']='Warehouse-retail combination'
    @@fcodes['3640']='Warehouse-office combination'
    @@fcodes['3660']='Cold storage warehouse'
    @@fcodes['3670']='Transit warehouse / truck terminal'
    @@fcodes['4000']='Transportation / communication / information / utilities'
    @@fcodes['4110']='Air transportation'
    @@fcodes['4111']='Air passenger transportation'
    @@fcodes['4112']='Air freight transportation'
    @@fcodes['4113']='Airport and support facilities'
    @@fcodes['4114']='Aircraft and accessories'
    @@fcodes['4115']='Other air transportation (sailplane, blimp, balloon, etc.)'
    @@fcodes['4120']='Rail transportation'
    @@fcodes['4130']='Road / ground passenger / transit transportation'
    @@fcodes['4133']='Local transit systems-bus / special needs / other motor vehicles'
    @@fcodes['4134']='Interurban / charter bus & similar operations'
    @@fcodes['4135']='School & employee bus transportation'
    @@fcodes['4136']='Special purpose transit transportation (including scenic, sightseeing, etc.)'
    @@fcodes['4137']='Taxi / limousine service'
    @@fcodes['4138']='Towing / other road and ground services'
    @@fcodes['4139']='Private street / road'
    @@fcodes['4140']='Truck and freight transportation services'
    @@fcodes['4152']='Marine / barge freight transportation'
    @@fcodes['4170']='Postal services'
    @@fcodes['4180']='Pipeline transportation'
    @@fcodes['4213']='Periodical publishing / printing'
    @@fcodes['4214']='Newspaper publishing / printing'
    @@fcodes['4215']='Commercial printing'
    @@fcodes['4220']='Motion pictures & sound recording'
    @@fcodes['4231']='Radio and television broadcasting'
    @@fcodes['4232']='Cable networks & distribution'
    @@fcodes['4233']='Wireless telecommunications'
    @@fcodes['4234']='Telephone communication'
    @@fcodes['4235']='Telegraph communication'
    @@fcodes['4236']='Radio station'
    @@fcodes['4237']='TV studio / station'
    @@fcodes['4238']='Transmitter / antenna facility'
    @@fcodes['4240']='Information services and data processing'
    @@fcodes['4242']='Libraries and archives'
    @@fcodes['4310']='Electric power generation'
    @@fcodes['4312']='Electric power generation - fossil'
    @@fcodes['4313']='Electric power generation - nuclear'
    @@fcodes['4314']='Electric power generation - alternative energy'
    @@fcodes['4321']='Natural gas utility'
    @@fcodes['4331']='Drinking water purification / distribution'
    @@fcodes['4332']='Irrigation / industrial water supply'
    @@fcodes['4333']='Air conditioning and steam generation'
    @@fcodes['4341']='Hazardous waste collection'
    @@fcodes['4342']='Hazardous waste treatment & disposal'
    @@fcodes['4343']='Solid waste collection'
    @@fcodes['4344']='Solid waste combustor / incinerator'
    @@fcodes['4345']='Solid waste disposal / landfill'
    @@fcodes['4346']='Waste treatment and disposal'
    @@fcodes['4347']='Septic tank & related services'
    @@fcodes['5000']='Arts / entertainment / recreational'
    @@fcodes['5111']='Motion picture theater'
    @@fcodes['5112']='Cinema complex (2 or more screens)'
    @@fcodes['5113']='Drive-in theater'
    @@fcodes['5114']='Legitimate theater'
    @@fcodes['5115']='Amphitheater'
    @@fcodes['5116']='Auditorium / concert hall / performing arts center'
    @@fcodes['5130']='Racetrack'
    @@fcodes['5210']='Museum / science & technology center'
    @@fcodes['5211']='Art gallery'
    @@fcodes['5212']='Living history museum'
    @@fcodes['5220']='Historical or archeological institution'
    @@fcodes['5230']='Zoo / botanical garden / aquarium'
    @@fcodes['5232']='Zoo / animal park'
    @@fcodes['5234']='Botanical garden / arboretum'
    @@fcodes['5236']='Aquarium / marine science center'
    @@fcodes['5310']='Amusement or theme park'
    @@fcodes['5315']='Fairground'
    @@fcodes['5320']='Games arcade'
    @@fcodes['5330']='Casino or gambling establishment'
    @@fcodes['5340']='Miniature golf course'
    @@fcodes['5341']='Family sports / recreation center'
    @@fcodes['5350']='Ski slope / alpine sports'
    @@fcodes['5360']='Marina / yacht club'
    @@fcodes['5371']='Gymnasium'
    @@fcodes['5372']='Fitness center / racquetball club'
    @@fcodes['5373']='Tennis club'
    @@fcodes['5374']='Golf course'
    @@fcodes['5375']='Country club golf course'
    @@fcodes['5376']='Driving range'
    @@fcodes['5377']='Playground'
    @@fcodes['5378']='Swimming pool'
    @@fcodes['5379']='Sports complex / arena / playing fields'
    @@fcodes['5381']='Bowling alley'
    @@fcodes['5382']='Pool hall'
    @@fcodes['5390']='Skating rink / ice rink'
    @@fcodes['5410']='Travel trailer park'
    @@fcodes['5420']='Camp ground / camping park'
    @@fcodes['5430']='Fishing / hunting camp'
    @@fcodes['5510']='General recreation park'
    @@fcodes['5520']='Ornamental park'
    @@fcodes['6000']='Education / public administration / health care and other institutions'
    @@fcodes['6110']='Nursery / kindergarten / preschool'
    @@fcodes['6121']='Elementary'
    @@fcodes['6122']='Middle (junior high school)'
    @@fcodes['6123']='Senior (high school)'
    @@fcodes['6124']='Continuance'
    @@fcodes['6125']='Alternate education services'
    @@fcodes['6126']='Adult education services'
    @@fcodes['6131']='Junior college'
    @@fcodes['6132']='University'
    @@fcodes['6133']='Specialized college / school'
    @@fcodes['6140']='Technical / trade / specialty school'
    @@fcodes['6144']='Driving school'
    @@fcodes['6145']='Dance / fine/performing arts education'
    @@fcodes['6146']='Flight training school'
    @@fcodes['6147']='Sports / athletic training school'
    @@fcodes['6210']='Government offices (legislative and executive functions)'
    @@fcodes['6221']='Court / judicial offices'
    @@fcodes['6222']='Correctional institutions / jail / prison'
    @@fcodes['6300']='Other government functions'
    @@fcodes['6310']='Military / national security base or reservation'
    @@fcodes['6320']='Space research / technology center'
    @@fcodes['6400']='Public safety'
    @@fcodes['6410']='Fire and rescue'

    @@fcodes['6420']='Police station / law enforcement center'
    @@fcodes['6430']='Emergency response center'
    @@fcodes['6510']='Ambulatory or outpatient care services'
    @@fcodes['6511']='Medical / dental office / clinic'
    @@fcodes['6513']='Medical / diagnostic lab'
    @@fcodes['6514']='Blood / organ bank'
    @@fcodes['6530']='Hospital'
    @@fcodes['6531']='Surgical clinic'
    @@fcodes['6560']='Social assistance / services / welfare / charitable services'
    @@fcodes['6561']='Child and youth services'
    @@fcodes['6562']='Child day care / learning center'
    @@fcodes['6563']='Community food bank'
    @@fcodes['6564']='Emergency relief services'
    @@fcodes['6570']='Charitable Institution'
    @@fcodes['6610']='Church / place of worship'
    @@fcodes['6620']='Parochial school'
    @@fcodes['6630']='Religious living quarters'
    @@fcodes['6640']='Religious administrative headquarters'
    @@fcodes['6710']='Funeral home / mortuary'
    @@fcodes['6720']='Cemetery / cremation services'
    @@fcodes['6800']='Professional associations / nonprofit organizations'
    @@fcodes['6810']='Union hall / labor and political organization'
    @@fcodes['6820']='Business associations / professional membership organizations'
    @@fcodes['6831']='Civic club'
    @@fcodes['6832']='Fraternal institution'
    @@fcodes['6833']='Social club'
    @@fcodes['7100']='Building / development / general contracting'
    @@fcodes['7300']='Special trade contractor'
    @@fcodes['7400']='Heavy construction contractor'
    @@fcodes['8000']='Mining and extraction operations'
    @@fcodes['8110']='Natural gas / helium extraction'
    @@fcodes['8120']='Crude oil extraction'
    @@fcodes['8190']='Severed subsurface mineral interest'
    @@fcodes['8191']='Non-severed mineral right'
    @@fcodes['8200']='Metal mining (iron, copper, etc.)'
    @@fcodes['8300']='Coal mining'
    @@fcodes['8400']='Nonmetallic mining (salt, gypsum etc.)'
    @@fcodes['8500']='Quarrying and stone cutting establishment'
    @@fcodes['8510']='Sand pit'
    @@fcodes['8590']='Lake / pond'
    @@fcodes['9010']='Farming / ranch land (no improvements)'
    @@fcodes['9020']='Farming / ranch land (with Ag improvements)'
    @@fcodes['9050']='Farming/ranching operation (with residential improvements)'
    @@fcodes['9130']='Fruits / trees'
    @@fcodes['9141']='Food crops grown under cover'
    @@fcodes['9142']='Nursery / tree production'
    @@fcodes['9143']='Floriculture production'
    @@fcodes['9201']='Support structures for farming / ranching operations'
    @@fcodes['9220']='Spraying / crop dusting and other related services'
    @@fcodes['9230']='Crop harvesting & post harvest crop activities (including drying, storage, etc.)'
    @@fcodes['9231']='Grain storage elevator'
    @@fcodes['9235']='Farm implement dealer'
    @@fcodes['9240']='Cotton ginning / grist milling'
    @@fcodes['9312']='Cattle feedlot'
    @@fcodes['9313']='Stockyard'
    @@fcodes['9314']='Cattle confinement'
    @@fcodes['9320']='Dairy cattle and milk production'
    @@fcodes['9330']='Hog & pig farm confinement'
    @@fcodes['9340']='Poultry & egg production / hatchery'
    @@fcodes['9360']='Fish hatchery / fishery / aquaculture'
    @@fcodes['9371']='Apiculture (bees, wax and related operations'
    @@fcodes['9373']='Fur bearing animal production'
    @@fcodes['9410']='Logging'
    @@fcodes['9420']='Forest nursery'
    @@fcodes['9430']='Support functions for forestry'
    @@fcodes['9520']='Game retreat / wildlife reserve / fishing preserve'
    @@fcodes['9900']='Unused / undeveloped'
    @@fcodes['9901']='Tribal lands / Indian reservation'
    @@fcodes['9910']='Residential highest and best use'
    @@fcodes['9911']='Multi-family highest and best use'
    @@fcodes['9920']='Industrial highest and best use'
    @@fcodes['9940']='Transportation / utility / communication highest and best use'
    @@fcodes['9950']='Commercial highest and best use'
    @@fcodes['9965']='Institutional highest and best use'
    @@fcodes['9970']='Recreational / cultural / entertainment highest and best use'
    @@fcodes['9980']='Resource extraction / mining highest and best use'
    @@fcodes['9999']='Unclassified'

    @@bearing= Hash.new
    @@bearing['NW'] = 	'Northwest'
    @@bearing['NE'] = 	'Northeast'
    @@bearing['SE'] = 	'Southeast'
    @@bearing['SW'] = 	'Southwest'
    @@bearing['N'] = 	'North'
    @@bearing['E'] = 	'East'
    @@bearing['S'] = 	'South'
    @@bearing['W'] = 	'West'

    @@infields = %w{    
OBJECTID     
PARCELNUM    
ACRES    
PIN     
PID     
QUICKREFID                 
DBOOKPAGE     
SUBS     
NBHD     
TAXUNIT    
USD          
CLASS                  
Shape.area
Shape.len
}

    @@fields = %w{    
lbcs:activity:code
lbcs:activity:name
lbcs:function:code
lbcs:function:name
amenity
landuse
man_made
tower
industrial
commercial
power
building
shop
addr:city
addr:postcode
addr:street
addr:housenumber
addr:suite
}

    @@fields2 = %w{    ONAME MAILNAME     MAILADDRESS     MAILADDRESS2   WebLink PRC_Link PADDRESS    PADDRESS2 
LBCSFUNCTION     LBCSACTIVITY BLDGVAL     LDVAL     TOTVAL  
}

  end

  def self.getfields ()
    Property.initfields
    return [@@infields,@@fields2].flatten
  end

  def self.bearings 
    Property.initfields
    return @@bearing.keys
  end

  def initialize()
    super
    Property.initfields
  end

  @@count=0

  def attributes
    @attributes
  end 

  def setattributes(v)
    @attributes=v
  end 

  def initialize()
    @attributes=Hash.new
    @@count -= 1
    @id=@@count
  end

  def emitkv (ios, k, v) 
    k.sub(".","_")
    k=k.downcase
    ios.write "<tag k=\"#{k}\" v=\"#{v}\"/>\n"   
  end
  

  def osmxml (ios)

    @@fields.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil?)
        emitkv ios, k, v
      end
    }

  end
  
end

class Node  < BaseNode

  def osmxml (ios)
    ios.write ("<node id=\"#{@id}\" lat=\"#{@lat}\"  lon=\"#{@lon}\" >\n")
    super
    ios.write ("</node>\n")
  end

  def osmxmlref (ios)
    ios.write ("<nd ref=\"#{@id}\" />\n")
  end

  def landuse 
    if (@attributes['lbcs:activity:code'].nil?)
      @attributes['fixme'] = "check this lbcs"     
      return
    end

    # now determine the landuse of the node
    if ! @@codesl.include?( @attributes['lbcs:activity:code'])


      if @@fcodesl.include?( @attributes['lbcs:function:code'])
        
        @@fcodesl[@attributes['lbcs:function:code']][self]

      else
#        p @attributes
        abort "missing " + "activity:"       + @attributes['lbcs:activity:code']    + @attributes['lbcs:activity:name']     + "function:" + @attributes['lbcs:function:code'] +  @attributes['lbcs:function:name']        
      end


    end
  end

  def church 
o
  end

  def school

  end

  def initialize(lat,lon)
    super()
    @lat=lat
    @lon=lon
  end

  def id
    @id
  end

  def lat
    @lat
  end

  def lon  
    @lon
  end
end

class Way  < BaseNode

  def initialize()
    super
    @nodes=Array.new
  end

  def nodes
    @nodes
  end
end

class Property  < Way
 

  def kv (k,v)
    @attributes[k]=v
  end

  def addpoint (lat,lon)
    p = Node.new(lat,lon)
    if (!p.nil?)
      @nodes.push(p)
    else
      abort "no node"
    end
  end

  def closeway
    if (!@nodes[0].nil?)
      @nodes.push(@nodes[0])
    else
    end
  end

  def midpoint 
    sumlat = 0
    sumlon = 0
    @nodes.each { |x| 
      sumlat += x.lat
      sumlon += x.lon
    }
    @middle=  Node.new(sumlat/@nodes.size,sumlon/@nodes.size)    

    @middle.setattributes( @attributes)
    @middle.landuse
    
  end

  def osmxml (ios)
   
    @@fields.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil?)
        emitkv ios, k, v
      end
    }

    self.midpoint # calc the midpoint
    if (@middle.nil?)
      abort "midpoint not set"
      else
      
      @middle.osmxml(ios)  #emit it
    end


  end

  def cleanup

    if ! @attributes.include?("snco.us:paddress")
      abort('no address')
    end
    paddress=@attributes["snco.us:paddress"]
    paddress2=@attributes["snco.us:paddress2"]
    
    paddressa=paddress.split(%r{\s})
    paddressa2=paddress2.split(%r{\s})

    housenumberorbearing = paddressa.shift

    if @@bearing.include?(housenumberorbearing)
      # no house number
      @attributes['addr:housenumber']=nil
      @attributes['addr:bearing']=@@bearing[housenumberorbearing]
    else
      @attributes['addr:housenumber'] =  housenumberorbearing      
      bearing = paddressa.shift
      @attributes['addr:bearing']=@@bearing[bearing]

    end


    streettype = paddressa.pop
    if @@abbr.include?(streettype)
      @attributes['addr:street_type']=@@abbr[streettype]
    else

      # now check if there is a # and put it in the suite
      #
      if streettype.nil?
      else
        while streettype.match("^\[\#\&].+")
          @attributes['addr:suite']=streettype
          streettype = paddressa.pop
          if @@abbr.include?(streettype)
            @attributes['addr:street_type']=@@abbr[streettype]
          else
            warn @attributes
            abort("no street type" + streettype )        
          end
        end        
      end
    end

    @attributes['addr:street_name']=paddressa.join(" ") # the rest

    @attributes['addr:full']=     [@attributes['addr:housenumber'] , 
                                   @attributes['addr:bearing']     ,
                                   @attributes['addr:street_name'] , 
                                   @attributes['addr:street_type'] 
                                  ].flatten.join(" ")

    @attributes['addr:street']=     [@attributes['addr:bearing']     ,
                                     @attributes['addr:street_name'] , 
                                     @attributes['addr:street_type'] 
                                    ].flatten.join(" ")
    

    @attributes['addr:city']=paddressa2[0]
    @attributes['addr:state']=paddressa2[1]
    @attributes['addr:postcode']=paddressa2[2]
    @attributes['addr:country']="US"



    function=@attributes['snco.us:lbcsfunction'].split("-")
    code=@attributes['snco.us:lbcsactivity'].split("-")

    @attributes['lbcs:activity:code']=code[0]
    @attributes['lbcs:activity:name']=code[1]
    @attributes['lbcs:function:code']=function[0]
    function[1]=function[1].sub('&','and')
    @attributes['lbcs:function:name']=function[1]
    
  end 
end


class GIS 
  
  def initialize()
    @properties=Array.new
  end
  
  def cache(street, url )
    local_filename="data/" + street

    if ! File.directory?("data")
      Dir.mkdir("data", 0700) #=> 0
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

  def get(url)
  end

  def process_prop(inprop)
    
    fields3 = Property::getfields()
    data= inprop['attributes']
    p = Property.new()
    fields3.each { |x|
      
      if data.include?(x)
        val = data[x]
        k = x.downcase
        k.sub(".","_")
        k = "snco.us:" + k         
        p.kv( k, val.to_s)
      else
        abort ("missing" + x)
      end  
    }
    geo= inprop['geometry']['rings'][0]
    geo.each { |x| p.addpoint(x[1],x[0]) }
    p.closeway
    p.cleanup
    @properties.push(p)

  end

  def lookup(street) 
    if @properties.include?(street)
      return @properties[street]
    end
    qry=URI::encode(street)
    srlatlong=4326
    fields3 = Property::getfields()
    fieldstr = CGI::escape(fields3.join(','))
    url = "http://gis.snco.us/ArcGIS/rest/services/Parcels/MapServer/0/query" \
    "?outFields=" + fieldstr +
      "&spatialRel=esriSpatialRelIntersects" \
    "&f=json" \
    "&outSR=" + srlatlong.to_s + "&where=PADDRESS%20LIKE%20%27%25" + qry + "%25%27&returnGeometry=true"    


    html = cache street,url

    json = JSON.parse(html)


    if json 
      if json.include?('features')
        json['features'].each{ |inprop|
#          warn "found : "
#          p inprop
          process_prop(inprop)
        }
      else
        warn "nothing for " + street + "\n"
        return nil
      end
    end

    return p
  end

  def osmxml (ios)
    ios.write ("<osm version=\"0.6\" >\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml(ios) 
    }
    ios.write ("</osm>\n")
  end

  def process (roads )

    found = 0
    roads.flatten.each { 
      |street|
      p= lookup( street)
    }
  end

  def simple (x)

    @properties.clear

    process([x])
    if (@properties.count > 1)
      p "found:" + x.to_s + " count: "+@properties.count.to_s
      f = File.open(x + ".osm", 'w') 
      osmxml(f)
    else
      p "no found :" + x 
    end
  end
  
end


g=GIS.new()

# g.simple('11th')
# g.simple('21st')
# g.simple('22nd')
# g.simple('SW 22nd PARK')
# g.simple('23nd')
# g.simple('32nd')
# g.simple('33nd')
# g.simple('39nd')
# g.simple('40nd')
# g.simple('Wanamaker')
# g.simple('Gage')
# g.simple('Burlingame')
# g.simple('Fairlawn')
# g.simple('Rochester')
# g.simple('Jackson')
# g.simple('Monroe')
# g.simple('42nd')
# g.simple('Eugene')
# g.simple('Brickyard')
# g.simple('Indian Hills')
# g.simple('Urish')
# g.simple ('STRAIT')
# g.simple ('Madison')
# g.simple ('32nd')
# g.simple ('42nd')
# g.simple ('57th')
# g.simple ('Kansas Ave')
# g.simple ('norris')
# g.simple ('NE US 24')
# g.simple ('NW US 24')
# g.simple ('Lower Silver Lake')
# g.simple ('Button')
# g.simple ('14th St')
# g.simple ('SE 53rd St')
# g.simple ('NE 53rd St')
# g.simple ('SW 53rd St')
# g.simple ('NW 53rd St')
# g.simple ('Furman')
# g.simple ('Auburn')
# g.simple ('25th')
# g.simple ('15th')
# g.simple ('12th')
# g.simple ('Moundview')
# g.simple ('Van Buren')
# g.simple ('Randolph')
# g.simple ('6th')
# g.simple ('Lane')
# g.simple ('Winfield')
# g.simple ('Lawrence')
# g.simple('1st')
# g.simple('SW 2nd')
# g.simple('SE 2nd')
# g.simple('NE 2nd')
# g.simple('NW 2nd')
# g.simple('3rd')
# g.simple('4th')
# g.simple('5th')
# g.simple('6th')
# g.simple('7th')
# g.simple('8th')
# g.simple('9th')
# g.simple('10th')
# g.simple('102 RD')
# g.simple('102nd ST')
# g.simple('105 LN')
# g.simple('106 RD')
# g.simple('106th ST')
# g.simple('10th ST')
# g.simple('110 RD')
# g.simple('110th ST')
# g.simple('114 RD')
# g.simple('114th ST')
# g.simple('118 CT')
# g.simple('118 RD')
# g.simple('118th RD')
# g.simple('11th ST')
# g.simple('122 RD')
# g.simple('122nd ST')
# g.simple('123rd LN')
# g.simple('124 RD')
# g.simple('126 RD')
# g.simple('126th ST')
# g.simple('1274')
# g.simple('130th ST')
# g.simple('134 RD')
# g.simple('134th ST')
# g.simple('13th ST')
# g.simple('142 RD')
# g.simple('142nd ST')
# g.simple('14th ST')
# g.simple('150 RD')
# g.simple('150th ST')
# g.simple('152 LN')
# g.simple('154 RD')
# g.simple('156 LN')
# g.simple('158 RD')
# g.simple('158th ST')
# g.simple('15th ST')
# g.simple('160 RD')
# g.simple('16185 N RD')
# g.simple('162 Nd ST')
# g.simple('162 RD')
# g.simple('162nd ST')
# g.simple('16311 N RD')
# g.simple('166 RD')
# g.simple('166th ST')
# g.simple('166th')
# g.simple('170 RD')
# g.simple('170th ST')
# g.simple('170th RD')
# g.simple('174 RD')
# g.simple('178 RD')
# g.simple('178th ST')
# g.simple('17th ST')
# g.simple('182 RD')
# g.simple('182nd ST')
# g.simple('186 RD')
# g.simple('1st N ST')
# g.simple('1st S ST')
# g.simple('1st ST')
# g.simple('21st ST')
# g.simple('22nd ST')
# g.simple('23rd CT')
# g.simple('27th ST')
# g.simple('28th ST')
# g.simple('2nd N ST')
# g.simple('2nd S ST')
# g.simple('2nd ST')
# g.simple('31st ST')
# g.simple('35th ST')
# g.simple('39th CT')
# g.simple('39th ST')
# g.simple('3rd S ST')
# g.simple('3rd ST')
# g.simple('40th TER')
# g.simple('42nd ST')
# g.simple('43rd ST')
# g.simple('46th ST')
# g.simple('48th ST')
# g.simple('4th N ST')
# g.simple('4th ST TER')
# g.simple('4th ST')
# g.simple('50th ST')
# g.simple('517 ST')
# g.simple('54th ST')
# g.simple('58th ST')
# g.simple('5th ST DR')
# g.simple('5th ST')
# g.simple('62nd ST TER')
# g.simple('66th ST')
# g.simple('6th N ST')
# g.simple('6th ST')
# g.simple('70th ST')
# g.simple('74th ST')
# g.simple('75th ST')
# g.simple('78th ST')
# g.simple('7th N ST')
# g.simple('7th ST')
# g.simple('81st ST')
# g.simple('86th ST')
# g.simple('8th ST')
# g.simple('90th ST')
# g.simple('94 RD')
# g.simple('94th ST')
# g.simple('94th RD')
# g.simple('98 RD')
# g.simple('9th N ST')
# g.simple('9th ST')
# g.simple('A ST')
# g.simple('A RD')
# g.simple('A4 RD')
# g.simple('Access RD')
# g.simple('Adams ST')
# g.simple('Adams')
# g.simple('Adrian ST')
# g.simple('Aiken Switch RD')
# g.simple('Allen RD')
# g.simple('Alma ST')
# g.simple('America City RD')
# g.simple('Anderson ST')
# g.simple('Anderson RD')
# g.simple('Annetta AVE')
# g.simple('Apache DR')
# g.simple('Apollo ST')
# g.simple('Aquarius ST')
# g.simple('Arvonia PL')
# g.simple('Ash ST')
# g.simple('Ashley CT')
# g.simple('B ST')
# g.simple('B RD')
# g.simple('Baker DR')
# g.simple('Bank AVE')
# g.simple('Barber RD')
# g.simple('Barnyard RD')
# g.simple('Barton RD')
# g.simple('Basswood CT')
# g.simple('Bays Water CIR')
# g.simple('Beach House RD')
# g.simple('Beaubein ST')
# g.simple('Becker AVE')
# g.simple('Berkshire DR')
# g.simple('Bidwell ST')
# g.simple('Birchwood CT')
# g.simple('Blackbird RD')
# g.simple('Blazingstar RD')
# g.simple('Blue Mound DR')
# g.simple('Blue Mound RD')
# g.simple('Bluff Creek RD')
# g.simple('Bodark RD')
# g.simple('Bouchey RD')
# g.simple('Bowser DR')
# g.simple('Bridge RD')
# g.simple('Brookwood Spur')
# g.simple('Buffalo AVE')
# g.simple('Burnett ST')
# g.simple('Butler RD')
# g.simple('C ST')
# g.simple('C RD')
# g.simple('C-1 ST')
# g.simple('C-2 ST')
# g.simple('C6 RD')
# g.simple('CIR DR')
# g.simple('CT CIR')
# g.simple('Cahill RD')
# g.simple('Camp Hammond')
# g.simple('Campbell ST')
# g.simple('Capper RD')
# g.simple('Case DR')
# g.simple('Cecil DR')
# g.simple('Cedar CT')
# g.simple('Cedar Crest')
# g.simple('Cedar LN')
# g.simple('Cedar Lake LN')
# g.simple('Center DR')
# g.simple('Center ST')
# g.simple('Central AVE')
# g.simple('Central ST')
# g.simple('Cheif DR')
# g.simple('Cherokee LN')
# g.simple('Chestnut ST')
# g.simple('Cheyenne Way')
# g.simple('Cheyenne RD')
# g.simple('Chicasha CIR')
# g.simple('Chicasha LN')
# g.simple('Chilson RD')
# g.simple('Choctaw CT')
# g.simple('Christy RD')
# g.simple('Clark RD')
# g.simple('Clay ST')
# g.simple('Cliff DR')
# g.simple('Coachlight DR')
# g.simple('Coal ST')
# g.simple('Coberly LN')
# g.simple('Coleman CT')
# g.simple('Commanche RD')
# g.simple('Commercial ST')
# g.simple('Condray ST')
# g.simple('Correction RD')
# g.simple('Cortez CT')
# g.simple('Cottonwood CT')
# g.simple('Cottonwood LN')
# g.simple('Country Breeze')
# g.simple('Coyote AVE')
# g.simple('Crawford RD')
# g.simple('Creek DR')
# g.simple('Crescent Rim DR')
# g.simple('Cross Creek AVE')
# g.simple('Cross Creek RD')
# g.simple('Crystal Springs RD')
# g.simple('D4 RD')
# g.simple('Darling ST') 
# g.simple('Darling RD')
# g.simple('David ST')
# g.simple('Dawson ST')
# g.simple('Decatur RD')
# g.simple('Dee DR')
# g.simple('Deer Creek Trail')
# g.simple('Deer Trail LN')
# g.simple('Delaware DR')
# g.simple('Delia AVE')
# g.simple('Delia RD')
# g.simple('Detlor RD')
# g.simple('Diamond RD')
# g.simple('Dickinson RD')
# g.simple('Docking RD')
# g.simple('Doniphan RD')
# g.simple('Donna CIR')
# g.simple('Douglas RD')
# g.simple('Dowling ST')
# g.simple('Doyle Creek RD')
# g.simple('Dragoon Creek RD')
# g.simple('Drew ST')
# g.simple('Durink ST')
# g.simple('E 100 RD')
# g.simple('E 100 RD')
# g.simple('E 10th ST')
# g.simple('E 113th ST')
# g.simple('E 117th ST')
# g.simple('E 11th ST')
# g.simple('E 121st ST')
# g.simple('E 125th ST')
# g.simple('E 126 RD')
# g.simple('E 129th ST')
# g.simple('E 133rd ST')
# g.simple('E 133rd RD')
# g.simple('E 137th ST')
# g.simple('E 141st ST')
# g.simple('E 141st RD')
# g.simple('E 141st')
# g.simple('E 150 RD')
# g.simple('E 150 RD')
# g.simple('E 175 RD')
# g.simple('E 1st ST')
# g.simple('E 200 RD')
# g.simple('E 225 RD')
# g.simple('E 226 RD')
# g.simple('E 250 RD')
# g.simple('E 2nd ST')
# g.simple('E 2nd TER')
# g.simple('E 3rd ST')
# g.simple('E 4th ST')
# g.simple('E 50 RD')
# g.simple('E 50 RD')
# g.simple('E 56 RD')
# g.simple('E 5th ST')
# g.simple('E 78 RD')
# g.simple('E 8th ST')
# g.simple('E 9th ST')
# g.simple('E Adrian ST')
# g.simple('E Bertrand ST')
# g.simple('E Clark ST')
# g.simple('E Front ST')
# g.simple('E James ST')
# g.simple('E Jones ST')
# g.simple('E Lake ST')
# g.simple('E Lasley ST')
# g.simple('E Main ST')
# g.simple('E Mercury ST')
# g.simple('E Mission ST')
# g.simple('E Palmer ST')
# g.simple('E Perry ST')
# g.simple('E Pottawatomie ST')
# g.simple('E RailRD ST')
# g.simple('E Rice CT')
# g.simple('E Valley Springs RD')
# g.simple('E Wind LN')
# g.simple('E Wyandotte ST')
# g.simple('E200 RD')
# g.simple('Eagle ST')
# g.simple('Echo Cliff LN')
# g.simple('Echo Cliff RD')
# g.simple('Edna ST')
# g.simple('Edwards RD')
# g.simple('Eight Mile RD')
# g.simple('Ellsworth RD')
# g.simple('Ellsworths RD')
# g.simple('Elm ST')
# g.simple('Emmett ST')
# g.simple('Emmett RD')
# g.simple('England RD')
# g.simple('Evergreen DR')
# g.simple('Expocentre DR')
# g.simple('Fairway DR')
# g.simple('Falcon CT')
# g.simple('Fern DR')
# g.simple('Fern Hill DR')
# g.simple('Fibs DR')
# g.simple('Fitzsimmons ST')
# g.simple('Fowler AVE')
# g.simple('Fowler ST')
# g.simple('Franklin ST')
# g.simple('Frontage RD 2')
# g.simple('Frontage RD')
# g.simple('Frontier CT')
# g.simple('Gailand RD')
# g.simple('Garfield PARK')
# g.simple('Garrett DR')
# g.simple('Gate')
# g.simple('Geary RD')
# g.simple('Gemini ST')
# g.simple('Gilkerson ST')
# g.simple('Glacier RD')
# g.simple('Gladden RD')
# g.simple('Gold Finch RD')
# g.simple('Golden ST')
# g.simple('Goldenrod AVE')
# g.simple('Gookins RD')
# g.simple('Governor')
# g.simple('Grand AVE')
# g.simple('Grandview CT')
# g.simple('Green ST')
# g.simple('Greenview DR')
# g.simple('Griswold CT')
# g.simple('Griswold ST')
# g.simple('H4 RD')
# g.simple('H6 RD')
# g.simple('HWY 40 Old')
# g.simple('Hackberry RD')
# g.simple('Haines DR')
# g.simple('Hale LN')
# g.simple('Hamilton PARKway')
# g.simple('Hamilton RD')
# g.simple('Harper LN')
# g.simple('Harrison CT')
# g.simple('Harrison ST')
# g.simple('Harveyville RD')
# g.simple('Hawk RD')
# g.simple('Headwaters RD')
# g.simple('Heartland PARK Raceway')
# g.simple('Heck CT')
# g.simple('Henderson DR')
# g.simple('Henderson LN')
# g.simple('Hesse RD')
# g.simple('Hickory Point RD')
# g.simple('Higbee RD')
# g.simple('Highland AVE')
# g.simple('Highview RD')
# g.simple('Hillcrest DR')
# g.simple('Hilldale RD N')
# g.simple('Hilldale RD S')
# g.simple('Hilltop RD')
# g.simple('Hoch RD')
# g.simple('Hodges RD')
# g.simple('Holden ST')
# g.simple('Holy Cross RD')
# g.simple('Holy LN')
# g.simple('Huffman ST')
# g.simple('Hug DR')
# g.simple('Humphrey RD')
# g.simple('Indian Valley LN')
# g.simple('Jackson AVE')
# g.simple('Jackson ST')
# g.simple('James ST')
# g.simple('Jefferson ST')
# g.simple('Jeffrey RD')
# g.simple('Jess Willard RD')
# g.simple('Jesuit CT')
# g.simple('Jesuit LN')
# g.simple('Jones DR')
# g.simple('Jordan RD')
# g.simple('Judy LN')
# g.simple('KTA Maintence RD')
# g.simple('Kansa DR')
# g.simple('Kansas AVE')
# g.simple('Kansas DR')
# g.simple('Kansas Turnpike')
# g.simple('Karon LN')
# g.simple('Kaw LN')
# g.simple('Kaw RD')
# g.simple('Keene RD')
# g.simple('Kellogg LN')
# g.simple('Kennys CT')
# g.simple('Kevin ST')
# g.simple('Kimberly DR')
# g.simple('Kimberly RD')
# g.simple('King RD')
# g.simple('Kingman DR')
# g.simple('Kingston RD')
# g.simple('Kiowa DR')
# g.simple('Kiowa')
# g.simple('Kling CT')
# g.simple('Knoll CT')
# g.simple('Koa RD')
# g.simple('Kross CIR')
# g.simple('L4 LN')
# g.simple('Lake Ridge DR')
# g.simple('Lake Ridge PARKway')
# g.simple('Lake Shawnee Trail')
# g.simple('Lake RD')
# g.simple('Lakeland DR')
# g.simple('Lakeview CT')
# g.simple('Lakeview RD')
# g.simple('Lakewood TER')
# g.simple('Lamr AVE')
# g.simple('Lana DR')
# g.simple('Landon Nature Trail')
# g.simple('Landon Nature Trail;Shunga Trail')
# g.simple('Landon RD')
# g.simple('Laswell ST')
# g.simple('Lawrence ST')
# g.simple('Leeve Trail')
# g.simple('Leisure LN')
# g.simple('Levee Trail')

# g.simple('NE Lincoln')
# g.simple('NW Lincoln')
# g.simple('SE Lincoln')

# x = 1
# while x < 10 do
#   g.simple( x.to_s + ' SW Lincoln St')
#   x =  x+1
# end

# g.simple('Linn ST')
# g.simple('Locust ST')
# g.simple('Loyola CIR')
# g.simple('Lull ST')
# g.simple('Luttig DR')
# g.simple('Lyter CT')
# g.simple('M RD')
# g.simple('Madore ST')
# g.simple('Madrid CT')
# g.simple('Main ST')
# g.simple('Maple CT')
# g.simple('Maple Hill RD')
# g.simple('Maple ST')
# g.simple('Mariner ST')
# g.simple('Marion ST')
# g.simple('Market ST')
# g.simple('Martin CT')
# g.simple('Masche ST')
# g.simple('Massasoit RD')
# g.simple('Massey')
# g.simple('Maverick LN')
# g.simple('McKeage AVE')
# g.simple('McMahan DR')
# g.simple('Meadowlark LN')
# g.simple('Melody CT')
# g.simple('Melody LN')
# g.simple('Meriden RD')
# g.simple('Metropolitan Topeka Airport Authority')
# g.simple('Miami LN')
# g.simple('Michael CT')
# g.simple('Mike O Vince RD')
# g.simple('Miller ST')
# g.simple('Milton CT')
# g.simple('Milton ST')
# g.simple('Mission ST')
# g.simple('Mission Valley RD')
# g.simple('Mount Calvary RD')
# g.simple('Moyland RD')
# g.simple('Mulvane Farm')
# g.simple('Murphy LN')
# g.simple('Mustang CT')
# g.simple('N 1000 RD')
# g.simple('N 1150 RD')
# g.simple('N 1200 RD')
# g.simple('N 1250 RD')
# g.simple('N 1300 RD')
# g.simple('N 1400 RD')
# g.simple('N 1500 RD')
# g.simple('N 1537 RD')
# g.simple('N 1570 RD')
# g.simple('N 1600 RD')
# g.simple('N 1600 RD')
# g.simple('N 1700 RD')
# g.simple('N 1900 RD')
# g.simple('N 1st ST')
# g.simple('N 2000 RD')
# g.simple('N 2040 RD')
# g.simple('N 2050 RD')
# g.simple('N 2064 RD')
# g.simple('N 2100 RD')
# g.simple('N 2100 RD')
# g.simple('N 2150 RD')
# g.simple('N 2175 RD')
# g.simple('N 2190 RD')
# g.simple('N 2nd ST')
# g.simple('N 3rd ST')
# g.simple('N 4th ST')
# g.simple('N 5th ST')
# g.simple('N 600 RD')
# g.simple('N 6th ST')
# g.simple('N 700 RD')
# g.simple('N 7th ST')
# g.simple('N 800 RD')
# g.simple('N 800 RD')
# g.simple('N 825 RD')
# g.simple('N 850 RD')
# g.simple('N 850 RD')
# g.simple('N 851 Diagonal RD')
# g.simple('N 8th ST')
# g.simple('N 900 RD')
# g.simple('N 950 RD')
# g.simple('N 9th ST')
# g.simple('N Cedar RD')
# g.simple('N Commercial ST')
# g.simple('N Eern AVE')
# g.simple('N Elvira ST')
# g.simple('N Franklin ST')
# g.simple('N Hanover ST')
# g.simple('N Harrison ST')
# g.simple('N Kansas AVE')
# g.simple('N Kansas ST')
# g.simple('N Masche ST')
# g.simple('N Miller ST')
# g.simple('N Milton CT')
# g.simple('N Milton ST')
# g.simple('N Norris ST')
# g.simple('N Owen ST')
# g.simple('N Palmberg ST')
# g.simple('N School ST')
# g.simple('N Topeka BLVD')
# g.simple('N Washington ST')
# g.simple('NE 31st ST')
# g.simple('NE 35th ST')
# g.simple('NE 36th ST')
# g.simple('NE 36th TER')
# g.simple('NE 37th ST')
# g.simple('NE 37th TER')
# g.simple('NE 38th ST')
# g.simple('NE 39th ST')
# g.simple('NE 42nd ST')
# g.simple('NE 43rd ST')
# g.simple('NE 46th ST')
# g.simple('NE 46th TER')
# g.simple('NE 50th ST')
# g.simple('NE 54th ST')
# g.simple('NE 56th ST')
# g.simple('NE 58th ST')
# g.simple('NE 59th ST')
# g.simple('NE 59th TER')
# g.simple('NE 60th ST')
# g.simple('NE 60th TER')
# g.simple('NE 62nd ST')
# g.simple('NE 64th ST')
# g.simple('NE 66th ST')
# g.simple('NE 70th ST')
# g.simple('NE 74th ST')
# g.simple('NE 78th ST')
# g.simple('NE 82nd ST')
# g.simple('NE 86th ST')
# g.simple('NE 92nd ST')
# g.simple('NE Aberdeen DR')
# g.simple('NE Adams ST')
# g.simple('NE Applewood DR')
# g.simple('NE Arter AVE')
# g.simple('NE Ashby LN')
# g.simple('NE Aspen LN')
# g.simple('NE Atchison AVE')
# g.simple('NE Atteberry DR')
# g.simple('NE B AVE')
# g.simple('NE Baldwin RD')
# g.simple('NE Belmont AVE')
# g.simple('NE Branner ST')
# g.simple('NE Brian RD')
# g.simple('NE Brier RD')
# g.simple('NE Brown RD')
# g.simple('NE Burchwood DR')
# g.simple('NE Burgess CT')
# g.simple('NE Burgess ST')
# g.simple('NE Calhoun Bluff LN')
# g.simple('NE Calhoun Bluff TER')
# g.simple('NE Calhoun Bluff RD')
# g.simple('NE Canyon DR')
# g.simple('NE Center AVE')
# g.simple('NE Chandler ST')
# g.simple('NE Chester AVE')
# g.simple('NE Chester DR')
# g.simple('NE Coachlight DR')
# g.simple('NE Collier RD')
# g.simple('NE Crane ST')
# g.simple('NE Croco RD')
# g.simple('NE Curtis ST')
# g.simple('NE Division ST')
# g.simple('NE Dogwood LN')
# g.simple('NE Doran AVE')
# g.simple('NE Downs RD')
# g.simple('NE Early CT')
# g.simple('NE Edgewood DR')
# g.simple('NE Emmett ST')
# g.simple('NE F RD')
# g.simple('NE Fairchild ST')
# g.simple('NE Fairview DR')
# g.simple('NE Fantine ST')
# g.simple('NE Florence AVE')
# g.simple('NE Forest AVE')
# g.simple('NE Forest DR')
# g.simple('NE Freeman AVE')
# g.simple('NE Getty ST')
# g.simple('NE Golden AVE')
# g.simple('NE Goldwater RD')
# g.simple('NE Goodell RD')
# g.simple('NE Gordon ST')
# g.simple('NE Grant ST')
# g.simple('NE Grantville RD')
# g.simple('NE Grattan ST')
# g.simple('NE Greeley ST')
# g.simple('NE Green ST')
# g.simple('NE Happy Hollow PL')
# g.simple('NE Happy Hollow RD')
# g.simple('NE Herschell RD')
# g.simple('NE Hilltop DR')
# g.simple('NE Holman ST')
# g.simple('NE Independence AVE')
# g.simple('NE Independence CT')
# g.simple('NE Indian Creek RD')
# g.simple('NE Jefferson ST')
# g.simple('NE Jefferson Trafficway')
# g.simple('NE Kansa Trail')
# g.simple('NE Kaw ST')
# g.simple('NE Kaw Valley School RD')
# g.simple('NE Kaw Valley RD')
# g.simple('NE Kellam AVE')
# g.simple('NE Kendall Wood DR')
# g.simple('NE Kendall Wood LN')
# g.simple('NE Kendall Wood PL')
# g.simple('NE Kimball RD')
# g.simple('NE Kincaid RD')
# g.simple('NE Knoll DR')
# g.simple('NE Kriepe RD')
# g.simple('NE LN')
# g.simple('NE Lake ST')
# g.simple('NE Laurent ST')
# g.simple('NE Liggett LN')
# g.simple('NE Lime ST')
# g.simple('NE Loma CT')
# g.simple('NE Lyman CT')
# g.simple('NE Lyman RD')
# g.simple('NE Madison ST')
# g.simple('NE Maple AVE')
# g.simple('NE Maple ST')
# g.simple('NE Margo CT')
# g.simple('NE Marple CT')
# g.simple('NE Marple DR')
# g.simple('NE Marple RD')
# g.simple('NE Meriden RD')
# g.simple('NE Michigan AVE')
# g.simple('NE Michigan')
# g.simple('NE Miller CT')
# g.simple('NE Mimosa LN')
# g.simple('NE Monhollon DR')
# g.simple('NE Monroe ST')
# g.simple('NE Morse ST')
# g.simple('NE Mtaa-Billard')
# g.simple('NE N AVE')
# g.simple('NE NE Collier RD')
# g.simple('NE Norris ST')
# g.simple('NE Norwood ST')
# g.simple('NE Oak CT')
# g.simple('NE Oak LN')
# g.simple('NE Oakland AVE')
# g.simple('NE Oakwood DR')
# g.simple('NE Ohio AVE')
# g.simple('NE Old Meriden RD')
# g.simple('NE Olympia ST')
# g.simple('NE Paramore ST')
# g.simple('NE Pine LN')
# g.simple('NE Pleasant Hill CT')
# g.simple('NE Pleasant Hills RD')
# g.simple('NE Poplar ST')
# g.simple('NE Porubsky DR')
# g.simple('NE Quincy ST')
# g.simple('NE Rice RD')
# g.simple('NE River RD')
# g.simple('NE Riverside AVE')
# g.simple('NE Riverview RD')
# g.simple('NE Rockaway Trail')
# g.simple('NE Rosewood TER')
# g.simple('NE Rowley ST')
# g.simple('NE Russ AVE')
# g.simple('NE Saint John ST')
# g.simple('NE Sardou AVE')
# g.simple('NE Sardou ST')
# g.simple('NE Scotland AVE')
# g.simple('NE Seward AVE')
# g.simple('NE Sewer Plant DR')
# g.simple('NE Shadden RD')
# g.simple('NE Shaffer RD')
# g.simple('NE Sherman RD')
# g.simple('NE Shuler AVE')
# g.simple('NE Silver RD')
# g.simple('NE Soldier ST')
# g.simple('NE Spring Creek DR')
# g.simple('NE Spruce LN')
# g.simple('NE State ST')
# g.simple('NE Strait AVE')
# g.simple('NE Sumner ST')
# g.simple('NE Susie CT')
# g.simple('NE Tahoe DR')
# g.simple('NE Tantara DR')
# g.simple('NE Tantara RD')
# g.simple('NE Thomas St.')
# g.simple('NE Trenton ST')
# g.simple('NE Twiss AVE')
# g.simple('NE Wabash AVE')
# g.simple('NE Wallace LN')
# g.simple('NE Walnut Grove DR')
# g.simple('NE Wenonah RD')
# g.simple('NE Whiteside DR')
# g.simple('NE Widigan RD')
# g.simple('NE Wilson AVE')
# g.simple('NE Winfield AVE')
# g.simple('NE Woodruff AVE')
# g.simple('NW 102 RD')
# g.simple('NW 102nd RD')
# g.simple('NW 118th RD')
# g.simple('NW 13th ST')
# g.simple('NW 14th ST')
# g.simple('NW 15th ST')
# g.simple('NW 16th ST')
# g.simple('NW 17th ST')
# g.simple('NW 18th ST')
# g.simple('NW 1st ST')
# g.simple('NW 20th ST')
# g.simple('NW 21st ST')
# g.simple('NW 23rd ST')
# g.simple('NW 24th ST')
# g.simple('NW 25th PL')
# g.simple('NW 25th ST')
# g.simple('NW 31st ST')
# g.simple('NW 32nd ST')
# g.simple('NW 33rd PL')
# g.simple('NW 33rd ST')
# g.simple('NW 33rd TER')
# g.simple('NW 34th CIR')
# g.simple('NW 34th CT')
# g.simple('NW 34th ST')
# g.simple('NW 35th ST')
# g.simple('NW 36th ST')
# g.simple('NW 36th TER')
# g.simple('NW 37th ST')
# g.simple('NW 37th TER')
# g.simple('NW 38 ST')
# g.simple('NW 38th TER')
# g.simple('NW 39th CT')
# g.simple('NW 39th ST')
# g.simple('NW 39th TER')
# g.simple('NW 3rd ST')
# g.simple('NW 40th ST')
# g.simple('NW 40th TER')
# g.simple('NW 42nd ST')
# g.simple('NW 42nd TER')
# g.simple('NW 43rd CT')
# g.simple('NW 43rd ST')
# g.simple('NW 43rd TER')
# g.simple('NW 44th CT')
# g.simple('NW 44th PL')
# g.simple('NW 44th ST')
# g.simple('NW 44th TER')
# g.simple('NW 45th CT')
# g.simple('NW 45th PL')
# g.simple('NW 45th TER')
# g.simple('NW 46th ST')
# g.simple('NW 46th TER')
# g.simple('NW 47th CT')
# g.simple('NW 47th ST')
# g.simple('NW 48th ST')
# g.simple('NW 48th TER')
# g.simple('NW 49th CT')
# g.simple('NW 49th ST')
# g.simple('NW 49th TER')
# g.simple('NW 4th ST')
# g.simple('NW 50th CT')
# g.simple('NW 50th ST')
# g.simple('NW 51st CT')
# g.simple('NW 51st TER')
# g.simple('NW 52nd ST')
# g.simple('NW 52nd TER')
# g.simple('NW 53rd TER')
# g.simple('NW 54th ST')
# g.simple('NW 56th ST')
# g.simple('NW 58th ST')
# g.simple('NW 59th TER')
# g.simple('NW 5th ST')
# g.simple('NW 60th PL')
# g.simple('NW 60th ST')
# g.simple('NW 62nd ST')
# g.simple('NW 62nd TER')
# g.simple('NW 63rd ST')
# g.simple('NW 65th ST')
# g.simple('NW 66th ST')
# g.simple('NW 6th ST')
# g.simple('NW 70th ST')
# g.simple('NW 72nd ST')
# g.simple('NW 74th ST')
# g.simple('NW 78th ST')
# g.simple('NW 79th ST')
# g.simple('NW 7th ST')
# g.simple('NW 82nd ST')
# g.simple('NW 86th ST')
# g.simple('NW 8th ST')
# g.simple('NW 90th ST')
# g.simple('NW 94th ST')
# g.simple('NW A RD')
# g.simple('NW Acorn PL')
# g.simple('NW Alice DR')
# g.simple('NW Anthony RD')
# g.simple('NW Apache Trail')
# g.simple('NW Apollo DR')
# g.simple('NW Arn RD')
# g.simple('NW Arroyo CT')
# g.simple('NW Arroyo DR')
# g.simple('NW Astor PARK DR')
# g.simple('NW Auburndale CT')
# g.simple('NW Austin AVE')
# g.simple('NW B DR')
# g.simple('NW B I S RD')
# g.simple('NW Bailey RD')
# g.simple('NW Beaumont CT')
# g.simple('NW Beaumont ST')
# g.simple('NW Beecher ST')
# g.simple('NW Belvoir CT')
# g.simple('NW Bent Tree LN')
# g.simple('NW Berwick ST')
# g.simple('NW Beverly ST')
# g.simple('NW Bitter Nut ST')
# g.simple('NW Blaine AVE')
# g.simple('NW Bowery ST')
# g.simple('NW Boyd RD')
# g.simple('NW Brickyard RD')
# g.simple('NW Brittany LN')
# g.simple('NW Brittany N CIR')
# g.simple('NW Brittany PL')
# g.simple('NW Brittany S CIR')
# g.simple('NW BRD ST')
# g.simple('NW BRDmoor AVE')
# g.simple('NW Brown DR')
# g.simple('NW Buchanan ST')
# g.simple('NW Burkdoll CT')
# g.simple('NW Button PL')
# g.simple('NW Button RD')
# g.simple('NW C RD')
# g.simple('NW CIR ST')
# g.simple('NW CTland AVE')
# g.simple('NW CTland DR')
# g.simple('NW Cambridge AVE')
# g.simple('NW Camden LN')
# g.simple('NW Capital View DR')
# g.simple('NW Capital View TER')
# g.simple('NW Capper RD')
# g.simple('NW Caravan Mhp')
# g.simple('NW Cardinal DR')
# g.simple('NW Carlson RD')
# g.simple('NW Carter RD')
# g.simple('NW Carver RD')
# g.simple('NW Cayuse Trail')
# g.simple('NW Central AVE')
# g.simple('NW Cherry Creek DR')
# g.simple('NW Cherry Creek TER')
# g.simple('NW Church LN')
# g.simple('NW Clay ST')
# g.simple('NW Cloverleaf DR')
# g.simple('NW Cortland AVE')
# g.simple('NW Country LN')
# g.simple('NW Country PARK DR')
# g.simple('NW Countryside RD')
# g.simple('NW Crane ST')
# g.simple('NW Crawford RD')
# g.simple('NW Cross ST')
# g.simple('NW Curtis ST')
# g.simple('NW Cycle AVE')
# g.simple('NW D RD')
# g.simple('NW Daisy DR')
# g.simple('NW Davis RD')
# g.simple('NW Dawdy CT')
# g.simple('NW Dawdy DR')
# g.simple('NW Deerborn ST')
# g.simple('NW Derby DR')
# g.simple('NW Docking RD')
# g.simple('NW Doggie DR')
# g.simple('NW Dondee LN')
# g.simple('NW Dorn LN')
# g.simple('NW Douglas RD')
# g.simple('NW Dowdy DR')
# g.simple('NW E RD')
# g.simple('NW Elm Row AVE')
# g.simple('NW Elmont RD')
# g.simple('NW Elmwood AVE')
# g.simple('NW Eric DR')
# g.simple('NW Eugene ST')
# g.simple('NW Evelyn ST')
# g.simple('NW F RD')
# g.simple('NW Fairchild ST')
# g.simple('NW Fairmont ST')
# g.simple('NW Fielding PL')
# g.simple('NW Fielding TER')
# g.simple('NW Fielding RD')
# g.simple('NW Fillmore ST')
# g.simple('NW Finch LN')
# g.simple('NW Forbes RD')
# g.simple('NW Franklin AVE')
# g.simple('NW Fredith LN')
# g.simple('NW Fredith RD')
# g.simple('NW Frontage RD')
# g.simple('NW Furman RD')
# g.simple('NW Gage BLVD')
# g.simple('NW Gemini CT')
# g.simple('NW Geronimo Trail')
# g.simple('NW Gibbys LN')
# g.simple('NW Gibson ST')
# g.simple('NW Glenwood DR')
# g.simple('NW Glick RD')
# g.simple('NW Goodyear Plant RD')
# g.simple('NW Goodyear RD')
# g.simple('NW Gordon ST')
# g.simple('NW Grant ST')
# g.simple('NW Gravy Train LN')
# g.simple('NW Graybeal CT')
# g.simple('NW Green Hills PL')
# g.simple('NW Green Hills RD')
# g.simple('NW Greenwood CT')
# g.simple('NW Gregg ST')
# g.simple('NW Grove AVE')
# g.simple('NW Guden ST')
# g.simple('NW Half Day LN')
# g.simple('NW Half Moon CT')
# g.simple('NW Halfday PL')
# g.simple('NW Hall RD')
# g.simple('NW Hamilton LN')
# g.simple('NW Hardt AVE')
# g.simple('NW Hardt ST')
# g.simple('NW Harold CT')
# g.simple('NW Harrison ST')
# g.simple('NW Haven RD')
# g.simple('NW Hawthorne ST')
# g.simple('NW Heath RD')
# g.simple('NW Hentig AVE')
# g.simple('NW Hiawatha PL')
# g.simple('NW Hickory Ridge LN')
# g.simple('NW High Point DR')
# g.simple('NW Hill ST')
# g.simple('NW Hoch RD')
# g.simple('NW Hodges RD')
# g.simple('NW Holman ST')
# g.simple('NW Howard ST')
# g.simple('NW Humphrey RD')
# g.simple('NW Hunter DR')
# g.simple('NW Hunter RD')
# g.simple('NW Hunters Ridge CIR')
# g.simple('NW Hunters Ridge DR')
# g.simple('NW Hunters Ridge TER')
# g.simple('NW Huxman RD')
# g.simple('NW Independence AVE')
# g.simple('NW Industrial Tfwy')
# g.simple('NW Jackson ST')
# g.simple('NW Jay ST')
# g.simple('NW Jennings RD')
# g.simple('NW Kelshar DR')
# g.simple('NW Kendall AVE')
# g.simple('NW Kendall CT')
# g.simple('NW Kendall DR')
# g.simple('NW Kingsway CIR')
# g.simple('NW Kiro CT')
# g.simple('NW Kling CT')
# g.simple('NW Knox AVE')
# g.simple('NW Krysten ST')
# g.simple('NW LN ST')
# g.simple('NW Lakeview RD')
# g.simple('NW Lana CT')
# g.simple('NW Landon RD')
# g.simple('NW Laurent ST')
# g.simple('NW Lee DR')
# g.simple('NW Leedy RD')
# g.simple('NW Levering DR')
# g.simple('NW Lewis ST')
# g.simple('NW Lin CT')
# g.simple('NW Lincoln ST')
# g.simple('NW Lindenwood AVE')
# g.simple('NW Linwood CIR')
# g.simple('NW Linwood DR')
# g.simple('NW Logan ST')
# g.simple('NW Lookout CT')
# g.simple('NW Lookout RD')
# g.simple('NW Louise ST')
# g.simple('NW Lower Silver Lake RD')
# g.simple('NW Lowry LN')
# g.simple('NW Lyman RD')
# g.simple('NW Mac RD')
# g.simple('NW Macvicar AVE')
# g.simple('NW Macvictor AVE')
# g.simple('NW Mandell RD')
# g.simple('NW Manspeaker ST')
# g.simple('NW Maple Hill RD')
# g.simple('NW Mariah ST')
# g.simple('NW Meadowbrook CT')
# g.simple('NW Meadowcrest RD')
# g.simple('NW Melba DR CT')
# g.simple('NW Melba DR')
# g.simple('NW Menninger RD')
# g.simple('NW Menoken RD')
# g.simple('NW Mesa CT')
# g.simple('NW Mission RD')
# g.simple('NW Morley CT')
# g.simple('NW Morley RD')
# g.simple('NW Morse ST')
# g.simple('NW Moundview CT')
# g.simple('NW Moundview DR')
# g.simple('NW Myrtle AVE')
# g.simple('NW N Hills DR')
# g.simple('NW N Pointe DR')
# g.simple('NW N Pointe TER')
# g.simple('NW Nboro DR')
# g.simple('NW Netherland DR')
# g.simple('NW Nickell RD')
# g.simple('NW Norris ST')
# g.simple('NW Oak View DR')
# g.simple('NW Oakley AVE')
# g.simple('NW Oakview DR')
# g.simple('NW Old Indianola RD')
# g.simple('NW Oldham RD')
# g.simple('NW Page LN')
# g.simple('NW Paramore ST')
# g.simple('NW Perry RD')
# g.simple('NW Pipkin RD')
# g.simple('NW Pleasant Hill LN')
# g.simple('NW Pocahontas DR')
# g.simple('NW Polk ST')
# g.simple('NW Porta DR')
# g.simple('NW Pottawatomie RD')
# g.simple('NW Proctor ST')
# g.simple('NW Pueblo CT')
# g.simple('NW Quinton AVE')
# g.simple('NW RailRD AVE')
# g.simple('NW Ramblewood CIR')
# g.simple('NW Redwood DR')
# g.simple('NW Reo ST')
# g.simple('NW Ridgeview RD')
# g.simple('NW Ridgeway CT')
# g.simple('NW Ridgewood DR')
# g.simple('NW Rochester RD')
# g.simple('NW Roosevelt ST')
# g.simple('NW Rose ST')
# g.simple('NW Ross ST')
# g.simple('NW Rossville RD')
# g.simple('NW Saint John ST')
# g.simple('NW Saline ST')
# g.simple('NW Sanford LN')
# g.simple('NW Schaller CT')
# g.simple('NW Seaman ST')
# g.simple('NW Shawna DR')
# g.simple('NW Shorey CT')
# g.simple('NW Shorey PL')
# g.simple('NW Silverstone RD')
# g.simple('NW Sioux LN')
# g.simple('NW Spring Creek DR')
# g.simple('NW Sproatan LN')
# g.simple('NW Sproaton LN')
# g.simple('NW Starlight CIR')
# g.simple('NW Starlite LN')
# g.simple('NW Sterling Chase CT')
# g.simple('NW Sterling Chase DR')
# g.simple('NW Sterling DR')
# g.simple('NW Stinson RD')
# g.simple('NW Story ST')
# g.simple('NW Studer ST')
# g.simple('NW Sugar Creek Ridge DR')
# g.simple('NW Sugar Creek Ridge')
# g.simple('NW Sun Valley RD')
# g.simple('NW Sunny Knoll RD')
# g.simple('NW Sunset LN')
# g.simple('NW Tamblyn TER')
# g.simple('NW Taylor ST')
# g.simple('NW Thomas RD')
# g.simple('NW Tibbs RD')
# g.simple('NW Timber CT')
# g.simple('NW Timber Edge DR')
# g.simple('NW Tower RD')
# g.simple('NW Tyler CT')
# g.simple('NW Tyler ST')
# g.simple('NW Union CT')
# g.simple('NW Vail AVE')
# g.simple('NW Vail CT')
# g.simple('NW Valencia RD')
# g.simple('NW Valley RD')
# g.simple('NW Van Buren ST')
# g.simple('NW W ST')
# g.simple('NW W Union RD')
# g.simple('NW Waddell ST')
# g.simple('NW Waite ST')
# g.simple('NW Walker AVE')
# g.simple('NW Walnut Grove DR')
# g.simple('NW Walnut LN')
# g.simple('NW Walnut RD')
# g.simple('NW Washington AVE')
# g.simple('NW Water Works DR')
# g.simple('NW Wbrooke DR')
# g.simple('NW Wendel RD')
# g.simple('NW Wern AVE')
# g.simple('NW Wgate RD')
# g.simple('NW Whispering LN')
# g.simple('NW Wilcox CT')
# g.simple('NW Wilder RD')
# g.simple('NW Williams ST')
# g.simple('NW Wilson RD')
# g.simple('NW Winter ST')
# g.simple('NW Woodland CIR')
# g.simple('NW Woodlawn AVE')
# g.simple('NW Wren LN')
# g.simple('NW the DR')
# g.simple('Nadeau RD')
# g.simple('Navajo DR')
# g.simple('Navarre ST')
# g.simple('Newell ST')
# g.simple('Newman LN')
# g.simple('Newman RD')
# g.simple('Nora AVE')
# g.simple('Nuzman CT')
# g.simple('O RD')
# g.simple('O4 RD')
# g.simple('Oak AVE')
# g.simple('Oak CT')
# g.simple('Oak DR')
# g.simple('Oak Ridge RD')
# g.simple('Oak ST')
# g.simple('Oakland Expressway')
# g.simple('Old HWY 24')
# g.simple('Old Hodges RD')
# g.simple('Old State HWY 92')
# g.simple('Old US HWY 24')
# g.simple('Olive ST')
# g.simple('Orange ST')
# g.simple('Oregon Trail RD')
# g.simple('Osage DR')
# g.simple('Osage ST')
# g.simple('Osborn ST')
# g.simple('Ottawa CT')
# g.simple('Otter LN')
# g.simple('Our Lady CIR')
# g.simple('Our Lady\'s CIR')
# g.simple('Owen ST')
# g.simple('P RD')
# g.simple('P4 RD')
# g.simple('PARK AVE')
#  g.simple('PARK DR')
# g.simple('PARK LN')
# g.simple('PARKway ST')
# g.simple('Pace DR')
# g.simple('Palmberg RD')
# g.simple('Palmer ST')
# g.simple('Pauls CIR')
# g.simple('Pawnee CT')
# g.simple('Pawnee DR')
#  g.simple('Pearl ST')
# g.simple('Perimeter RD')
# g.simple('Perry ST')
# g.simple('Pierce AVE')
# g.simple('Pierce ST')
# g.simple('Pine ST')
# g.simple('Pinto AVE')
# g.simple('Platte RD')
# g.simple('Pleasant Hill CT')
# g.simple('Pleasant View RD')
# g.simple('Poplar')
# g.simple('Porter ST')
# g.simple('Post Creek RD')
# g.simple('Post Creek')
# g.simple('Prairie AVE')
# g.simple('Prairie Falcon RD')
# g.simple('Prarie Bend CT')
# g.simple('Pratt ST')
# g.simple('Presbyterian Manor Access RD')
# g.simple('Proat RD')
# g.simple('Pueblo CIR')
# g.simple('Py RD')
# g.simple('Q RD')
# g.simple('Q4 RD')
# g.simple('Q5 RD')
# g.simple('Q6 RD')
# g.simple('Quaker RD')
# g.simple('Quial Hill DR')
# g.simple('Quincy ST')
# g.simple('Quinlan RD')
# g.simple('R RD')
# g.simple('R4 RD')
# g.simple('RailRD ST')
# g.simple('Ranch RD')
# g.simple('Redmaple DR')
# g.simple('Redwood DR')
# g.simple('Rezac RD')
# g.simple('Rice RD')
# g.simple('Richland RD')
# g.simple('Ridgeview DR')
# g.simple('Ridgeway ST')
# g.simple('Ridgeway')
# g.simple('River CT')
# g.simple('Riverside DR')
# g.simple('Riverview RD')
# g.simple('Robins DR')
# g.simple('Rock Creek DR')
# g.simple('Rock Creek RD')
# g.simple('Rock Island RD')
# g.simple('Rolyan RD')
# g.simple('Ross CT')
# g.simple('Ross RD')
# g.simple('Roth RD')
# g.simple('Ryan&apos;s TER')
# g.simple('Ryans Way')
# g.simple('S 1st ST')
# g.simple('S 2nd ST')
# g.simple('S 3rd ST')
# g.simple('S 45th ST')
# g.simple('S 4th ST')
# g.simple('S 5th ST')
# g.simple('S 6th ST')
# g.simple('S 7th ST')
# g.simple('S 9th ST')
# g.simple('S Adams RD')
# g.simple('S Auburn RD')
# g.simple('S Berryton RD')
# g.simple('S Boundary RD')
# g.simple('S Burlingame RD')
# g.simple('S CIR DR')
# g.simple('S California RD')
# g.simple('S Carlson RD')
# g.simple('S Crawford RD')
# g.simple('S Croco RD')
# g.simple('S Davis RD')
# g.simple('S Dawson ST')
# g.simple('S Docking RD')
# g.simple('S Eern AVE')
# g.simple('S Fairlawn RD')
# g.simple('S Glenside CT')
# g.simple('S Hoch RD')
# g.simple('S Indian Hills RD')
# g.simple('S Jordan RD')
# g.simple('S Kansas AVE')
# g.simple('S Kansas ST')
# g.simple('S Kansas')
# g.simple('S Lake RD')
# g.simple('S Lewelling RD')
# g.simple('S Morril RD')
# g.simple('S Norris ST')
# g.simple('S Owen ST')
# g.simple('S PARKway LN')
# g.simple('S Palmberg ST')
# g.simple('S Paulen RD')
# g.simple('S Ratner RD')
# g.simple('S Rice RD')
# g.simple('S ST')
# g.simple('S Shawnee Heights RD')
# g.simple('S Stanley RD')
# g.simple('S Stewart RD')
# g.simple('S Stubbs RD')
# g.simple('S Valencia RD')
# g.simple('S Vauter RD')
# g.simple('S Wanamaker RD')
# g.simple('S Woodring RD; E 1 RD')
# g.simple('S RD')
# g.simple('SE 1 S ST')
# g.simple('SE 101st ST')
# g.simple('SE 102nd ST')
# g.simple('SE 105th ST')
# g.simple('SE 109th ST')
# g.simple('SE 10th AVE')
# g.simple('SE 10th ST')
# g.simple('SE 11th CT')
# g.simple('SE 11th ST')
# g.simple('SE 11th TER')
# g.simple('SE 12th CT')
# g.simple('SE 12th ST')
# g.simple('SE 13th ST')
# g.simple('SE 14th ST')
# g.simple('SE 15th ST')
# g.simple('SE 16th ST')
# g.simple('SE 17th ST')
# g.simple('SE 18th ST')
# g.simple('SE 18th TER')
# g.simple('SE 19th ST')
# g.simple('SE 1st ST')
# g.simple('SE 20th ST')
# g.simple('SE 21st ST')
# g.simple('SE 21st TER')
# g.simple('SE 22nd ST')
# g.simple('SE 22nd TER')
# g.simple('SE 23rd ST')
# g.simple('SE 23rd TER')
# g.simple('SE 24th CT')
# g.simple('SE 24th PL')
# g.simple('SE 24th ST')
# g.simple('SE 24th TER')
# g.simple('SE 25th ST')
# g.simple('SE 25th TER')
# g.simple('SE 26th ST')
# g.simple('SE 26th TER')
# g.simple('SE 27th CT')
# g.simple('SE 27th ST')
# g.simple('SE 27th TER')
# g.simple('SE 28th CT')
# g.simple('SE 28th ST')
# g.simple('SE 28th TER')
# g.simple('SE 29th ST')
# g.simple('SE 29th TER')
# g.simple('SE 2nd ST')
# g.simple('SE 30th PARK')
# g.simple('SE 30th ST')
# g.simple('SE 30th TER')
# g.simple('SE 31st ST')
# g.simple('SE 32nd PL')
# g.simple('SE 32nd ST')
# g.simple('SE 32nd TER')
# g.simple('SE 33rd ST')
# g.simple('SE 33rd TER')
# g.simple('SE 34th ST')
# g.simple('SE 34th TER')
# g.simple('SE 35th CT')
# g.simple('SE 35th ST')
# g.simple('SE 35th TER')
# g.simple('SE 36th ST')
# g.simple('SE 36th TER')
# g.simple('SE 37th ST')
# g.simple('SE 37th TER')
# g.simple('SE 38th CIR')
# g.simple('SE 38th ST')
# g.simple('SE 38th TER')
# g.simple('SE 39th ST')
# g.simple('SE 3rd ST')
# g.simple('SE 3rd TER')
# g.simple('SE 40th ST')
# g.simple('SE 40th TER')
# g.simple('SE 41st ST')
# g.simple('SE 41st TER')
# g.simple('SE 42nd CT')
# g.simple('SE 42nd ST')
# g.simple('SE 42nd TER')
# g.simple('SE 43rd PL')
# g.simple('SE 43rd ST')
# g.simple('SE 43rd TER')
# g.simple('SE 44th CT')
# g.simple('SE 44th ST')
# g.simple('SE 44th TER')
# g.simple('SE 45th ST')
# g.simple('SE 45th TER')
# g.simple('SE 46th CT')
# g.simple('SE 46th ST')
# g.simple('SE 46th TER')
# g.simple('SE 47th ST TER')
# g.simple('SE 47th ST')
# g.simple('SE 49th ST')
# g.simple('SE 4th ST')
# g.simple('SE 4th TER')
# g.simple('SE 53rd ST')
# g.simple('SE 54th ST')
# g.simple('SE 55th ST')
# g.simple('SE 59th ST')
# g.simple('SE 5th ST')
# g.simple('SE 61st ST')
# g.simple('SE 69th ST')
# g.simple('SE 6th AVE')
# g.simple('SE 77th ST')
# g.simple('SE 7th ST')
# g.simple('SE 7th TER')
# g.simple('SE 85th ST')
# g.simple('SE 89th ST')
# g.simple('SE 8th AVE')
# g.simple('SE 8th ST')
# g.simple('SE 8th TER')
# g.simple('SE 93rd ST')
# g.simple('SE 97th ST')
# g.simple('SE 99th ST')
# g.simple('SE 9th ST')
# g.simple('SE A Island CIR')
# g.simple('SE Adams ST')
# g.simple('SE Alamar RD')
# g.simple('SE Alexander DR')
# g.simple('SE Alkire ST')
# g.simple('SE Allen CT')
# g.simple('SE Allen DR')
# g.simple('SE Anno DR')
# g.simple('SE Apache PL')
# g.simple('SE Applewood DR')
# g.simple('SE Aquarius DR')
# g.simple('SE Arapaho RD')
# g.simple('SE Arbor CT')
# g.simple('SE Arbor DR')
# g.simple('SE Aries AVE')
# g.simple('SE Arrowhead DR')
# g.simple('SE Arter AVE')
# g.simple('SE Ashley DR')
# g.simple('SE Aspen CT')
# g.simple('SE Athens CT')
# g.simple('SE Baldwin CT')
# g.simple('SE Baldwin ST')
# g.simple('SE Baldwin RD')
# g.simple('SE Bates RD')
# g.simple('SE Beach TER')
# g.simple('SE Behaze CT')
# g.simple('SE Bellview AVE')
# g.simple('SE Bennett DR')
# g.simple('SE Berryton RD')
# g.simple('SE Birch ST')
# g.simple('SE Blair CT')
# g.simple('SE Blair DR')
# g.simple('SE Bob Hertzen Way')
# g.simple('SE Brady ST')
# g.simple('SE Branner ST')
# g.simple('SE Branner Trafficway')
# g.simple('SE Branner Trfwy.')
# g.simple('SE Brock ST')
# g.simple('SE Brookside DR')
# g.simple('SE Bryant ST')
# g.simple('SE Buckeye ST')
# g.simple('SE Burr ST')
# g.simple('SE Burton ST')
# g.simple('SE C ST')
# g.simple('SE CIR DR S')
# g.simple('SE California AVE')
# g.simple('SE Camp Creek RD')
# g.simple('SE Capitol View CT')
# g.simple('SE Capricorn AVE')
# g.simple('SE Carnahan AVE')
# g.simple('SE Carnahan PL')
# g.simple('SE Carnahan ST')
# g.simple('SE Cedarwood DR')
# g.simple('SE Champions DR')
# g.simple('SE Chandler ST')
# g.simple('SE Chestnut ST')
# g.simple('SE Chippewa DR')
# g.simple('SE Clinton Wildlife RD')
# g.simple('SE Coachlight Village A DR')
# g.simple('SE Coachlight Village C DR')
# g.simple('SE Coachlight Village D DR')
# g.simple('SE Coachlight Village DR')
# g.simple('SE Coachlight Village E DR')
# g.simple('SE Coberly RD')
# g.simple('SE Colfax PL')
# g.simple('SE Colfax ST')
# g.simple('SE Colonial DR')
# g.simple('SE Colorado AVE')
# g.simple('SE Commanche DR')
# g.simple('SE Connie DR')
# g.simple('SE Consuelo RD')
# g.simple('SE Corinth CT')
# g.simple('SE Cottage AVE')
# g.simple('SE Cottonwood ST')
# g.simple('SE Coyote DR')
# g.simple('SE Crestwater DR')
# g.simple('SE Croco RD')
# g.simple('SE Cross ST')
# g.simple('SE Cunningham ST')
# g.simple('SE Cuvier DR')
# g.simple('SE Cyprus DR')
# g.simple('SE D ST')
# g.simple('SE Davies ST')
# g.simple('SE Deer Creek Tfwy')
# g.simple('SE Doane ST')
# g.simple('SE Dock DR')
# g.simple('SE Downing DR')
# g.simple('SE Downing RD')
# g.simple('SE Driftwood CT')
# g.simple('SE Dupont PL')
# g.simple('SE Dupont ST')
# g.simple('SE Dupont RD')
# g.simple('SE Dyre DR')
# g.simple('SE E Edge RD')
# g.simple('SE E ST')
# g.simple('SE Edgar RD')
# g.simple('SE Edison AVE')
# g.simple('SE Egate DR')
# g.simple('SE Elm Cove DR')
# g.simple('SE Elm ST')
# g.simple('SE Emerson ST')
# g.simple('SE Erica DR')
# g.simple('SE Evans DR')
# g.simple('SE Evening Tideway')
# g.simple('SE Eveningtide Way')
# g.simple('SE Fair Meadows PL')
# g.simple('SE Fairfax ST')
# g.simple('SE Fairfield CT')
# g.simple('SE Faxon CT')
# g.simple('SE Faxon DR')
# g.simple('SE Finish Line DR')
# g.simple('SE Flora CT')
# g.simple('SE Fremont ST')
# g.simple('SE Gabler ST')
# g.simple('SE Garden PARK CT')
# g.simple('SE Gary Ormsby DR')
# g.simple('SE Gemini AVE')
# g.simple('SE Gemini CT')
# g.simple('SE Gilmore AVE')
# g.simple('SE Gilmore CT')
# g.simple('SE Gilmore ST')
# g.simple('SE Girard ST')
# g.simple('SE Golden AVE')
# g.simple('SE Golf PARK BLVD')
# g.simple('SE Grand Oaks AVE')
# g.simple('SE Granger CT')
# g.simple('SE Granger ST')
# g.simple('SE Gray ST')
# g.simple('SE Green RD')
# g.simple('SE Greenfield CT')
# g.simple('SE Greenwood CT')
# g.simple('SE Gruber LN')
# g.simple('SE Hackberry CT')
# g.simple('SE Hackberry DR')
# g.simple('SE Hackberry ST')
# g.simple('SE Hancock ST')
# g.simple('SE Handcock ST')
# g.simple('SE Heathcliff DR')
# g.simple('SE Herschell RD')
# g.simple('SE High ST')
# g.simple('SE Highland AVE')
# g.simple('SE Highland CT')
# g.simple('SE Holiday ST')
# g.simple('SE Howard DR')
# g.simple('SE Howey RD')
# g.simple('SE Hudson BLVD')
# g.simple('SE Humboldt ST')
# g.simple('SE Hummer CT')
# g.simple('SE Idaho CT')
# g.simple('SE Illinois AVE')
# g.simple('SE Illinois ST')
# g.simple('SE Indiana AVE')
# g.simple('SE Iowa AVE')
# g.simple('SE Irvingham ST')
# g.simple('SE J ST')
# g.simple('SE Jane Way')
# g.simple('SE Jefferson ST')
# g.simple('SE Joey Chitwood DR')
# g.simple('SE John ST')
# g.simple('SE K ST')
# g.simple('SE Kansas PL')
# g.simple('SE Kellam AVE')
# g.simple('SE Kellam CT')
# g.simple('SE Kellam ST')
# g.simple('SE Kenny DR')
# g.simple('SE Kentucky AVE')
# g.simple('SE Kentucky CT')
# g.simple('SE Keystone AVE')
# g.simple('SE Klein ST')
# g.simple('SE Kouns ST')
# g.simple('SE Lafayette PL')
# g.simple('SE Lafayette ST')
# g.simple('SE Lake CT')
# g.simple('SE Lake DR')
# g.simple('SE Lake ST')
# g.simple('SE Lake TER')
# g.simple('SE Lakeridge CT')
# g.simple('SE Lakeshore BLVD')
# g.simple('SE Lakewood BLVD')
# g.simple('SE Lakewood CT')
# g.simple('SE Lakewood PL')
# g.simple('SE Lakewood ST')
# g.simple('SE Lamar ST')
# g.simple('SE Laurel RD')
# g.simple('SE Lawrence ST')
# g.simple('SE Leisure LN')
# g.simple('SE Leland ST')
# g.simple('SE Leo AVE')
# g.simple('SE Liberty ST')
# g.simple('SE Libra AVE')
# g.simple('SE Libra CT')
# g.simple('SE Lime ST')
# g.simple('SE Locust ST')
# g.simple('SE Long ST')
# g.simple('SE Lott ST')
# g.simple('SE Madison ST')
# g.simple('SE Magnolia LN')
# g.simple('SE Manitowac DR')
# g.simple('SE Manitowoc DR')
# g.simple('SE Mareta CIR')
# g.simple('SE Market ST')
# g.simple('SE Mars TER')
# g.simple('SE Maryland AVE')
# g.simple('SE Maryland CT')
# g.simple('SE Massachusetts AVE')
# g.simple('SE Massachusetts CT')
# g.simple('SE Matney RD')
# g.simple('SE McMahan CT')
# g.simple('SE Meadowview DR')
# g.simple('SE Memory Point')
# g.simple('SE Mercier ST')
# g.simple('SE Mercury AVE')
# g.simple('SE Mercury CT')
# g.simple('SE Michigan AVE')
# g.simple('SE Michigan ST')
# g.simple('SE Minnesota AVE')
# g.simple('SE Monroe ST')
# g.simple('SE Moorefield CT')
# g.simple('SE Morrison ST')
# g.simple('SE Motor Sports PL')
# g.simple('SE Mtaa-Forbes')
# g.simple('SE Mulberry ST')
# g.simple('SE Naples ST')
# g.simple('SE Neptune CT')
# g.simple('SE Nitz CT')
# g.simple('SE Norwood ST')
# g.simple('SE Oak Bend DR')
# g.simple('SE Oak CT')
# g.simple('SE Oakridge LN')
# g.simple('SE Oakview CT')
# g.simple('SE Oakview LN')
# g.simple('SE Oakwood CIR')
# g.simple('SE Oakwood CT')
# g.simple('SE Oakwood DR')
# g.simple('SE Oakwood ST')
# g.simple('SE Ohio AVE')
# g.simple('SE Ohio CT')
# g.simple('SE Ormsby DR')
# g.simple('SE Overton ST')
# g.simple('SE PARK LN CT')
# g.simple('SE Paddock DR')
# g.simple('SE Paulen RD')
# g.simple('SE Pawnee DR')
# g.simple('SE Peace CT')
# g.simple('SE Peck CT')
# g.simple('SE Peck RD')
# g.simple('SE Pennsylvania AVE')
# g.simple('SE Pennsylvania CT')
# g.simple('SE Piedmont CT')
# g.simple('SE Pinecrest CIR')
# g.simple('SE Pinecrest CT')
# g.simple('SE Pinecrest DR')
# g.simple('SE Pisces AVE')
# g.simple('SE Placid CT')
# g.simple('SE Powell AVE')
# g.simple('SE Powell CT')
# g.simple('SE Powell ST')
# g.simple('SE Promise ST')
# g.simple('SE Pueblo PL')
# g.simple('SE Quincy CIR')
# g.simple('SE Quincy CT')
# g.simple('SE Quincy ST')
# g.simple('SE Ramp RD')
# g.simple('SE Ratner RD')
# g.simple('SE Republican AVE')
# g.simple('SE Rice RD')
# g.simple('SE Ridgeview DR')
# g.simple('SE Ridgeview TER')
# g.simple('SE River Heights CT')
# g.simple('SE River Heights RD')
# g.simple('SE Rodgers ST')
# g.simple('SE S PARK AVE')
# g.simple('SE S Village PARKway')
# g.simple('SE SQdance RD')
# g.simple('SE Sage ST')
# g.simple('SE Sagis CT')
# g.simple('SE Sagittarius DR')
# g.simple('SE Saturn DR')
# g.simple('SE Scorpio AVE')
# g.simple('SE Scorpio DR')
# g.simple('SE Shadden RD')
# g.simple('SE Shadybrook LN')
# g.simple('SE Shawano DR')
# g.simple('SE Shawnee CT')
# g.simple('SE Shawnee DR')
# g.simple('SE Shawnee Heights RD')
# g.simple('SE Shawnee TER')
# g.simple('SE Sherman AVE')
# g.simple('SE Shiloh CT')
# g.simple('SE Shiloh Ridge LN')
# g.simple('SE Shoreline DR')
# g.simple('SE Shorewood CT')
# g.simple('SE Shorewood DR')
# g.simple('SE Skylark CT')
# g.simple('SE Skylark DR')
# g.simple('SE Skyview CT')
# g.simple('SE Spruce CT')
# g.simple('SE Stanley RD')
# g.simple('SE Starlite DR')
# g.simple('SE Stella AVE')
# g.simple('SE Stinson DR')
# g.simple('SE Strait AVE')
# g.simple('SE Stubbs RD')
# g.simple('SE Swygart ST')
# g.simple('SE Sycamore DR')
# g.simple('SE Taurus AVE')
# g.simple('SE Taurus CT')
# g.simple('SE Tecumseh RD')
# g.simple('SE Tefft ST')
# g.simple('SE Texas ST')
# g.simple('SE Tidewater DR')
# g.simple('SE Tinman CIR')
# g.simple('SE Tomahawk CT')
# g.simple('SE Tomahawk DR')
# g.simple('SE Tomahawk Trail')
# g.simple('SE Travis CIR')
# g.simple('SE Truman AVE')
# g.simple('SE Truman CT')
# g.simple('SE Turnpike AVE')
# g.simple('SE Va CT')
# g.simple('SE Vanburen PL')
# g.simple('SE Vera Frontage RD')
# g.simple('SE Vine ST')
# g.simple('SE Virginia AVE')
# g.simple('SE Virgo AVE')
# g.simple('SE W Edge RD')
# g.simple('SE Walnut DR')
# g.simple('SE Ward RD')
# g.simple('SE Washington ST')
# g.simple('SE Waters Edge LN')
# g.simple('SE Wear AVE')
# g.simple('SE Wear CIR')
# g.simple('SE Weekley CT')
# g.simple('SE William ST')
# g.simple('SE Willow Way')
# g.simple('SE Winfield AVE')
# g.simple('SE Winners CIR DR')
# g.simple('SE Winston DR')
# g.simple('SE Wisconsin AVE')
# g.simple('SE Wittenberg RD')
# g.simple('SE Wood ST')
# g.simple('SE Woodland AVE')
# g.simple('SE Woodring RD')
# g.simple('SE Woodring RD; E 1 RD')
# g.simple('SE Yacht CT')
# g.simple('SE Yale AVE')
# g.simple('SE RD')
# g.simple('SW 100th ST')
# g.simple('SW 100th TER')
# g.simple('SW 101st ST')
# g.simple('SW 101st TER')
# g.simple('SW 103rd ST')
# g.simple('SW 105th ST')
# g.simple('SW 107th ST')
# g.simple('SW 109th ST')
# g.simple('SW 10th AVE')
# g.simple('SW 10th TER')
# g.simple('SW 115th ST')
# g.simple('SW 11th ST')
# g.simple('SW 11th TER')
# g.simple('SW 12th ST')
# g.simple('SW 12th TER')
# g.simple('SW 13th ST')
# g.simple('SW 14th ST')
# g.simple('SW 15th CT')
# g.simple('SW 15th ST')
# g.simple('SW 15th TER')
# g.simple('SW 16th ST')
# g.simple('SW 17th ST')
# g.simple('SW 17th TER')
# g.simple('SW 18th ST')
# g.simple('SW 18th TER')
# g.simple('SW 19th LN')
# g.simple('SW 19th ST')
# g.simple('SW 19th TER')
# g.simple('SW 1st AVE')
# g.simple('SW 20th PARK')
# g.simple('SW 20th ST')
# g.simple('SW 20th TER')
# g.simple('SW 21st ST')
# g.simple('SW 21st TER')
# g.simple('SW 22nd CT')
# g.simple('SW 22nd PARK')
# g.simple('SW 22nd PL')
# g.simple('SW 22nd ST')
# g.simple('SW 22nd TER')
# g.simple('SW 23rd CT')
# g.simple('SW 23rd PARK')
# g.simple('SW 23rd ST')
# g.simple('SW 23rd TER')
# g.simple('SW 24th CT')
# g.simple('SW 24th ST')
# g.simple('SW 24th TER')
# g.simple('SW 25th CT')
# g.simple('SW 25th DR')
# g.simple('SW 25th ST')
# g.simple('SW 25th TER')
# g.simple('SW 26th CT')
# g.simple('SW 26th DR')
# g.simple('SW 26th ST')
# g.simple('SW 26th TER')
# g.simple('SW 27th CT')
# g.simple('SW 27th ST')
# g.simple('SW 27th TER')
# g.simple('SW 28th CT')
# g.simple('SW 28th ST')
# g.simple('SW 28th TER')
# g.simple('SW 29th ST')
# g.simple('SW 29th TER')
# g.simple('SW 2nd ST')
# g.simple('SW 30th ST')
# g.simple('SW 30th TER')
# g.simple('SW 31st CT')
# g.simple('SW 31st ST')
# g.simple('SW 31st TER')
# g.simple('SW 32nd ST')
# g.simple('SW 32nd TER')
# g.simple('SW 33rd CIR')
# g.simple('SW 33rd CT')
# g.simple('SW 33rd ST')
# g.simple('SW 33rd TER')
# g.simple('SW 34th CT')
# g.simple('SW 34th PL')
# g.simple('SW 34th ST')
# g.simple('SW 34th TER')
# g.simple('SW 35th ST')
# g.simple('SW 35th TER')
# g.simple('SW 36th CT')
# g.simple('SW 36th ST')
# g.simple('SW 36th TER')
# g.simple('SW 37th ST')
# g.simple('SW 37th TER')
# g.simple('SW 38th CT')
# g.simple('SW 38th LN')
# g.simple('SW 38th PL')
# g.simple('SW 38th ST')
# g.simple('SW 38th TER')
# g.simple('SW 39th CIR')
# g.simple('SW 39th CT')
# g.simple('SW 39th ST')
# g.simple('SW 39th TER')
# g.simple('SW 3rd ST')
# g.simple('SW 40th CT')
# g.simple('SW 40th ST')
# g.simple('SW 40th TER')
# g.simple('SW 41st ST')
# g.simple('SW 42nd CIR')
# g.simple('SW 42nd CT')
# g.simple('SW 42nd ST')
# g.simple('SW 43rd CT')
# g.simple('SW 43rd ST')
# g.simple('SW 43rd TER')
# g.simple('SW 44th CT')
# g.simple('SW 44th ST')
# g.simple('SW 44th TER')
# g.simple('SW 45th CT')
# g.simple('SW 45th ST')
# g.simple('SW 46th ST')
# g.simple('SW 46th TER')
# g.simple('SW 47th CT')
# g.simple('SW 47th ST')
# g.simple('SW 48th CT')
# g.simple('SW 48th ST')
# g.simple('SW 49th ST')
# g.simple('SW 4th ST')
# g.simple('SW 51st ST')
# g.simple('SW 51st TER')
# g.simple('SW 53rd ST')
# g.simple('SW 55th ST')
# g.simple('SW 56th CT')
# g.simple('SW 57th ST')
# g.simple('SW 58th ST')
# g.simple('SW 5th ST')
# g.simple('SW 61st ST')
# g.simple('SW 62nd ST')
# g.simple('SW 63rd ST')
# g.simple('SW 64th ST')
# g.simple('SW 65th ST')
# g.simple('SW 65th TER')
# g.simple('SW 66th ST')
# g.simple('SW 67th ST')
# g.simple('SW 69th ST')
# g.simple('SW 69th TER')
# g.simple('SW 6th AVE')
# g.simple('SW 6th ST')
# g.simple('SW 70th ST')
# g.simple('SW 70th TER')
# g.simple('SW 71st ST')
# g.simple('SW 71st TER')
# g.simple('SW 72nd PL')
# g.simple('SW 72nd ST')
# g.simple('SW 72nd TER')
# g.simple('SW 77th ST')
# g.simple('SW 79th ST')
# g.simple('SW 7th ST')
# g.simple('SW 81st ST')
# g.simple('SW 85th ST')
# g.simple('SW 89th ST')
# g.simple('SW 8th AVE')
# g.simple('SW 8th ST')
# g.simple('SW 91st ST')
# g.simple('SW 93rd ST')
# g.simple('SW 95th ST')
# g.simple('SW 97th ST')
# g.simple('SW 98th ST')
# g.simple('SW 99th ST')
# g.simple('SW 9th ST')
# g.simple('SW 9th TER')
# g.simple('SW Abbey DR')
# g.simple('SW Afton ST')
# g.simple('SW Alameda CT')
# g.simple('SW Alameda DR')
# g.simple('SW Albright DR')
# g.simple('SW Alexander CT')
# g.simple('SW Alfrey RD')
# g.simple('SW Alice LN')
# g.simple('SW Amarosa CIR')
# g.simple('SW Ambassador PL')
# g.simple('SW Amber CT')
# g.simple('SW Amhurst CT')
# g.simple('SW Amhurst RD')
# g.simple('SW Ancaster RD')
# g.simple('SW Anderson TER')
# g.simple('SW Arborglade LN')
# g.simple('SW Arborhaven LN')
# g.simple('SW Argyll ST')
# g.simple('SW Arlington ST')
# g.simple('SW Armagh ST')
# g.simple('SW Armco DR')
# g.simple('SW Armstrong AVE')
# g.simple('SW Arnold AVE')
# g.simple('SW Arnold CT')
# g.simple('SW Arnold ST')
# g.simple('SW Arrow Leaf RD')
# g.simple('SW Arrowhead CT')
# g.simple('SW Arrowhead RD')
# g.simple('SW Arthurs RD')
# g.simple('SW Arvonia PL')
# g.simple('SW Asbury DR')
# g.simple('SW Ash ST')
# g.simple('SW Ashworth CT')
# g.simple('SW Ashworth PL')
# g.simple('SW Ashworth ST')
# g.simple('SW Atwood AVE')
# g.simple('SW Atwood TER')
# g.simple('SW Auburn RD')
# g.simple('SW Auburndale CT')
# g.simple('SW Ava ST')
# g.simple('SW Avalon LN')
# g.simple('SW Aylesbury CT')
# g.simple('SW Aylesbury RD')
# g.simple('SW Balmoral LN')
# g.simple('SW Barons LN')
# g.simple('SW Barrington CT N')
# g.simple('SW Barrington CT S')
# g.simple('SW Bay DR')
# g.simple('SW Bayshore DR')
# g.simple('SW Belle AVE')
# g.simple('SW Belle TER')
# g.simple('SW Belmont LN')
# g.simple('SW Berkshire DR')
# g.simple('SW Berwyn ST')
# g.simple('SW Beverly CT')
# g.simple('SW Billard AVE')
# g.simple('SW Bingham CT')
# g.simple('SW Bingham RD')
# g.simple('SW Birchwood CIR')
# g.simple('SW Birchwood DR')
# g.simple('SW Birchwood LN')
# g.simple('SW Blaisdell DR')
# g.simple('SW Bloomsbury CT')
# g.simple('SW Blue Inn CT')
# g.simple('SW Blue Inn PL')
# g.simple('SW Blue Inn RD')
# g.simple('SW Blue Stem DR')
# g.simple('SW Boswell AVE')
# g.simple('SW Boswell CT')
# g.simple('SW Bowman CT')
# g.simple('SW Bracken CT')
# g.simple('SW Bradbury AVE')
# g.simple('SW Brandywine CT')
# g.simple('SW Brandywine LN')
# g.simple('SW Brendan AVE')
# g.simple('SW Brentwood CT')
# g.simple('SW Brentwood RD')
# g.simple('SW Brewster CT')
# g.simple('SW Briarcliff RD')
# g.simple('SW Briarmeade LN')
# g.simple('SW Briarwood CIR')
# g.simple('SW Briarwood DR')
# g.simple('SW Briarwood LN')
# g.simple('SW Briarwood Plaza')
# g.simple('SW Bristol RD')
# g.simple('SW BRDmoor AVE')
# g.simple('SW BRDview DR')
# g.simple('SW Brook Lawn CIR')
# g.simple('SW Brook Lawn DR')
# g.simple('SW Brook Lawn TER')
# g.simple('SW Brookfield CIR')
# g.simple('SW Brookfield ST')
# g.simple('SW Brookhaven LN')
# g.simple('SW Brooklawn DR')
# g.simple('SW Brooklyn AVE')
# g.simple('SW Brookwood Spur')
# g.simple('SW Brunswick RD')
# g.simple('SW Brush Creek Cove')
# g.simple('SW Buchanan ST')
# g.simple('SW Burch RD')
# g.simple('SW Burkdoll RD')
# g.simple('SW Burlingame CIR')
# g.simple('SW Burlingame RD')
# g.simple('SW Burnett CT')
# g.simple('SW Burnett RD')
# g.simple('SW Byron ST')
# g.simple('SW CTland AVE')
# g.simple('SW Cabana ST')
# g.simple('SW Caledon ST')
# g.simple('SW Cambridge AVE')
# g.simple('SW Cambridge CT')
# g.simple('SW Cambridge TER')
# g.simple('SW Camden LN')
# g.simple('SW Camelot PL')
# g.simple('SW Campbell AVE')
# g.simple('SW Candletree DR E')
# g.simple('SW Candletree DR S')
# g.simple('SW Candletree DR W')
# g.simple('SW Cannock Chase RD')
# g.simple('SW Cantabella ST')
# g.simple('SW Canterbury LN')
# g.simple('SW Canterbury Town RD')
# g.simple('SW Capehart RD')
# g.simple('SW Carlson RD')
# g.simple('SW Castle LN')
# g.simple('SW Cedar Cove CT')
# g.simple('SW Cedar Crest RD')
# g.simple('SW Cedar ST')
# g.simple('SW Celtic ST')
# g.simple('SW Central PARK AVE')
# g.simple('SW Central PARK ST')
# g.simple('SW Chapella ST')
# g.simple('SW Chatham PL')
# g.simple('SW Chauncey CT')
# g.simple('SW Chauncey DR')
# g.simple('SW Chelmsford RD')
# g.simple('SW Chelsea CIR')
# g.simple('SW Chelsea CT')
# g.simple('SW Chelsea DR')
# g.simple('SW Cherokee CT')
# g.simple('SW Cherokee ST')
# g.simple('SW Chetopa Trail')
# g.simple('SW Cheyenne Hills RD')
# g.simple('SW Cheyenne RD')
# g.simple('SW Chicory DR')
# g.simple('SW Christina CT')
# g.simple('SW Churchill RD')
# g.simple('SW Civitan LN')
# g.simple('SW Clare AVE')
# g.simple('SW Clarhan RD')
# g.simple('SW Clarion LN')
# g.simple('SW Clarion Lakes AVE')
# g.simple('SW Clarion Lakes DR')
# g.simple('SW Clarion Lakes Way')
# g.simple('SW Clarion PARK DR')
# g.simple('SW Clarion PL')
# g.simple('SW Clark CT')
# g.simple('SW Clay ST')
# g.simple('SW Clearview CIR')
# g.simple('SW Clearview LN')
# g.simple('SW Clontarf ST')
# g.simple('SW Cobblestone PL')
# g.simple('SW Cochise AVE')
# g.simple('SW Coker RD')
# g.simple('SW College AVE')
# g.simple('SW College CT')
# g.simple('SW Collins AVE')
# g.simple('SW Colly Creek CT')
# g.simple('SW Colly Creek DR')
# g.simple('SW Colly PL')
# g.simple('SW Commanche RD')
# g.simple('SW Commerce PL')
# g.simple('SW Connemare LN')
# g.simple('SW Conservatory DR')
# g.simple('SW Cornwall ST')
# g.simple('SW Corporate View')
# g.simple('SW Cottonwood CIR')
# g.simple('SW Cottonwood CT')
# g.simple('SW Country Club DR')
# g.simple('SW Crawford RD')
# g.simple('SW Crest DR')
# g.simple('SW Crestview ST')
# g.simple('SW Crestwood DR')
# g.simple('SW Croix PL')
# g.simple('SW Croix ST')
# g.simple('SW Damon CT')
# g.simple('SW Danbury LN')
# g.simple('SW Dancaster RD')
# g.simple('SW Dartmoor LN')
# g.simple('SW Davis DR')
# g.simple('SW Davis RD')
# g.simple('SW Deer Run CT')
# g.simple('SW Deer Run ST')
# g.simple('SW Deer Run')
# g.simple('SW Deer Trail CT')
# g.simple('SW Deer Trail DR')
# g.simple('SW Deer Trail ST')
# g.simple('SW Deer Trail')
# g.simple('SW Dennis ST')
# g.simple('SW Desousa CT')
# g.simple('SW Devon AVE')
# g.simple('SW Dixie CT')
# g.simple('SW Docking RD')
# g.simple('SW Dorr ST')
# g.simple('SW Douglas RD')
# g.simple('SW Douthitt AVE')
# g.simple('SW Drury LN')
# g.simple('SW Duane ST')
# g.simple('SW Dukeries RD')
# g.simple('SW Duncan CT')
# g.simple('SW Duncan DR')
# g.simple('SW Dunstan CT')
# g.simple('SW Durow RD')
# g.simple('SW Dury LN')
# g.simple('SW E CIR DR S')
# g.simple('SW E CIR DR')
# g.simple('SW Eagle Point RD')
# g.simple('SW Eagle Ridge LN')
# g.simple('SW Eden CT')
# g.simple('SW Edgewater TER')
# g.simple('SW Edgewood AVE')
# g.simple('SW Edson DR')
# g.simple('SW Elevation LN')
# g.simple('SW Elevation PARKway')
# g.simple('SW Elmwood AVE')
# g.simple('SW Elvira ST')
# g.simple('SW Emland CT')
# g.simple('SW Emland DR')
# g.simple('SW Emma AVE')
# g.simple('SW Engler CT')
# g.simple('SW Epworth LN')
# g.simple('SW Essex ST')
# g.simple('SW Eveningside DR')
# g.simple('SW Executive DR')
# g.simple('SW Exmoor LN')
# g.simple('SW Fairdale DR')
# g.simple('SW Fairlawn CT')
# g.simple('SW Fairlawn Plaza DR')
# g.simple('SW Fairlawn RD')
# g.simple('SW Fairmont RD')
# g.simple('SW Fairway DR')
# g.simple('SW Falcon ST')
# g.simple('SW Faldo DR')
# g.simple('SW Fieldcrest CT')
# g.simple('SW Fieldwood DR')
# g.simple('SW Fillmore ST')
# g.simple('SW Finsbury AVE')
# g.simple('SW First American PL')
# g.simple('SW Fleming CT')
# g.simple('SW Fountain PL')
# g.simple('SW Fountaindale RD')
# g.simple('SW Foxcroft CIR N')
# g.simple('SW Foxcroft CIR S')
# g.simple('SW Foxcroft CT One')
# g.simple('SW Foxcroft CT Three')
# g.simple('SW Foxcroft CT Two')
# g.simple('SW Franklin AVE')
# g.simple('SW Frazier AVE')
# g.simple('SW Frazier CIR')
# g.simple('SW Frazier CT')
# g.simple('SW Friar RD')
# g.simple('SW Front ST')
# g.simple('SW Frontage RD')
# g.simple('SW Gage BLVD')
# g.simple('SW Gage CIR')
# g.simple('SW Gage CT')
# g.simple('SW Gainsboro CIR')
# g.simple('SW Gainsboro RD')
# g.simple('SW Gamwell RD')
# g.simple('SW Garden LN')
# g.simple('SW Garfield AVE')
# g.simple('SW Gary Ormsby DR')
# g.simple('SW Gerald LN')
# g.simple('SW Gisbourne CT')
# g.simple('SW Gisbourne LN')
# g.simple('SW Glen CT')
# g.simple('SW Glen Crossing')
# g.simple('SW Glencoe ST')
# g.simple('SW Glencrest DR')
# g.simple('SW Glendale CT')
# g.simple('SW Glendale DR')
# g.simple('SW Glengate LN')
# g.simple('SW Glenn CT')
# g.simple('SW Glick RD')
# g.simple('SW Glitch RD')
# g.simple('SW Golf View CT')
# g.simple('SW Golf View DR')
# g.simple('SW Governor PL')
# g.simple('SW Governor View')
# g.simple('SW Grand CT')
# g.simple('SW Grandview AVE')
# g.simple('SW Granthurst AVE')
# g.simple('SW Green Acres AVE')
# g.simple('SW Greencastle DR')
# g.simple('SW Greenridge ST')
# g.simple('SW Greenridge RD')
# g.simple('SW Greenview DR')
# g.simple('SW Greenview TER')
# g.simple('SW Greenwood AVE')
# g.simple('SW Gresser ST')
# g.simple('SW Hampton ST')
# g.simple('SW Hamptonshire LN')
# g.simple('SW Harland CT')
# g.simple('SW Harp PL')
# g.simple('SW Harrison ST')
# g.simple('SW Harvey PL')
# g.simple('SW Harvey ST')
# g.simple('SW Hawick LN')
# g.simple('SW Hays RD')
# g.simple('SW Hazelton CT')
# g.simple('SW Hedgewood AVE')
# g.simple('SW Heights RD')
# g.simple('SW Henderson RD')
# g.simple('SW Herefordshire RD')
# g.simple('SW Hiawatha DR')
# g.simple('SW Hidden Valley DR')
# g.simple('SW High AVE')
# g.simple('SW Hillcrest RD')
# g.simple('SW Hillsdale ST')
# g.simple('SW Hillside DR')
# g.simple('SW Hoch RD')
# g.simple('SW Hodges RD')
# g.simple('SW Hogan CT')
# g.simple('SW Holly LN')
# g.simple('SW Honeysuckle LN')
# g.simple('SW Hope ST')
# g.simple('SW Horne ST')
# g.simple('SW Hunters LN')
# g.simple('SW Huntington DR')
# g.simple('SW Huntoon ST')
# g.simple('SW Indian Hills PL')
# g.simple('SW Indian Hills RD')
# g.simple('SW Indian Trail CT')
# g.simple('SW Indian Trail')
# g.simple('SW Indian Woods CT')
# g.simple('SW Indian Woods LN')
# g.simple('SW Indian Woods PL')
# g.simple('SW Jackson ST')
# g.simple('SW James CT')
# g.simple('SW James ST')
# g.simple('SW Jane ST')
# g.simple('SW Janet ST')
# g.simple('SW Jardine CT')
# g.simple('SW Jardine TER')
# g.simple('SW Jewell AVE')
# g.simple('SW Jordan RD')
# g.simple('SW Juneau ST')
# g.simple('SW Kansa DR')
# g.simple('SW Kendall AVE')
# g.simple('SW Kenilworth CT')
# g.simple('SW Kenova RD')
# g.simple('SW Kensington CT')
# g.simple('SW Kent CT')
# g.simple('SW Kent PL')
# g.simple('SW Kent ST')
# g.simple('SW Kerry AVE')
# g.simple('SW King Authur&apos;s RD')
# g.simple('SW Kings CT')
# g.simple('SW Kings Forest RD')
# g.simple('SW Kingsrow RD')
# g.simple('SW Kingston RD')
# g.simple('SW Kingswood CIR')
# g.simple('SW Kiowa ST')
# g.simple('SW Kirklawn AVE')
# g.simple('SW Knoll CT')
# g.simple('SW Knollwood CT')
# g.simple('SW Knollwood DR')
# g.simple('SW Knox AVE')
# g.simple('SW Knudsen RD')
# g.simple('SW LN ST')
# g.simple('SW Lagito CT')
# g.simple('SW Lagito DR')
# g.simple('SW Lajolla RD')
# g.simple('SW Lakeside DR')
# g.simple('SW Lancaster ST')
# g.simple('SW Lancelot CT')
# g.simple('SW Lancelot LN')
# g.simple('SW Landsdown CIR')
# g.simple('SW Lario LN')
# g.simple('SW Laurens Way')
# g.simple('SW Lee CT')
# g.simple('SW Lewelling RD')
# g.simple('SW Lilly CIR')
# g.simple('SW Lincoln ST')
# g.simple('SW Lincolnshire CIR')
# g.simple('SW Lincolnshire CT')
# g.simple('SW Lincolnshire RD')
# g.simple('SW Lindenwood AVE')
# g.simple('SW Llandovery LN')
# g.simple('SW Lowell LN')
# g.simple('SW Lydia AVE')
# g.simple('SW Macvicar AVE')
# g.simple('SW Macvicar CT')
# g.simple('SW Madeline LN')
# g.simple('SW Mallard LN')
# g.simple('SW Maple ST')
# g.simple('SW Marcia ST')
# g.simple('SW Marge CT')
# g.simple('SW Marian RD')
# g.simple('SW Marion LN')
# g.simple('SW Mariposa PL')
# g.simple('SW Marlboro RD')
# g.simple('SW Marshall AVE')
# g.simple('SW Martin CT')
# g.simple('SW Martin DR')
# g.simple('SW Mary ST')
# g.simple('SW Maupin CT')
# g.simple('SW Maupin LN')
# g.simple('SW Maxfield RD')
# g.simple('SW Mayfair PL')
# g.simple('SW Mayo AVE')
# g.simple('SW Mc Alister AVE')
# g.simple('SW Mc Clure RD')
# g.simple('SW McClure CT')
# g.simple('SW Meadow CT')
# g.simple('SW Meadow LN')
# g.simple('SW Meadowdale DR')
# g.simple('SW Medford AVE')
# g.simple('SW Medford CT')
# g.simple('SW Merriam CT')
# g.simple('SW Mifflin CT')
# g.simple('SW Mifflin RD')
# g.simple('SW Mike ST')
# g.simple('SW Millers Cove')
# g.simple('SW Millers Glen DR')
# g.simple('SW Mission AVE')
# g.simple('SW Mission CIR')
# g.simple('SW Mission CT')
# g.simple('SW Mission Hills RD')
# g.simple('SW Mission View DR')
# g.simple('SW Mission Woods CT')
# g.simple('SW Mission Woods DR')
# g.simple('SW Misty Harbor AVE')
# g.simple('SW Misty Harbor DR')
# g.simple('SW Montara Nway')
# g.simple('SW Montara PARKway')
# g.simple('SW Morna DR')
# g.simple('SW Morningside RD')
# g.simple('SW Morrill RD')
# g.simple('SW Moundview CIR')
# g.simple('SW Moundview CT')
# g.simple('SW Moundview DR')
# g.simple('SW Mowbray RD')
# g.simple('SW Muirfield CT')
# g.simple('SW Mulligan DR')
# g.simple('SW Mulvane ST')
# g.simple('SW Munn Memorial DR')
# g.simple('SW Munson AVE')
# g.simple('SW Murray Hill RD')
# g.simple('SW Murrow CT')
# g.simple('SW Naismith PL')
# g.simple('SW Navajo LN')
# g.simple('SW New Forest CT')
# g.simple('SW New Forest DR')
# g.simple('SW Newman ST')
# g.simple('SW Nicholas CT')
# g.simple('SW Norman CT')
# g.simple('SW Nottingham RD')
# g.simple('SW Oak PARKway')
# g.simple('SW Oak ST')
# g.simple('SW Oakley AVE')
# g.simple('SW Ojai ST')
# g.simple('SW Olive ST')
# g.simple('SW Orchard ST')
# g.simple('SW Orleans ST')
# g.simple('SW Osborn RD')
# g.simple('SW Osborne ST')
# g.simple('SW Ottawa Trail')
# g.simple('SW Overland CT')
# g.simple('SW Overland DR')
# g.simple('SW Overlook DR')
# g.simple('SW Oxford RD')
# g.simple('SW Oxfordshire RD')
# g.simple('SW PARK CT')
# g.simple('SW PARK LN')
# g.simple('SW PARK S CT')
# g.simple('SW PARKview ST')
# g.simple('SW Palace DR')
# g.simple('SW Palmer CT')
# g.simple('SW Parlington RD')
# g.simple('SW Patton RD')
# g.simple('SW Pembroke LN')
# g.simple('SW Pepper Tree LN')
# g.simple('SW Peppertree Cove')
# g.simple('SW Pepperwood CIR')
# g.simple('SW Pepperwood CT')
# g.simple('SW Pepperwood DR')
# g.simple('SW Pepperwood RD')
# g.simple('SW Perry ST')
# g.simple('SW Pierre ST')
# g.simple('SW Pine ST')
# g.simple('SW Pinebrook LN')
# g.simple('SW Pinehurst RD')
# g.simple('SW Plass AVE')
# g.simple('SW Plass CT')
# g.simple('SW Plaza DR')
# g.simple('SW Polk ST')
# g.simple('SW Pondview DR')
# g.simple('SW Porter RD')
# g.simple('SW Post Oak DR')
# g.simple('SW Potomac DR')
# g.simple('SW Prairie CT')
# g.simple('SW Prairie RD')
# g.simple('SW Quail Cove CIR')
# g.simple('SW Quail Creek DR')
# g.simple('SW Quail Run CT')
# g.simple('SW Quail Run DR')
# g.simple('SW Queens CT')
# g.simple('SW Queens Way')
# g.simple('SW Quiesent DR')
# g.simple('SW Quinton AVE')
# g.simple('SW Quinton ST')
# g.simple('SW Quivira DR')
# g.simple('SW Randolph AVE')
# g.simple('SW Randolph CT')
# g.simple('SW Randolph SQ')
# g.simple('SW Randolph ST')
# g.simple('SW Red Hawk CT')
# g.simple('SW Red Oaks CT')
# g.simple('SW Red Oaks PL')
# g.simple('SW Redbud CT')
# g.simple('SW Redbud LN')
# g.simple('SW Reeder ST')
# g.simple('SW Regency PARKway DR')
# g.simple('SW Regency PARKway')
# g.simple('SW Reinisch PARKway')
# g.simple('SW Rex ST')
# g.simple('SW Reynolds DR')
# g.simple('SW River Hill DR')
# g.simple('SW Riverwood LN')
# g.simple('SW Riverwood RD')
# g.simple('SW Robinhood CT')
# g.simple('SW Robinson AVE')
# g.simple('SW Roby PL')
# g.simple('SW Rock Garden DR')
# g.simple('SW Rockledge CT')
# g.simple('SW Rockpost RD')
# g.simple('SW Rolling CT')
# g.simple('SW Romar RD')
# g.simple('SW Rooney LN')
# g.simple('SW Roosevelt ST')
# g.simple('SW Rose Garden LN')
# g.simple('SW Rose Hill CIR')
# g.simple('SW Rose Hill LN')
# g.simple('SW Rose Hill ST')
# g.simple('SW Rother RD')
# g.simple('SW Roy RD')
# g.simple('SW Rye TER')
# g.simple('SW S Pointe DR')
# g.simple('SW Sacramento DR')
# g.simple('SW Sage Brush CT')
# g.simple('SW Saline ST')
# g.simple('SW Sanneman DR')
# g.simple('SW Santa Fe CIR')
# g.simple('SW Santa Fe CT')
# g.simple('SW Santa Fe DR')
# g.simple('SW Sbrook CT')
# g.simple('SW Scapa PL')
# g.simple('SW Scathelock RD')
# g.simple('SW Scenic DR')
# g.simple('SW Seabrook AVE')
# g.simple('SW Security Benefit PL')
# g.simple('SW Sedona RD')
# g.simple('SW Sena DR')
# g.simple('SW Sgate DR')
# g.simple('SW Shadow LN')
# g.simple('SW Shady Ridge RD')
# g.simple('SW Shadyvale LN')
# g.simple('SW Shenandoah RD')
# g.simple('SW Sherwood CT')
# g.simple('SW Shunga CT')
# g.simple('SW Shunga DR')
# g.simple('SW Shunga Trail Spur')
# g.simple('SW Shunga Trail To Brookwood Connector')
# g.simple('SW Shunga View CT')
# g.simple('SW Sieben CT')
# g.simple('SW Sieben ST')
# g.simple('SW Sims AVE')
# g.simple('SW Sims CT')
# g.simple('SW Skyline PARKway')
# g.simple('SW Skyview DR')
# g.simple('SW Smith PL')
# g.simple('SW Smith ST')
# g.simple('SW Sowers CT')
# g.simple('SW Spring Creek CT')
# g.simple('SW Spring Creek LN')
# g.simple('SW Spring Creek PL')
# g.simple('SW Spring Hill DR')
# g.simple('SW Stafford ST')
# g.simple('SW Staffordshire RD')
# g.simple('SW Steeplechase LN')
# g.simple('SW Sterling LN')
# g.simple('SW Stewart RD')
# g.simple('SW Stone AVE')
# g.simple('SW Stone Crest DR')
# g.simple('SW Stonebridge CT')
# g.simple('SW Stonegate CT')
# g.simple('SW Stoneylake DR')
# g.simple('SW Stonybrook CT')
# g.simple('SW Stonybrook DR')
# g.simple('SW Stratford RD')
# g.simple('SW Stutley CIR')
# g.simple('SW Stutley CT')
# g.simple('SW Stutley RD')
# g.simple('SW Suffolk RD')
# g.simple('SW Summerfield DR')
# g.simple('SW Summerwood CT')
# g.simple('SW Summerwood RD')
# g.simple('SW Summit AVE')
# g.simple('SW Summit Woods DR')
# g.simple('SW Sunflower CT')
# g.simple('SW Sunny Dell CT')
# g.simple('SW Sunnymeade CT')
# g.simple('SW Sunset CT')
# g.simple('SW Sunset RD')
# g.simple('SW Swonthold RD')
# g.simple('SW TER AVE')
# g.simple('SW Tara AVE')
# g.simple('SW Taylor ST')
# g.simple('SW Terra DR')
# g.simple('SW Thornwood CT')
# g.simple('SW Throop ST')
# g.simple('SW Timberlake CT')
# g.simple('SW Timberlake LN')
# g.simple('SW Timberridge CT')
# g.simple('SW Timberway DR')
# g.simple('SW Timor LN')
# g.simple('SW Tolin RD')
# g.simple('SW Topeka BLVD')
# g.simple('SW Towerview LN')
# g.simple('SW Trevino CT')
# g.simple('SW Turnberry CT')
# g.simple('SW Tutbury CT')
# g.simple('SW Tutbury Town RD')
# g.simple('SW Tutbury RD')
# g.simple('SW Twilight CT')
# g.simple('SW Twilight DR')
# g.simple('SW Tyler ST')
# g.simple('SW University BLVD')
# g.simple('SW Urish RD')
# g.simple('SW Uxbridge CIR')
# g.simple('SW Valencia RD')
# g.simple('SW Valley Brook LN')
# g.simple('SW Valley Glen CT')
# g.simple('SW Valley Glen RD')
# g.simple('SW Valley View CT')
# g.simple('SW Valley View DR')
# g.simple('SW Van Buren ST')
# g.simple('SW Ventana RD')
# g.simple('SW Vesper AVE')
# g.simple('SW Villa W DR')
# g.simple('SW Village CT')
# g.simple('SW Village DR')
# g.simple('SW Village Hall RD')
# g.simple('SW Village Market DR')
# g.simple('SW Vitt RD')
# g.simple('SW Vorse RD')
# g.simple('SW W DR')
# g.simple('SW W Hills DR')
# g.simple('SW W Trail RD')
# g.simple('SW W Union RD')
# g.simple('SW Wanamaker CT')
# g.simple('SW Wanamaker DR')
# g.simple('SW Wanamaker Frontage RD')
# g.simple('SW Wanamaker RD')
# g.simple('SW Ward PARKway')
# g.simple('SW Warner CT')
# g.simple('SW Warren AVE')
# g.simple('SW Warwick Town RD')
# g.simple('SW Washburn AVE')
# g.simple('SW Washburn TER E')
# g.simple('SW Washburn TER')
# g.simple('SW Watson AVE')
# g.simple('SW Watson CT')
# g.simple('SW Wattling CT')
# g.simple('SW Wayne AVE')
# g.simple('SW Wchester RD')
# g.simple('SW Webster AVE')
# g.simple('SW Wenger ST')
# g.simple('SW Wentley LN')
# g.simple('SW Wern AVE')
# g.simple('SW Wern ST')
# g.simple('SW Wesley CIR')
# g.simple('SW Wesparke CT')
# g.simple('SW Wesparke LN')
# g.simple('SW Wexford CT')
# g.simple('SW Wexford DR')
# g.simple('SW Wheatfield LN')
# g.simple('SW Whitefield CIR')
# g.simple('SW Whitehall LN')
# g.simple('SW Whitney AVE')
# g.simple('SW Wildwood LN')
# g.simple('SW Willow AVE')
# g.simple('SW Willow Brook CT')
# g.simple('SW Willow Brook DR')
# g.simple('SW Willowbrook LN')
# g.simple('SW Wilmington CT')
# g.simple('SW Windermere DR')
# g.simple('SW Winding RD')
# g.simple('SW Windslow CT')
# g.simple('SW Windsong DR')
# g.simple('SW Windsor CT')
# g.simple('SW Windwood LN')
# g.simple('SW Winterwood LN')
# g.simple('SW Withdean RD')
# g.simple('SW Wlake CT')
# g.simple('SW Wood Valley DR')
# g.simple('SW Woodbridge CT')
# g.simple('SW Woodbridge DR')
# g.simple('SW Woodbridge PL')
# g.simple('SW Woodbridge ST')
# g.simple('SW Woodbury CT N')
# g.simple('SW Woodbury CT S')
# g.simple('SW Woodbury LN')
# g.simple('SW Woodcroft Way')
# g.simple('SW Woodglen ST')
# g.simple('SW Woodhull CT')
# g.simple('SW Woodhull ST')
# g.simple('SW Woodlawn AVE')
# g.simple('SW Woodstock LN')
# g.simple('SW Woodvalley CT')
# g.simple('SW Woodvalley PL')
# g.simple('SW Woodvalley TER')
# g.simple('SW Woodview DR')
# g.simple('SW Woodward AVE')
# g.simple('SW Wover RD')
# g.simple('SW Westport CIR')
# g.simple('SW Westport DR')
# g.simple('SW Westport PL')
# g.simple('SW Westport Plaza DR')
# g.simple('SW Westport SQ')
# g.simple('SW Westridge DR')
# g.simple('SW Westridge Mal')
# g.simple('SW Westside DR')
# g.simple('SW Westview AVE')
# g.simple('SW Westview RD')
# g.simple('SW Westwood CIR')
# g.simple('SW Westwood CT')
# g.simple('SW Westwood DR')
# g.simple('SW York Way')
# g.simple('SW Yorkshire RD')
# g.simple('SW Zoo PARKway')
# g.simple('SW el Cerrito DR')
# g.simple('SW the DR')
# g.simple('Sadie LN')
# g.simple('Sage RD')
# g.simple('Saint Clere RD')
# g.simple('Saint Joseph ST')
# g.simple('Sale Barn LN')
# g.simple('Saline RD')
# g.simple('Sandy DR')
# g.simple('Sandy Hook RD')
# g.simple('Santa Fe Yards')
# g.simple('Saxon RD')
# g.simple('School CT')
# g.simple('Schultz RD')
# g.simple('Scout DR')
# g.simple('Seminole DR')
# g.simple('Seneca Lake RD')
# g.simple('Shady Bluff LN')
# g.simple('Shawguee RD')
# g.simple('Shawnee CIR')
# g.simple('Shawnee CT')
# g.simple('Shawnee LN')
# g.simple('Shawnee ST')
# g.simple('Sherman RD')
# g.simple('Short LN')
# g.simple('Shunga Woods CT')
# g.simple('Simon BLVD')
# g.simple('Sioux DR')
# g.simple('Skylab CT')
# g.simple('Soldier Creek Trail')
# g.simple('Sosiva LN')
# g.simple('Spring Creek CT')
# g.simple('Spring Creek DR')
# g.simple('Spring Creek LN')
# g.simple('Sprint Creek LN')
# g.simple('Spruce ST')
# g.simple('Stallion RD')
# g.simple('Stanley ST')
# g.simple('Stanley RD')
# g.simple('Stanton RD')
# g.simple('State HWY 16')
# g.simple('State HWY 214')
# g.simple('State HWY 4')
# g.simple('State HWY 63')
# g.simple('Stockman DR')
# g.simple('Suarez DR')
# g.simple('Sumac CT')
# g.simple('Sumner CT')
# g.simple('Sunflower')
# g.simple('Sunny Slope DR')
# g.simple('Sunnyside RD')
# g.simple('Sunrise CT')
# g.simple('Sunset CT')
# g.simple('Sunset DR')
# g.simple('Sunset LN')
# g.simple('Sunset Ridge DR')
# g.simple('Sweet Ridge DR')
# g.simple('Sweetgrass CT')
# g.simple('Sycamore ST')
# g.simple('Sycamore')
# g.simple('T 4 RD')
# g.simple('T2 LN')
# g.simple('T3 LN')
# g.simple('T4 RD')
# g.simple('TER Wood DR')
# g.simple('Tall Grass DR')
# g.simple('Tallgrass DR')
# g.simple('Tamblyn TER')
# g.simple('Theresa ST')
# g.simple('Thomas CT')
# g.simple('Timber CT')
# g.simple('Timber LN')
# g.simple('Timber Ridge LN')
# g.simple('Timberlane DR')
# g.simple('Tod Ranch RD')
# g.simple('Tomahawk DR')
# g.simple('Trail RD')
# g.simple('Tucker CT')
# g.simple('Tucker ST')
# g.simple('Tuffy Kellogg DR')
# g.simple('Turkey Creek RD')
# g.simple('U4 RD')
# g.simple('Union DR')
# g.simple('Uxbridge CIR')
# g.simple('V4 RD')
# g.simple('Vail RD')
# g.simple('Valley View DR')
# g.simple('Valley View RD')
# g.simple('Valley View')
# g.simple('Vera RD')
# g.simple('Village CIR')
# g.simple('Village Green RD')
# g.simple('Village RD')
# g.simple('Vincent CT')
# g.simple('Vista View CT')
# g.simple('W 110th ST')
# g.simple('W 113th ST')
# g.simple('W 116th ST')
# g.simple('W 117th ST')
# g.simple('W 11th ST')
# g.simple('W 125th ST')
# g.simple('W 133rd ST')
# g.simple('W 13th ST')
# g.simple('W 141st ST')
# g.simple('W 14th ST')
# g.simple('W 1st ST')
# g.simple('W 2nd ST')
# g.simple('W 3rd ST')
# g.simple('W 4th ST')
# g.simple('W 58th ST')
# g.simple('W 5th ST')
# g.simple('W 6th ST')
# g.simple('W 7th ST')
# g.simple('W 8th ST')
# g.simple('W 9th ST')
# g.simple('W Adrian ST')
# g.simple('W Apache ST')
# g.simple('W Bertrand AVE')
# g.simple('W Center')
# g.simple('W David ST')
# g.simple('W Kiowa ST')
# g.simple('W Lake ST')
# g.simple('W Lake RD')
# g.simple('W Lasley ST')
# g.simple('W Main ST')
# g.simple('W Main')
# g.simple('W Market ST')
# g.simple('W Mission ST')
# g.simple('W N ST')
# g.simple('W Palmer ST')
# g.simple('W Parr RD')
# g.simple('W Perry ST')
# g.simple('W Pottawatomie ST')
# g.simple('W RailRD ST')
# g.simple('W Ridgeway')
# g.simple('W School ST')
# g.simple('W Shore RD N')
# g.simple('W Shore RD S')
# g.simple('W Wyandotte ST')
# g.simple('West RD')
# g.simple('W5 RD')
# g.simple('W6 RD')
# g.simple('Wabaunsee ST')
# g.simple('Wabaunsee RD')
# g.simple('Wakarusa RD')
# g.simple('Walker ST')
# g.simple('Walnut DR')
# g.simple('Walnut ST')
# g.simple('Warren ST')
# g.simple('Washington AVE')
# g.simple('Washington ST')
# g.simple('Washington')
# g.simple('Water ST')
# g.simple('Waterman Crossing RD')
# g.simple('Wells ST')
# g.simple('Wells RD')
# g.simple('White Sands RD')
# g.simple('Whitehead LN')
# g.simple('Wiant ST')
# g.simple('Wildrose CIR')
# g.simple('Willard ST')
# g.simple('Willard RD')
# g.simple('Willmett Crossing RD')
# g.simple('Willow Creek DR')
# g.simple('Willow ST')
# g.simple('Willow Way ST')
# g.simple('Wilson ST')
# g.simple('Wilson RD')
# g.simple('Winding RD')
# g.simple('Windy Hill RD')
# g.simple('Wirt RD')
# g.simple('Westlake DR')
# g.simple('Westport CT')
# g.simple('Wyandotte RD')

# g.simple('X4 RD')

# g.simple('Yacht Club DR')

#g.simple('Huntoon')
g.simple('Western')
