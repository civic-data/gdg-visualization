#!/usr/bin/env bash
set -x

bq query "SELECT start,location FROM [gdg.event_history] where location like '%New York%' order by 1 desc;"
bq query "SELECT count(*) FROM [gdg.event_history] where description like '%GDG%'"
bq query "SELECT count(*) FROM [gdg.event_history] where not description like '%GDG%'"
bq query "SELECT count(*),location FROM [gdg.event_history] group by location order by 1 desc"
