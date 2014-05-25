#!/usr/bin/env bash
#
# example usage: 
#  ./bq.gdg.to.event.sh |awk '{print $5}' |grep events |sed 's?^?curl "https://developers.google.com/events/?' |sed 's/$/"/'

bq query "SELECT start,defaultEventUrl FROM [gdg.event_history] order by start desc limit 10"
