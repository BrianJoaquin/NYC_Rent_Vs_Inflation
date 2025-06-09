SELECT 
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
ORDER BY "Date"