#!/usr/bin/ruby
require 'open-uri'
require 'json'
require 'cgi'
require 'open-uri'
require 'facets/string/titlecase'

class LandUse
  def church (obj)
    p obj
    abort "todo"
  end
end

#the nodes see
@@seen=Hash.new 

class BaseNode 
  def self.initfields ()
    @@abbr= Hash.new
    @@abbr['AL'] = 	'Alley'
    @@abbr['ALY'] = 'ALLEY'
    @@abbr['ANX'] = 'ANNEX'
    @@abbr['APT'] = 'APARTMENT'
    @@abbr['ARC'] = 'ARCADE'
    @@abbr['AVE'] = 	'Avenue'
    @@abbr['AVE'] = 'AVENUE'
    @@abbr['BCH'] = 'BEACH'
    @@abbr['BG'] = 'BURG'
    @@abbr['BLDG'] = 'BUILDING'
    @@abbr['BLF'] = 'BLUFF'
    @@abbr['BLVD'] = 'BOULEVARD'
    @@abbr['BLVD'] = 'Boulevard'
    @@abbr['BND'] = 'BEND'
    @@abbr['BR'] = 'BRANCH'
    @@abbr['BRG'] = 'BRIDGE'
    @@abbr['BRK'] = 'BROOK'
    @@abbr['BSMT'] = 'BASEMENT'
    @@abbr['BTM'] = 'BOTTOM'
    @@abbr['BYP'] = 'BYPASS'
    @@abbr['BYU'] = 'BAYOU'
    @@abbr['CIR'] = 	'Circle'
    @@abbr['CIR'] = 'CIRCLE'
    @@abbr['CLB'] = 'CLUB'
    @@abbr['CLFS'] = 'CLIFF'
    @@abbr['CLFS'] = 'CLIFFS'
    @@abbr['COR'] = 'CORNER'
    @@abbr['CORS'] = 'CORNERS'
    @@abbr['CP'] = 'CAMP'
    @@abbr['CPE'] = 'CAPE'
    @@abbr['CRES'] = 'CRESCENT'
    @@abbr['CRK'] = 'CREEK'
    @@abbr['CRSE'] = 'COURSE'
    @@abbr['CSWY'] = 'CAUSEWAY'
    @@abbr['CT'] = 	'Court'
    @@abbr['CT'] = 'COURT'
    @@abbr['CTR'] = 'CENTER'
    @@abbr['CTS'] = 'COURTS'
    @@abbr['CV'] = 'COVE'
    @@abbr['CYN'] = 'CANYON'
    @@abbr['DEPT'] = 'DEPARTMENT'
    @@abbr['DL'] = 'DALE'
    @@abbr['DM'] = 'DAM'
    @@abbr['DR'] = 	'Drive'
    @@abbr['DR'] = 'DRIVE'
    @@abbr['DV'] = 'DIVIDE'
    @@abbr['EST'] = 'ESTATE'
    @@abbr['EXPY'] = 'EXPRESSWAY'
    @@abbr['EXT'] = 'EXTENSION'
    @@abbr['FL'] = 'FLOOR'
    @@abbr['FLD'] = 'FIELD'
    @@abbr['FLDS'] = 'FIELDS'
    @@abbr['FLS'] = 'FALLS'
    @@abbr['FLT'] = 'FLAT'
    @@abbr['FRD'] = 'FORD'
    @@abbr['FRG'] = 'FORGE'
    @@abbr['FRK'] = 'FORK'
    @@abbr['FRKS'] = 'FORKS'
    @@abbr['FRNT'] = 'FRONT'
    @@abbr['FRST'] = 'FOREST'
    @@abbr['FRY'] = 'FERRY'
    @@abbr['FT'] = 'FORT'
    @@abbr['FWY'] = 'FREEWAY'
    @@abbr['GDNS'] = 'GARDEN'
    @@abbr['GDNS'] = 'GARDENS'
    @@abbr['GLN'] = 'GLEN'
    @@abbr['GRN'] = 'GREEN'
    @@abbr['GRV'] = 'GROVE'
    @@abbr['GTWY'] = 'GATEWAY'
    @@abbr['HBR'] = 'HARBOR'
    @@abbr['HL'] = 'HILL'
    @@abbr['HLS'] = 'HILLS'
    @@abbr['HNGR'] = 'HANGER'
    @@abbr['HOLW'] = 'HOLLOW'
    @@abbr['HTS'] = 'HEIGHTS'
    @@abbr['HVN'] = 'HAVEN'
    @@abbr['HWY'] = 	'Highway'
    @@abbr['INLT'] = 'INLET'
    @@abbr['IS'] = 'ISLAND'
    @@abbr['ISS'] = 'ISLANDS'
    @@abbr['JCT'] = 'JUNCTION'
    @@abbr['KNLS'] = 'KNOLL'
    @@abbr['KNLS'] = 'KNOLLS'
    @@abbr['KY'] = 'KEY'
    @@abbr['LBBY'] = 'LOBBY'
    @@abbr['LCKS'] = 'LOCK'
    @@abbr['LCKS'] = 'LOCKS'
    @@abbr['LDG'] = 'LODGE'
    @@abbr['LF'] = 'LOAF'
    @@abbr['LGT'] = 'LIGHT'
    @@abbr['LK'] = 'LAKE'
    @@abbr['LKS'] = 'LAKES'
    @@abbr['LN'] = 	'Lane'
    @@abbr['LN'] = 'LANE'
    @@abbr['LNDG'] = 'LANDING'
    @@abbr['LOWR'] = 'LOWER'
    @@abbr['MDWS'] = 'MEADOW'
    @@abbr['MDWS'] = 'MEADOWS'
    @@abbr['ML'] = 'MILL'
    @@abbr['MLS'] = 'MILLS'
    @@abbr['MNR'] = 'MANOR'
    @@abbr['MSN'] = 'MISSION'
    @@abbr['MT'] = 'MOUNT'
    @@abbr['MTN'] = 'MOUNTAIN'
    @@abbr['NCK'] = 'NECK'
    @@abbr['OFC'] = 'OFFICE'
    @@abbr['ORCH'] = 'ORCHARD'
    @@abbr['PARK'] = 	'Park'
    @@abbr['PH'] = 'PENTHOUSE'
    @@abbr['PKWY'] = 'PARKWAY'
    @@abbr['PL'] = 	'Place'
    @@abbr['PL'] = 'PLACE'
    @@abbr['PLN'] = 'PLAIN'
    @@abbr['PLNS'] = 'PLAINS'
    @@abbr['PLZ'] = 'PLAZA'
    @@abbr['PNES'] = 'PINE'
    @@abbr['PNES'] = 'PINES'
    @@abbr['PR'] = 'PRAIRIE'
    @@abbr['PRT'] = 'PORT'
    @@abbr['PT'] = 'POINT'
    @@abbr['RADL'] = 'RADIAL'
    @@abbr['RD'] = 'ROAD'
    @@abbr['RD'] = 'Road'
    @@abbr['RDG'] = 'RIDGE'
    @@abbr['RIV'] = 'RIVER'
    @@abbr['RM'] = 'ROOM'
    @@abbr['RNCH'] = 'RANCH'
    @@abbr['RPDS'] = 'RAPID'
    @@abbr['RPDS'] = 'RAPIDS'
    @@abbr['RST'] = 'REST'
    @@abbr['SHL'] = 'SHOAL'
    @@abbr['SHLS'] = 'SHOALS'
    @@abbr['SHR'] = 'SHORE'
    @@abbr['SHRS'] = 'SHORES'
    @@abbr['SMT'] = 'SUMMIT'
    @@abbr['SPC'] = 'SPACE'
    @@abbr['SPG'] = 'SPRING'
    @@abbr['SPGS'] = 'SPRINGS'
    @@abbr['SQ'] = 	'Square'
    @@abbr['SQ'] = 'SQUARE'
    @@abbr['ST'] = 	'Street'
    @@abbr['STA'] = 'STATION'
    @@abbr['STE'] = 'SUITE'
    @@abbr['STR'] = 	'Street'
    @@abbr['STRA'] = 'STRAVENUE'
    @@abbr['STRM'] = 'STREAM'
    @@abbr['TER'] = 	'Terrace'
    @@abbr['TER'] = 'TERRACE'
    @@abbr['TPKE'] = 'TURNPIKE'
    @@abbr['TRAK'] = 'TRACK'
    @@abbr['TRCE'] = 'TRACE'
    @@abbr['TRFY'] = 'TRAFFICWAY'
    @@abbr['TRL'] = 'TRAIL'
    @@abbr['TRLR'] = 'TRAILER'
    @@abbr['TUNL'] = 'TUNNEL'
    @@abbr['UN'] = 'UNION'
    @@abbr['UPPR'] = 'UPPER'
    @@abbr['VIA'] = 'VIADUCT'
    @@abbr['VIS'] = 'VISTA'
    @@abbr['VL'] = 'VILLE'
    @@abbr['VLG'] = 'VILLAGE'
    @@abbr['VLY'] = 'VALLEY'
    @@abbr['VW'] = 'VIEW'
    @@abbr['WAY'] = 'WAY'
    @@abbr['WLS'] = 'WELL'
    @@abbr['WLS'] = 'WELLS '
    @@abbr['XING'] = 'CROSSING'
    @@abbr['road'] = 'Road'

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

