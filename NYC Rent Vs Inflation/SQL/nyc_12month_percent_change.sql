with yoy_change as (
	select
		"Month" as "Date",
		"NYC", 
		lag("NYC", 12) over (order by "Month") as prev_nyc
	from nyc_rent_index),
percent_change as (
	select
		"Date",
		round((("NYC" - prev_nyc) / prev_nyc::numeric) * 100, 2) as percent_nyc
	from yoy_change),
rolling_avg_percent_change as (
	select 
		"Date",
		percent_nyc,
		round(avg(percent_nyc) over ( order by "Date" rows between 11 preceding and current row), 2)
		as rolling_nyc
	from percent_change)
select "Date", "rolling_nyc" as "NYC 12 Month Percent Change" from rolling_avg_percent_change
where "Date" between '2015-1-1' and '2024-12-31'
