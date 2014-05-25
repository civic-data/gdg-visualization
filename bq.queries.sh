#!/usr/bin/env bash
set -x

# bq query "SELECT start,defaultEventUrl FROM [gdg.event_history] where location like '%New York%' order by start desc;"
#bq query "SELECT count(*), lat,lng FROM [gdg.event_history] group by lat,lng order by 1 desc;"
#bq query "SELECT count(*), location FROM [gdg.event_history] where location='' or location is null group by location order by 1 desc;"
#bq query "SELECT * FROM [gdg.event_history] where location='' or location is null"

# bq query "SELECT start,location FROM [gdg.event_history] where location like '%New York%' order by 1 desc;"
# bq query "SELECT count(*) FROM [gdg.event_history] where description like '%GDG%'"
# bq query "SELECT count(*) FROM [gdg.event_history] where not description like '%GDG%'"
# bq query --max_rows 5000 "SELECT count(*),lat,lng FROM [gdg.event_history] group by lat,lng order by 1 desc"
# bq query --max_rows 5000 "SELECT count(*) FROM [gdg.event_history]"
# bq query --max_rows 5000 "SELECT count(*),location FROM [gdg.event_history] group by location order by 1 desc"
# bq query "SELECT count(*) FROM [gdg.event_history] where start > DATE_ADD(timestamp(now()), -6, 'MONTH')"
#bq query "SELECT DATE_ADD(timestamp(now()), -6, 'MONTH')"
# bq query "SELECT now()"
# bq query "SELECT DATE_ADD(now(), -6, 'MONTH')"
# bq query "SELECT DATE_ADD(TIMESTAMP('2012-10-01 02:03:04'), 5, 'YEAR');"
# bq query "SELECT TIMESTAMP('2012-10-01 02:03:04')"
# bq query "SELECT now()"
# bq query "SELECT current_timestamp()"
# bq query "SELECT DATE_ADD(current_timestamp(), -6, 'MONTH')"
bq query "SELECT count(*) FROM [gdg.event_history] where start > DATE_ADD(current_timestamp(), -6, 'MONTH')"
bq query "SELECT count(*) FROM [gdg.event_history] where start < DATE_ADD(current_timestamp(), -6, 'MONTH')"
# bq query "SELECT count(*),year(start) FROM [gdg.event_history] group by year(start) order by 1 desc"
bq query "SELECT count(*),year(start) as group1 FROM [gdg.event_history] group by group1 order by group1 desc"