#amenity=
    @@fcodesl['5315']=lambda {|o| 
      o.attributes['amenity'] = "community_centre"   
      o.attributes['landuse'] = "fairgrounds"
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

    #
    @@fcodesl['9980']= lambda {|o|       
      o.attributes['landuse'] = "industrial"   
      o.attributes['industrial'] = "mining"   
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

    @@fcodesl['6833']= lambda {|o|       
      o.attributes['lesiure'] = 'social_club'
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
    ios.write("<node id=\"#{@id}\" lat=\"#{@lat}\"  lon=\"#{@lon}\" >\n" )
    super
    ios.write("</node>\n")
  end

  def osmxmlref (ios)
    ios.write("<nd ref=\"#{@id}\" />\n")
  end

  def landuse 

    #delete 


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

    key = lat.to_s + '|' + lon.to_s

    if (@@seen.has_key?( key ))  
        p =  @@seen[ key ]
#      print "Found:"  + p.id.to_s + "\n"
#      print  p.osmxml($stdout)
        @nodes.push(p)
      else
        p = Node.new(lat,lon)
        if (!p.nil?)
          @nodes.push(p)
        else
          abort "no node"
        end      
        @@seen[ key ] = p
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

  def osmxml_way (ios)
    @nodes.each { |x| x.osmxml(ios) }
    ios.write("<way id=\"#{@id}\" >\n")
    @attributes.delete('building')
    @@fields.each {|x| 
      k=x
      v=@attributes[k]
      if (!v.nil?)
        emitkv ios, k, v
      end

    }
    @nodes.each { |x| x.osmxmlref(ios) }
    ios.write("</way>\n")
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
            @attributes['addr:street_type']=@@abbr[streettype].capitalize()
            
          else
            warn @attributes
            abort("no street type" + streettype )        
          end
        end        
      end
    end

    namelist = paddressa.map(&:capitalize);    
    @attributes['addr:street_name']=namelist.join(" ") # the rest
    @attributes['addr:full']=     [@attributes['addr:housenumber'] , 
                                   @attributes['addr:bearing']     ,
                                   @attributes['addr:street_name'] , 
                                   @attributes['addr:street_type'] 
                                  ].flatten.join(" ")
    @attributes['addr:street']=     [@attributes['addr:bearing']     ,
                                     @attributes['addr:street_name'] , 
                                     @attributes['addr:street_type'] 
                                    ].flatten.join(" ")
   
#    print @attributes['addr:street_name'] + "\n"
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
        abort("missing" + x)
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
    ios.write("<osm version=\"0.6\" >\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml(ios) 
    }
    ios.write("</osm>\n")
  end

  def osmxml_way (ios)
    ios.write("<osm version=\"0.6\" >\n")
#    p @properties
    @properties.each { |x| 
      x.osmxml_way(ios) 
    }
    ios.write("</osm>\n")
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
      f = File.open(x + "_way.osm", 'w') 
      osmxml_way(f)
    else
      p "no found :" + x 
    end
  end
  
end

g=GIS.new()


other = [ '14th st',
 '1st N st',
 '1st S st',
 '28th st',
 '2nd N st',
 '2nd S st',
 '39th Ct',
 '39th st',
 '3rd S st',
 '42nd st',
 '48th st',
 '4th N st',
 '54th st',
 '6th N st',
 '7th N st',
 '8th st',
 '9th N st',
 '9th st',
 'Access Rd',
 'Adams st',
 'Adrian st',
 'Anderson st',
 'Apollo st',
 'Aquarius st',
 'Ash st',
 'Baker Dr',
 'Bays Water Cir',
 'Beaubein st',
 'B Rd',
 'Brookwood Spur',
 'B st',
 'C-1 st',
 'C-2 st',
 'Cahill Rd',
 'Camp Hammond',
 'Capper Rd',
 'Center st',
 'Chalet-Topeka',
 'Chestnut st',
 'Chilson Rd',
 'Citizen Cir',
 'Coberly Ln',
 'Commercial st',
 'Cottonwood Ln',
 'Crawford Rd',
 'C st',
 'Deer Creek Trl',
 'Docking Rd',
 'Dornwood Park Trl',
 'Douglas Rd',
 'D Rd',
 'D st',
 'Eagle st',
 'E Railrd st',
 'E Rice Ct',
 'England Rd',
 'E st',
 'Falcon Ct',
 'Franklin st',
 'F Rd',
 'F st',
 'Garfield Park',
 'Gemini st',
 'Gilkerson st',
 'Golden st',
 'Governor\'s Lake Rd',
 'Greenview Dr',
 'G Rd',
 'G st',
 'Hamilton pkwy',
 'Harrison Ct',
 'Harrison st',
 'Heartland Park Raceway',
 'Heck Ct',
 'Hilltop Rd',
 'Hoch Rd',
 'Hodges Rd',
 'H st',
 'Humphrey Rd',
 'I st',
 'Jordan Rd',
 'J Rd',
 'J st',
 'Kansas Turnpike',
 'Kansas Veterans\' Walk',
 'Kellogg Ln',
 'Kennys Ct',
 'Kevin st',
 'Kingston Rd',
 'Kling Ct',
 'K st',
 'KTA Maintence Rd',
 'Lakeland Dr',
 'Lake Rd',
 'Lake Shawnee Trl',
 'Lakewood ter',
 'Lamr ave',
 'Landon Nature Trl',
 'Landon Nature Trl;Shunga Trl',
 'Landon Rd',
 'Leeve Trl',
 'Levee Trl',
 'Madore st',
 'Madrid Ct',
 'Maple Hill Rd',
 'Mariner st',
 'Mariner dr',
 'Marion st',
 'Masche st',
 'Metropolitan Topeka Airport Authority',
 'Milton Ct',
 'Milton st',
 'Mount Calvary Rd',
 'Mulvane Farm',
 'N 1000 Rd',
 'N 1400 Rd',
 'N 1500 Rd',
 'N 1700 Rd',
 'Nishnabe Trl',
 'N 1600 Rd',
 'N 2050 Rd',
 'N 2064 Rd',
 'NE 36th ter',
 'NE 42nd st',
 'NE 92nd st',
 'NE Aberdeen Dr',
 'NE Atteberry Dr',
 'NE B ave',
 'NE Brier Rd',
 'NE Burgess Ct',
 'NE Burgess st',
 'NE Calhoun Bluff Rd',
 'NE Chester Dr',
 'NE Coachlight Dr',
 'NE Curtis Flyoff',
 'NE Downs Rd',
 'NE Goldwater Rd',
 'NE Herschell Rd',
 'NE Holman st',
 'NE Jefferson Trfy',
 'NE Kansa Trl',
 'NE Kendall Wood Pl',
 'NE Kriepe Rd',
 'NE Ln',
 'NE Maple ave',
 'NE Maple st',
 'NE Marple Ct',
 'NE Michigan',
 'NE Morse st',
 'NE Mtaa-Billard',
 'NE Norris st',
 'NE N ave',
 'NE NE Collier Rd',
 'NE Pleasant Hill Ct',
 'NE Porubsky Dr',
 'NE Riverview Rd',
 'NE Rockaway Trl',
 'NE Russ ave',
 'NE Saint John st',
 'NE Sardou st',
 'NE Sewer Plant Dr',
 'NE Shuler ave',
 'NE Soldier st',
 'NE Tahoe Dr',
 'NE Tantara Rd',
 'NE Thomas st',
 'NE Walnut Grove Dr',
 'N Milton Ct',
 'NW 20th st',
 'NW 24th st',
 'NW 25th Pl',
 'NW 36th st',
 'NW 38 st',
 'NW 3rd st',
 'NW 40th ter',
 'NW 46th and Fielding Junction',
 'NW 46th, Hunters Ridge and Oakley Junction',
 'NW 5th st',
 'NW 7th st',
 'NW Apache Trl',
 'NW Apollo Dr',
 'NW A Rd',
 'NW Austin ave',
 'NW B Dr',
 'NW Beaumont Ct',
 'NW Beecher st',
 'NW Beverly st',
 'NW Bitter Nut st',
 'NW Bowery st',
 'NW Brittany Ln',
 'NW Brittany N Cir',
 'NW Brittany Pl',
 'NW Brittany S Cir',
 'NW Brd st',
 'NW Capital View Dr',
 'NW Capital View ter',
 'NW Caravan Mhp',
 'NW Cardinal Dr',
 'NW Cayuse Trl',
 'NW Cloverleaf Dr',
 'NW Cortland ave',
 'NW Cycle ave',
 'NW Deerborn st',
 'NW Doggie Dr',
 'NW Dowdy Dr',
 'NW Finch Ln',
 'NW Fredith Rd',
 'NW Frontage Rd',
 'NW Gemini Ct',
 'NW Geronimo Trl',
 'NW Gibbys Ln',
 'NW Goodyear Plant Rd',
 'NW Goodyear Rd',
 'NW Gravy Train Ln',
 'NW Greenwood Ct',
 'NW Half Day Ln',
 'NW Half Moon Ct',
 'NW Hamilton Ln',
 'NW Hardt ave',
 'NW Hardt st',
 'NW Harold Ct',
 'NW Haven Rd',
 'NW Hunter Dr',
 'NW Hunters Ridge Dr',
 'NW Hunters Ridge ter',
 'NW Industrial Tfwy',
 'NW Kingsway Cir',
 'NW Lookout Rd',
 'NW Lowry Ln',
 'NW Mac Rd',
 'NW Macvictor ave',
 'NW Manspeaker st',
 'NW Meadowbrook Ct',
 'NW Meadowcrest Rd',
 'NW Morley Rd',
 'NW Moundview Ct',
 'NW Myrtle ave',
 'NW Nboro Dr',
 'NW N Hills Dr',
 'NW N Pointe Dr',
 'NW N Pointe ter',
 'NW Oakview Dr',
 'NW Old Indianola Rd',
 'NW Perry Rd',
 'NW Proctor st',
 'NW Ramblewood Cir',
 'NW Ridgeway Ct',
 'NW Ridgewood Dr',
 'NW Ross st',
 'NW Saint John st',
 'NW Saline Rd',
 'NW Sanford Ln',
 'NW Schaller Ct',
 'NW Seaman st',
 'NW Shawna Dr',
 'NW Spring Creek Dr',
 'NW Sproaton Ln',
 'NW Starlight Cir',
 'NW Starlite Ln',
 'NW Sterling Dr',
 'NW Sugar Creek Ridge',
 'NW Sugar Creek Ridge Dr',
 'NW Sun Valley Rd',
 'NW the Dr',
 'NW Vail Ct',
 'NW Waddell st',
 'NW Walnut Grove Dr',
 'NW Wendel Rd',
 'NW Whispering Ln',
 'NW Wilcox Ct',
 'NW Woodland Cir',
 'NW Woodlawn ave',
 'NW Wren Ln',
 'Nuzman Ct',
 'O4 Rd',
 'Oakland Expressway',
 'Old Highway 24',
 'Old Hodges Rd',
 'P4 Rd',
 'Park Dr',
 'Perimeter Rd',
 'Porter st',
 'Pratt st',
 'Presbyterian Manor Access Rd',
 'proposed connection bikeway',
 'Pueblo Cir',
 'Q.S.S.',
 'Railrd st',
 'Rice Rd',
 'Rice Rd, I 170, Cypress Rd Roundabout',
 'Rice Rd, I 170, Sycamore Rd Roundabout',
 'Richland Rd',
 'River Ct',
 'Robins Dr',
 'Rolyan Rd',
 'Roundabout SW 29th st and SW Urish Rd',
 'Roundabout SW 37th st and  SW Wanamaker Rd',
 'Roundabout SW 41st st and SW Wanamaker Rd',
 'Roundabout SW 6th ave and SW Wanamaker Rd',
 'Sage Rd',
 'Santa Fe Yards',
 'School Ct',
 'Shady Bluff Ln',
 'Sherman Rd',
 'Shunga Trl',
 'Shunga Trl Extension proposed',
 'Shunga Trl Spur SW 15th st',
 'Shunga Woods Ct',
 'Simon bvld',
 'Skylab Ct',
 'Soldier Creek Trl',
 'Sosiva Ln',
 'S 45th st',
 'S Auburn Rd',
 'S Berryton Rd',
 'S California Rd',
 'S Croco Rd',
 'S Davis Rd',
 'S Docking Rd',
 'SE 11th Ct',
 'SE 11th ter',
 'SE 12th Ct',
 'SE 1 S st',
 'SE 2nd ter',
 'SE 41st ter',
 'SE 45th ter',
 'SE 46th Ct',
 'SE 46th st',
 'SE 46th ter',
 'SE 47th st',
 'SE 47th st ter',
 'SE 54th st',
 'SE 7th ter',
 'SE 97th st',
 'SE 99th st',
 'SE A Island Cir',
 'SE Apache Pl',
 'SE Baldwin st',
 'SE Beach ter',
 'SE Behaze Ct',
 'SE Birch st',
 'SE Blackjack Cir',
 'SE Blackjack Way',
 'SE Blazing Star Dr',
 'SE Bob Hertzen Way',
 'SE Branner Trfy',
 'SE Branner Trfwy.',
 'SE Champions Dr',
 'SE Chippewa Dr',
 'SE Cir Dr S',
 'SE Clinton Wildlife Rd',
 'SE Clover Ct',
 'SE Coachlight Village A Dr',
 'SE Coachlight Village C Dr',
 'SE Coachlight Village D Dr',
 'SE Coachlight Village Dr',
 'SE Coachlight Village E Dr',
 'SE Coberly Rd',
 'SE Cottonwood st',
 'SE Coyote Dr',
 'SE C st',
 'SE Cuvier Dr',
 'SE Cyprus Dr',
 'SE Deer Creek Tfwy',
 'SE Dock Dr',
 'SE D st',
 'SE E Edge Rd',
 'SE Edgar Rd',
 'SE Edison ave',
 'SE Elm Cove Dr',
 'SE Elm st',
 'SE E st',
 'SE Finish Line Dr',
 'SE Garden Park Ct',
 'SE Gilmore Ct',
 'SE Golf Park bvld',
 'SE Gruber Ln',
 'SE Hackberry st',
 'SE Handcock st',
 'SE Holiday st',
 'SE Illinois st',
 'SE Jane Way',
 'SE Joey Chitwood Dr',
 'SE Kellam st',
 'SE K st',
 'SE Leisure Ln',
 'SE Manitowac Dr',
 'SE Manitowoc Dr',
 'SE Matney Rd',
 'SE Memory Point',
 'SE Michigan st',
 'SE Motor Sports Pl',
 'SE Mtaa-Forbes',
 'SE Mulberry st',
 'SE Nitz Ct',
 'SE Ormsby Dr',
 'SE Paddock Dr',
 'SE Powell ave',
 'SE Quincy Cir',
 'SE Ramp Rd',
 'SE Ridgeview Dr',
 'SE Ridgeview ter',
 'SE Rd',
 'SE Rockfire Dr',
 'SE Sagittarius Dr',
 'SE Scorpio Dr',
 'SE Shawano Dr',
 'SE Silverleaf Ct',
 'SE S Village pkwy',
 'SE Squaredance Rd',
 'SE Stella ave',
 'SE Stone Ledge Ct',
 'SE Sycamore Dr',
 'SE Texas st',
 'SE Va Ct',
 'SE Vanburen Pl',
 'SE Violet Ct',
 'SE Wear Cir',
 'SE William st',
 'SE Willow Way',
 'SE Winners Cir Dr',
 'SE Woodring Rd; E 1 Rd',
 'SE Yacht Ct',
 'SE Yale ave',
 'S Fairlawn Rd',
 'S Glenside Ct',
 'S Hoch Rd',
 'S Jordan Rd',
 'S pkwy Ln',
 'S Paulen Rd',
 'S Ratner Rd',
 'S Stubbs Rd',
 'S Valencia Rd',
 'S Vauter Rd',
 'SW 100th st',
 'SW 100th ter',
 'SW 101st ter',
 'SW 62nd st',
 'SW 65th ter',
 'SW 8th st',
 'SW 95th st',
 'SW 98th st',
 'SW Albright Dr',
 'SW Alfrey Rd',
 'SW Alice Ln',
 'SW Amber Ct',
 'SW Armco Dr',
 'SW Arnold st',
 'SW Arrow Leaf Rd',
 'SW Asbury Dr',
 'SW Ash st',
 'SW Ashworth st',
 'SW Auburndale Ct',
 'SW Balmoral Ln',
 'SW Barrington Ct N',
 'SW Barrington Ct S',
 'SW Bay Dr',
 'SW Berwyn st',
 'SW Birchwood Dr',
 'SW Blaisdell Dr',
 'SW Bloomsbury Ct',
 'SW Bracken Ct',
 'SW Brewster Ct',
 'SW Briarwood Plaza',
 'SW Bristol Rd',
 'SW Brdview Dr',
 'SW Brooklawn Dr',
 'SW Brookwood Spur',
 'SW Brush Creek Cove',
 'SW Burkdoll Rd',
 'SW Burlingame Cir',
 'SW Cabana st',
 'SW Candletree Dr E',
 'SW Candletree Dr S',
 'SW Candletree Dr W',
 'SW Canterbury Ln',
 'SW Cedar st',
 'SW Central Park st',
 'SW Chetopa Trl',
 'SW Chicory Dr',
 'SW Civitan Ln',
 'SW Clarion Lakes ave',
 'SW Clarion Lakes Way',
 'SW Clark Ct',
 'SW Colly Pl',
 'SW Connemare Ln',
 'SW Conservatory Dr',
 'SW Corporate View',
 'SW Cottonwood Ct',
 'SW Deer Run',
 'SW Deer Trl',
 'SW Dennis st',
 'SW Desousa Ct',
 'SW Durow Rd',
 'SW Dury Ln',
 'SW Eagle Ridge Ln',
 'SW E Cir Dr S',
 'SW Eden Ct',
 'SW Edson Dr',
 'SW el Cerrito Dr',
 'SW Elevation pkwy',
 'SW Elvira st',
 'SW Emland Ct',
 'SW Emma ave',
 'SW Epworth Ln',
 'SW Essex st',
 'SW Expocentre Dr',
 'SW Faldo Dr',
 'SW Foxcroft Cir N',
 'SW Foxcroft Cir S',
 'SW Foxcroft Ct One',
 'SW Foxcroft Ct Three',
 'SW Foxcroft Ct Two',
 'SW Gage Cir',
 'SW Glen Ct',
 'SW Glen Crossing',
 'SW Glitch Rd',
 'SW Governor Pl',
 'SW Governor View',
 'SW Gresser st',
 'SW Hogan Ct',
 'SW Huntington Dr',
 'SW Indian Trl',
 'SW Janet st',
 'SW Juneau st',
 'SW Kansa Dr',
 'SW King Authur\'s Rd',
 'SW Kingswood Cir',
 'SW Landsdown Cir',
 'SW Laurens Way',
 'SW Lee Ct',
 'SW Lydia ave',
 'SW Mallard Ln',
 'SW Maple st',
 'SW Marcia st',
 'SW Marshall ave',
 'SW Mary st',
 'SW Mc Alister ave',
 'SW Mc Clure Rd',
 'SW Mike st',
 'SW Millers Cove',
 'SW Mission View Dr',
 'SW Mission Woods Ct',
 'SW Montara Nway',
 'SW Montara pkwy',
 'SW Munn Memorial Dr',
 'SW Newman st',
 'SW Oak pkwy',
 'SW Oak st',
 'SW Ojai st',
 'SW Ottawa Trl',
 'SW Overlook Dr',
 'SW Oxford Rd',
 'SW Park Ct',
 'SW Park S Ct',
 'SW Peppertree Cove',
 'SW Pepperwood Dr',
 'SW Perry st',
 'SW Pierre st',
 'SW Pine st',
 'SW Porter Rd',
 'SW Post Oak Dr',
 'SW Queens Way',
 'SW Quiesent Dr',
 'SW Quinton st',
 'SW Regency pkwy',
 'SW Reinisch pkwy',
 'SW Rex st',
 'SW Riverwood Rd',
 'SW Rock Garden Dr',
 'SW Rockledge Ct',
 'SW Rose Garden Ln',
 'SW Rose Hill Cir',
 'SW Rose Hill Ln',
 'SW Rose Hill st',
 'SW Rye ter',
 'SW Scapa Pl',
 'SW Scenic Dr',
 'SW Security Benefit Pl',
 'SW Shunga Trl Spur',
 'SW Sims Ct',
 'SW Skyline pkwy',
 'SW Smith st',
 'SW Sbrook Ct',
 'SW S Pointe Dr',
 'SW Sowers Ct',
 'SW Spring Creek Pl',
 'SW Stutley Cir',
 'SW Sunnymeade Ct',
 'SW ter ave',
 'SW the Dr',
 'SW Thornwood Ct',
 'SW Timberridge Ct',
 'SW Timor Ln',
 'SW Towerview Ln',
 'SW Trevino Ct',
 'SW Tuffy Kellogg Dr',
 'SW Turnberry Ct',
 'SW Tutbury Town Ct',
 'SW Tutbury Town Rd',
 'SW Twilight Ct',
 'SW Twilight Dr',
 'SW University bvld',
 'SW Uxbridge Cir',
 'SW Valley Brook Ln',
 'SW Valley Glen Ct',
 'SW Valley Glen Rd',
 'SW Valley View Ct',
 'SW Valley View Dr',
 'SW Vesper ave',
 'SW Village Ct',
 'SW Village Dr',
 'SW Village Hall Rd',
 'SW Village Market Dr',
 'SW Vitt Rd',
 'SW Wanamaker Frontage Rd',
 'SW Ward pkwy',
 'SW Warner Ct',
 'SW Warren ave',
 'SW Warwick Town Rd',
 'SW Washburn ter',
 'SW Washburn ter E',
 'SW Wattling Ct',
 'SW Webster ave',
 'SW Wenger st',
 'SW Wentley Ln',
 'SW Wesley Cir',
 'SW Wesparke Ct',
 'SW Wesparke Ln',
 'SW Wern st',
 'SW Wlake Ct',
 'SW Wridge Mal',
 'SW Wexford Ct',
 'SW Wexford Dr',
 'SW Wheatfield Ln',
 'SW Whitefield Cir',
 'SW Whitney ave',
 'SW Wildwood Ln',
 'SW Willow ave',
 'SW Willow Brook Ct',
 'SW Willow Brook Dr',
 'SW Willowbrook Ln',
 'SW Wilmington Ct',
 'SW Windermere Dr',
 'SW Winding Rd',
 'SW Windslow Ct',
 'SW Windsong Dr',
 'SW Windsor Ct',
 'SW Windwood Ln',
 'SW Withdean Rd',
 'SW Woodbridge st',
 'SW Woodbury Ct N',
 'SW Woodbury Ct S',
 'SW Woodcroft Way',
 'SW Woodglen st',
 'SW Woodhull Ct',
 'SW Woodhull st',
 'SW Woodstock Ln',
 'SW Woodvalley Ct',
 'SW Wood Valley Dr',
 'SW Woodvalley Pl',
 'SW Woodvalley ter',
 'SW Woodview Dr',
 'SW Woodward ave',
 'SW York Way',
 'SW Zoo pkwy',
 'Spring Creek Dr',
 'Spring Creek Ln',
 'Sprint Creek Ln',
 'Stanley Rd',
 'Stanley st',
 'Stanton Rd',
 'Sunset Ct',
 'Sweetgrass Ct',
 'Tallgrass Dr',
 'Tamblyn ter',
 'Theresa st',
 'Timber Ct',
 'T Rd',
 'Union Dr',
 'Uxbridge Cir',
 'V Rd',
 'Walnut st',
 'Washington st',
 'W 58th st',
 'W Lake st',
 'Westport Ct',
 'W Pottawatomie st',
 'W Railrd st',
 'W School st',
 'Whitehead Ln',
 'Willard st',
 'Willow Way st',
]

###
newstuff2 =[
 'k4 highway',
 'k4',
 'highway',
 'highway 24',
 'us4',
 '40 hwy',
 '75 hwy',
 '70 hwy',
 'I 470 hwy',
 'highway',
 'burgess',
 'Kincaid',
 'Brier',
            'holman',
            'grantville',
            'kreipe',
            'shadden',
'sardou',
'NE GONVIL ST',
"ne 86th st",
"ne 94th st",
"ne 82nd st",
"ne 78th st",
"ne 66th st",
"ne 62nd st",
"ne 54th st",
"ne 50th st",
"ne 46th st",
"NE North Ave",
"Pleasant Hill",
"NE St John St",
"Shuler",
"NE Tahoe DR",
"Tantara",
"walnut grove",
"Landon", 
"nw 38",
"nw 38",
"nw 39",
"nw topeka",           
"nw apache trl",           
"nw apollo",           
"nw morley",           
"meriden",           
"nw broad st",           
"Tyler",           
"Capitol View",
"Independence",
"NE 31st",
"N Kansas",
"NE 39st",
"NE 35",
"Croco",
"Shaffer",
"NE 56th",
"NE 74th",
"NE Fairview",
"SE 2nd",
"SE 6th",
"SE 10th",
"SE 21th",
"SE Green",
"SE Stanley",
"SE 29th",
"SE 37th",
"SE 45th",
"SE 53th",
"SE 61th",
"SE 69th",
"SE 77th",
"SE 85th",
"SE 89th",
"SE 101th",
"SE 105th",
"SE 109th",
"NE 70th",
"NE Brown Rd",
"NE Sherman Rd",
            "NE Silver Rd",
            "NE NORWOOD ST",
            "NW Geronimo",
            "NW Gibby",
            "NW Leedy",
            "NW Jennings",
            "Nw 35",
           "Nw 46th",
           "Nw huxman",
           "Nw valencia",
           "Nw 31",
           "Nw docking",
          "Nw humphrey",
"nw 86th st",
"nw 94th st",
"nw 82nd st",
"nw 78th st",
"nw 66th st",
"nw 62nd st",
"nw 54th st",
"nw 50th st",
"halfday", 
"hunter", 
"foxcroft", 
"woodstock",
"maupin",
           "industrial",
           "kingsway",
           "lowry",

           "meadowbrook",
           "meadowcrest",
           "morley",
           "moundview",
           "myrtle",
           "nboro",
           "hills",
           "pointe",
           "oadview",
           "indianola",
           "proctor",
           "ramblewood",
           "ridgewood",
           "ridgeway",
           "ross",
           "st john",
           "saline",
           "schaller",
           "seaman",
           "shawna",
           "clure",
           "mack",
           "northboro",
           "kings",
           "fountaindale",
           "wentley",
           "gisbourne",
           "tubury",
           "sherwood",
           
            "finsbury",
            "tutbury",
           "nw lowry ln",
           "nw north hills dr",
           "sw broadview dr",
           "sw valley glen rd",
           "perry",
           "glick",
           "Emland"           ,
           "SW woodglen"           ,
            "worwick"           
]


newstuff =[

           


]

ARGV.each { |x|
  print x;
  g.simple(x)
  }
