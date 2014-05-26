#!/usr/bin/env python

# dev site get events 
# curl "https://developers.google.com/events/event-markers.json?tag=gdg&start=1396310400&end=1398902400" | ./process.dev.site.py
#                                                                             1400887429.01

import json
import sys
import csv
import urllib2
import datetime
import time
from pprint import pprint

csvwriter = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
csvwriter2 = csv.writer(sys.stderr, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

json_data=sys.stdin

data = json.load(json_data)
first=True
for item in data:
    #print item, type(data[item])
    if (isinstance(data[item], list)):
        #print len(data[item])
        #print data[item]
        for item2 in data[item]:
            #print type(item2)
            # csvwriter.writerow(item2.values()) 
            # csvwriter.writerow( [s.encode("utf-8") for s in item2.values()]) 
            encodedrow=[]
            header=[]
            print len(item2.keys())
            if first and len(item2.keys()) == 19:
                for s in item2.keys():
                    header+=[s]
                csvwriter2.writerow(header)
                first=False

            for s in item2.values():
                if isinstance(s,dict):
                    encodedrow+=[s]
                    for item3 in s.values():
                        encodedrow+=[item3]
                elif isinstance(s,int):
                    encodedrow+=[s]
                elif isinstance(s,list):
                    encodedrow+=[s]
                elif isinstance(s,float):
                    encodedrow+=[s]
                elif not s:
                    encodedrow+=[s]
                else:
                    encodedrow+=[s.encode("utf-8")]
            #sys.stderr.write('%s\n' % len(encodedrow))
            csvwriter.writerow( encodedrow )
#     print item, type(data[item]), str(data[item])[:10]
#     if (isinstance(data[item], list)):
#         for item2 in data[item]:
#             print type(item2)
#             for item3 in item2:
#                 try:
#                     print item3, item2[item3]
#                 except Exception,e:
#                     print 'QQQ:', e

json_data.close()

