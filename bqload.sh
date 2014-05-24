#!/usr/bin/env bash
# participantsCount,end,name,tags,lat,lng,description,start,location,gplusEventUrl,defaultEventUrl
# participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl
bq load gdg.event_history all.gdg.2.csv participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl 
