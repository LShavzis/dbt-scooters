{{ config(materialized='table') }}
select 
distinct(started_at) :: date as date
,count(id) as trips
,max(price) / 100 as max_price_rub 
,round(AVG(distance):: numeric / 1000, 2) as avg_distance_km 
from dev_487w.scooters_raw.trips
group by started_at :: date
order by date asc