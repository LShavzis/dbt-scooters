with daily_trips_by_age as 
(
select
distinct(started_at :: date) as date
,count(trips.id) as trips
,extract(year from age (trips.started_at ::date, users.birth_date)) as user_age
from dev_487w.scooters_raw.trips trips
left join dev_487w.scooters_raw.users users on trips.user_id = users.id 
group by date, user_age
)

select
user_age as age
,round(avg(trips),2) as avg_trips
from daily_trips_by_age
group by age
order by age asc