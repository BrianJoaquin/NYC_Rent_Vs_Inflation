# NYC Rent Trends vs Inflation (2015–2024)

This project began as an exploration of rental price trends across Brooklyn, Manhattan, and Queens from 2015 to 2024, with a focus on the impact of COVID-19. I observed a strong correlation between the boroughs' rent trends, but also noticed that prices accelerated more rapidly after the pandemic. This led me to expand the analysis to include overall NYC rent and compare it to inflation over the same period — leading to an astonishing finding: at its peak in November 2022, NYC rent had increased by 16% more than the inflation rate. Using PostgreSQL, I analyzed rental data from StreetEasy and CPI data from the Bureau of Labor Statistics, and visualized the results in Tableau.

---

##  Overview

-  **Goal**: Understand how rental trends shifted over time, particularly around the COVID-19 pandemic, and how they compare to inflation.
-  **Tools Used**: PostgreSQL, Tableau Public, Microsoft Excel
-  **Data Sources**:
  - NYC Rent Index: [StreetEasy Rental Index](https://streeteasy.com/blog/data-dashboard/)
  - Inflation Data: [BLS CPI 12-Month Percent Change](https://www.bls.gov/)

---

##  Key Insights

- **COVID-19 Impact**: Rents dropped sharply starting around mid-2020, with Manhattan hit hardest.
- **Post-COVID Recovery**: Rental prices surged in 2022–2023, alongside record inflation.
- **Inflation vs Rent**: Rent trends lagged behind CPI changes but eventually caught up by 2022.

---

##  Analysis Breakdown

### 1. **Data Cleaning & Transformation**
- Imported CSVs into **PostgreSQL**.
- Converted dates and created proper time-series fields.
- Calculated YoY percent changes using SQL `LAG()` and rolling averages with window functions.

