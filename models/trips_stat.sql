
select
count(id) as trips
,count(distinct(user_id)) as users
,avg(extract(EPOCH FROM (finished_at - started_at)) / 60) as avg_duration_m 
,sum(price) as revenue_rub
,round(count(id) filter (where price = 0):: numeric / count(id) * 100 ,2) as free_trips_pct 
from dev_487w.scooters_raw.trips t