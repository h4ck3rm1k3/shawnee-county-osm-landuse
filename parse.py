
import json 
import md5
import re 
import yaml
import bson
import pymongo

conn = pymongo.Connection('mongodb://localhost/ersi')
db = conn['ersi']
print "DB", db.name
db.lawrence

def proc(url, b):
    if len(b) > 1:
        m = md5.new(b).hexdigest()
        print b[:30]
        
        # mongo does not like . in the keys
        b = b.replace('.','_')

        d= yaml.load(b)
        #d = json.loads(b)
        #print m,d

        try:
            db.lawrence.save({'url' : url, 'contents': d})
        except bson.errors.InvalidDocument as e:
            print d
            print e
            raise e

def runfile(filename):
    f = open(filename)
    state = 0 
    block = ""
    url = ""
    size = 0 

    while(True):
        l  = f.readline()
        if len(l) == 0:
            proc(url, block)
            return

        l = l.rstrip()

        if state == 0:
            #print l 
            m = re.search(r"Going to get: (https?:\/\/.+)BEGINJSON",l)
            if m :
                url = m.groups(0)
                print "getting url %s" % url
                state = 1
                block = ""
                size = 0
            else:
                m = re.search(r"BEGINJSON",l)
                if m :
                    raise Exception(l)
                size = size +1
                #print l
                if size % 10000 ==0:
                    print "Empty Size:", size
                    if size > 200000 :
                        raise Exception()

        elif state == 1 :
            #print l
            state = 2
            block = l
            size = 1

        elif state == 2 :
            #print l
            size = size + 1
            if size % 10000 == 0:
                print "."

            if size > 60000:
                print "Size:", size, l
            if re.match(r'ENDJSON',l):
                state = 0
                #proc(url, block)
                block = ""
            else:
                block = block + l

runfile("lawrence.txt")
runfile("douglas.txt")
