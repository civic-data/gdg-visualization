#!/usr/bin/env python

# dev site get events 
# curl "https://developers.google.com/events/event-markers.json?tag=gdg&start=1396310400&end=1398902400" | ./process.dev.site.py

import json
import sys
import csv
from pprint import pprint

csvwriter = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

json_data=sys.stdin

data = json.load(json_data)
#print type(data)
#print data

for item in data:
    row=[]
    #print type(item)
    #print item
    for key in item:
        if isinstance(item[key],dict):
            #print type(item[key])
            #print item[key]
            #for key1,value in item[key].iteritems():
                #print key1,value
            for key1 in item[key]:
                #print key1, item[key][key1]
                row+=[item[key][key1]]
        else:
            #print key,item[key]
            row+=[item[key]]
    #csvwriter.writerow([s.encode("utf-8") for s in row])
    encodedrow=[]
    for s in row:
        if isinstance(s,int):
            encodedrow+=[s]
        elif isinstance(s,list):
            encodedrow+=[s]
        elif isinstance(s,float):
            encodedrow+=[s]
        elif not s:
            encodedrow+=[s]
        else:
            encodedrow+=[s.encode("utf-8")]
    csvwriter.writerow(encodedrow)

    #exit(1)
    #name=item['name']
    #print name
###     #city=name.replace('GDG','').replace('GTUG','').strip()
###     #id=item['gplus_id']
###     #id=str(item['gplus_id'])
###     #print len(item['meetings'])
###     for item1 in item['meetings']:
###         #print item1
###         csvwriter.writerow([s.encode("utf-8") for s in [city,id,name,str(item1['attendees']), item1['date'], item1['title']]])
### 
###     #pass

json_data.close()

