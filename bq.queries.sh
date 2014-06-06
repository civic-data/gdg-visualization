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
# bq query "SELECT count(*) FROM [gdg.event_history] where start > DATE_ADD(current_timestamp(), -6, 'MONTH')"
# bq query "SELECT count(*) FROM [gdg.event_history] where start < DATE_ADD(current_timestamp(), -6, 'MONTH')"
# bq query "SELECT count(*),year(start) FROM [gdg.event_history] group by year(start) order by 1 desc"
# bq query "SELECT count(*),year(start) as group1 FROM [gdg.event_history] group by group1 order by group1 desc"
# bq query "SELECT count(*),STRFTIME_UTC_USEC(UTC_USEC_TO_MONTH(TIMESTAMP_TO_USEC(start)),'%Y-%m-%d') as group1 FROM [gdg.event_history] group by group1 order by group1 desc"
# bq query "SELECT concat(string(lat),',',string(lng)) as latlng FROM [gdg.event_history] group by latlng order by latlng limit 200"
# bq query --max_rows 5000 "SELECT concat(string(lat),',',string(lng)) as latlng FROM [gdg.event_history] group by latlng order by latlng"
# Bucketing Results by Timestamp  
# It's useful to use date and time functions to group query results into buckets corresponding to particular years, months, or days. The following example uses the UTC_USEC_TO_MONTH() function to display how many characters each Wikipedia contributor uses in their revision comments per month.
# 
# SELECT
# contributor_username,
# /* Return the timestamp shifted to the
# * start of the month, formatted in
# * a human-readable format. Uses the
# * 'LEFT()' string function to return only
# * the first 7 characters of the formatted timestamp.
# */
# LEFT (FORMAT_UTC_USEC(
# UTC_USEC_TO_MONTH(timestamp * 1000000)),7) 
# AS month,
# SUM(LENGTH(comment)) as total_chars_used
# FROM
# [publicdata:samples.wikipedia]
# WHERE
# (contributor_username != '' AND 
# contributor_username IS NOT NULL)
# AND timestamp > 1133395200
# AND timestamp < 1157068800
# GROUP BY
# contributor_username, month
# ORDER BY
# total_chars_used DESC;
# Returns (truncated):
# 
# +--------------------------------+---------+-----------------------+
# |      contributor_username      |  month  | total_chars_used      |
# +--------------------------------+---------+-----------------------+
# | Kingbotk                       | 2006-08 |              18015066 |
# | SmackBot                       | 2006-03 |               7838365 |
# | SmackBot                       | 2006-05 |               5148863 |
# | Tawkerbot2                     | 2006-05 |               4434348 |
# | Cydebot                        | 2006-06 |               3380577 |
# etc ...
# bq query "SELECT count(*),STRFTIME_UTC_USEC(UTC_USEC_TO_MONTH(TIMESTAMP_TO_USEC(start)),'%Y-%m-%d') as group1 FROM [gdg.gdgx_event_history] group by group1 order by group1 desc"
# belgium
# bq query "SELECT chapter,start,participants,substring(about,1,10) FROM [gdg.gdgx_event_history] where chapter = '105068877693379070381' order by start"
# bq query "SELECT chapter,start FROM [gdg.gdgx_event_history] where chapter = '105068877693379070381' order by start"

#bq query --max_rows 2000 "SELECT chapter,count(*),STRFTIME_UTC_USEC(UTC_USEC_TO_MONTH(TIMESTAMP_TO_USEC(start)),'%Y-%m-%d') as group1 FROM [gdg.gdgx_event_history] group by group1,chapter order by group1 desc"
# bq query --max_rows 2000 "SELECT chapter,count(*),STRFTIME_UTC_USEC(UTC_USEC_TO_YEAR(TIMESTAMP_TO_USEC(start)),'%Y') as group1 FROM [gdg.gdgx_event_history] group by group1,chapter order by group1 desc"
bq query --max_rows 2000 "SELECT chapter,sum(participants),STRFTIME_UTC_USEC(UTC_USEC_TO_YEAR(TIMESTAMP_TO_USEC(start)),'%Y') as group1 FROM [gdg.gdgx_event_history] group by group1,chapter order by group1 desc"
