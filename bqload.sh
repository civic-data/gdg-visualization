#!/usr/bin/env bash
# participantsCount,end,name,tags,lat,lng,description,start,location,gplusEventUrl,defaultEventUrl
# participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl
# bq load gdg.event_history all.gdg.2.csv participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl 
##### bq load gdg.event_history all.gdg.2.post.process.csv end:timestamp,name:string,tags:string,participantsCount:integer,start:timestamp,location:string,lat:float,lng:float,defaultEventUrl:string,gplusEventUrl:string,description
# end,name,tags,participantsCount,start,location,lat,lng,defaultEventUrl,gplusEventUrl,description
# end,name,tags,participantsCount,start,location,lat,lng,defaultEventUrl,gplusEventUrl,description
# end:timestamp,name:string,tags:string,participantsCount:integer,start:timestamp,location:string,lat:float,lng:float,defaultEventUrl:string,gplusEventUrl:string,description

# chapter,about,allDay,end,start,created_at,title,updated_at,iconUrl,participants,__v,location,timezone,_id,geo,tags
# chapter:string,about:string,allDay:string,end:timestamp,start:timestamp,created_at:timestamp,title:string,updated_at:timestamp,iconUrl:string,participants:integer,__v:string,location:string,timezone:string,_id:string,geo:string,tags:string
# bq load gdg.gdgx_event_history gdgx.csv chapter:string,about:string,allDay:string,end:timestamp,start:timestamp,created_at:timestamp,title:string,updated_at:timestamp,iconUrl:string,participants:integer,__v:string,location:string,timezone:string,_id:string,geo:string,tags:string


# [u'chapter', u'about', u'allDay', u'end', u'start', u'created_at', u'title', u'updated_at', u'iconUrl', u'participants', u'__v', u'location', u'timezone', u'_id', u'geo', u'lat', u'lng', u'tags', u'eventUrl']
bq load gdg.gdgx_event_history gdgx_full.csv chapter:string,about:string,allDay:string,end:timestamp,start:timestamp,created_at:timestamp,title:string,updated_at:timestamp,iconUrl:string,participants:integer,__v:string,location:string,timezone:string,_id:string,geo:string,lat:string,lng:string,tags:string,eventUrl:string
