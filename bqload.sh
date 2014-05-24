#!/usr/bin/env bash
# participantsCount,end,name,tags,lat,lng,description,start,location,gplusEventUrl,defaultEventUrl
# participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl
# bq load gdg.event_history all.gdg.2.csv participantsCount:integer,end:timestamp,name:string,tags:string,lat:string,lng:string,description:string,start:timestamp,location:string,gplusEventUrl:string,defaultEventUrl 
bq load gdg.event_history all.gdg.2.post.process.csv end:timestamp,name:string,tags:string,participantsCount:integer,start:timestamp,location:string,lat:float,lng:float,defaultEventUrl:string,gplusEventUrl:string,description
# end,name,tags,participantsCount,start,location,lat,lng,defaultEventUrl,gplusEventUrl,description
# end,name,tags,participantsCount,start,location,lat,lng,defaultEventUrl,gplusEventUrl,description
# end:timestamp,name:string,tags:string,participantsCount:integer,start:timestamp,location:string,lat:float,lng:float,defaultEventUrl:string,gplusEventUrl:string,description
