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
print data
json_data.close()

