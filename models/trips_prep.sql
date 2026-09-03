select
id
,user_id
,scooter_hw_id
,started_at 
,finished_at 
,cast(started_at as date) as date
,extract(EPOCH FROM (finished_at - started_at)) as duration_s
,start_lat
,start_lon
,finish_lat
,finish_lon
,distance as distance_m
,cast(price as decimal (20,2)) / 100 as price_rub
,case when price = 0 then 1 else 0 end as is_free
from {{ source('scooters_raw', 'trips') }}