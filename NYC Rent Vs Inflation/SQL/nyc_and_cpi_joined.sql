select 
	nyc."Date",
	nyc."NYC 12 Month Percent Change", 
	cpi."CPI Percentage Change"
from 
	(with yoy_change as (
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
	where "Date" between '2015-1-1' and '2024-12-31') nyc
join 
	(SELECT 
	  TO_DATE("Year" || '-' || "Month" || '-01', 'YYYY-MM-DD') AS "Date",
	  "Value" as "CPI Percentage Change"
	FROM (
	  SELECT "Year", '01' AS "Month", "jan" AS "Value" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '02', "feb" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '03', "mar" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '04', "apr" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '05', "may" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '06', "jun" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '07', "jul" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '08', "aug" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '09', "sep" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '10', "oct" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '11', "nov" FROM cpi_12month_percent_change
	  UNION ALL
	  SELECT "Year", '12', "Dec" FROM cpi_12month_percent_change
	)
	ORDER BY "Date") cpi
on
	nyc."Date" = cpi."Date"
