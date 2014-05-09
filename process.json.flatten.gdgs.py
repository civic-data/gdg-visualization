#!/usr/bin/env python
import json
import sys
import csv
from pprint import pprint

csvwriter = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

#json_data=open(sys.stdin)
json_data=sys.stdin
#json_data=open(sys.argv[1])

#print json_data

data = json.load(json_data)
#pprint(data)
#print data
#print len(data)
for item in data:
    name=item['name']
    city=name.replace('GDG','').replace('GTUG','').strip()
    id=item['gplus_id']
    #id=str(item['gplus_id'])
    #print len(item['meetings'])
    for item1 in item['meetings']:
        #print item1
        csvwriter.writerow([s.encode("utf-8") for s in [city,id,name,str(item1['attendees']), item1['date'], item1['title']]])

    #pass

json_data.close()

