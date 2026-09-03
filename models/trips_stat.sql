

select
count(id) as trips
,count(distinct(user_id)) as users
,avg(duration_s / 60) as avg_duration_m 
,sum(price_rub) as revenue_rub
,round(count(id) filter (where is_free = 1):: numeric / count(id) * 100 ,2) as free_trips_pct
,sum(distance_m) / 1000 as sum_distance_km 
from {{ref('trips_prep')}}
where started_at >= '2023-01-01'