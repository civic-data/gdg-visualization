#!/usr/bin/env python
import sys
import csv
from datetime import datetime

writer = csv.writer(sys.stdout, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
reader = csv.DictReader( sys.stdin )
first=True
for line in reader:
    header = []
    row = []
    #print len(line)
    for item in line:
        header += [item]
        item1 = line[item].replace('\n','|')
        if item == "end" or item == "start":
            item1 = datetime.strftime(datetime.fromtimestamp(float(item1)),'%Y-%m-%dT%H:%M:%S-05:00')

        #row += [line[item]]
        row += [item1]
    if first:
        first=False
        writer.writerow(header)
    writer.writerow(row)

