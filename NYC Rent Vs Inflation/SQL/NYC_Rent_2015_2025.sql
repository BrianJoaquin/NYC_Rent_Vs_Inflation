select
	"Month" as "Date",
	"Brooklyn",
	"Manhattan",
	"Queens"
from
	public.nyc_rent_index
where
	"Month" between '2015-1-1' and '2024-12-31'

