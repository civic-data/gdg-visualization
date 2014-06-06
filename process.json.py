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


def processitem(encodedrow,s):

                 if isinstance(s,dict):
                     encodedrow+=[s]
                 elif isinstance(s,int):
                     encodedrow+=[s]
                 elif isinstance(s,list):
                     encodedrow+=[s]
                 elif isinstance(s,float):
                     encodedrow+=[s]
                 elif not s:
                     encodedrow+=[s]
                 else:
                     encodedrow+=[s.replace('\n','|').encode("utf-8")]
                 return encodedrow

csvwriter = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
csvwriter2 = csv.writer(sys.stderr, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)

json_data=sys.stdin

data = json.load(json_data)
first=True
header2=[]
map1={}
location=0
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
            #print len(item2.keys())
            #if first and len(item2.keys()) == 19:
            if first:
                for s in item2.keys():
                    header+=[s]
                #csvwriter2.writerow(header)
                #first=False

            for key,s in item2.iteritems():
                if key not in header2:
                    map1[key]=location
                    location+=1
                    header2+= [key]

                if isinstance(s,dict):
                    for key3,item3 in s.iteritems():
                        encodedrow+=[item3]
                        if key3 not in header2:
                            map1[key3]=location
                            header2+= [key3]
                            location+=1
        #print map1 , len(map1)
        #print 'len(header2)',len(header2)
        print header2
        #print len(data[item])
        for item2 in data[item]:
            encodedrow=[]
            for headitem in header2:
                if headitem in item2:
                    #print 'found: ' , item2[headitem]
                    #encodedrow+=[item2[headitem]]
                    encodedrow=processitem(encodedrow,item2[headitem])
                else:
                    #print 'not found: ' , headitem
                    if headitem in ['start','end']:
                        encodedrow+=[0]
                    else:
                        encodedrow+=['']
            sys.stderr.write('QQQ: %s\n' % len(encodedrow) )
            csvwriter.writerow( encodedrow )



#                     encodedrow[map1[key3]]=s
#                 elif isinstance(s,int):
#                     encodedrow[map1[key]]=s
#                 elif isinstance(s,list):
#                     encodedrow[map1[key]]=s
#                 elif isinstance(s,float):
#                     encodedrow[map1[key]]=s
#                 elif not s:
#                     encodedrow[map1[key]]=s
#                 else:
#                     encodedrow[map1[key]]=s.encode("utf-8")
#             #sys.stderr.write('%s\n' % len(encodedrow))
#             #csvwriter.writerow( encodedrow )
#         print map1 , len(map1)
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

