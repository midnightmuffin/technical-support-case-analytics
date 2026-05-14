# Technical Support Case Analytics

## Project Overview

This project analyzes technical support case data to identify trends in case volume, SLA compliance, resolution time, affected product components, and root cause categories.

The goal is to simulate a real business analytics scenario where support leadership needs visibility into operational performance and recurring issues.

## Business Questions

1. How many support cases were created each month?
2. Which product component receives the most cases?
3. What is the average resolution time by priority?
4. What percentage of closed cases met the SLA?
5. Which region has the highest case volume?
6. Which root cause category appears most often?
7. Which owner team handles the most critical cases?
8. Are P1 cases being resolved within SLA?
9. Which components have the highest SLA breach rate?
10. Is the case volume increasing or decreasing over time?

## Tools

- SQL for analysis
- Power BI for dashboarding
- Excel or CSV for initial data storage
- GitHub for documentation and portfolio presentation

## Dataset

The dataset is fictional and was created for learning and portfolio purposes. It represents technical support cases across multiple regions, components, priorities, statuses, root cause categories, and support teams.

## Repository Structure

```text
technical-support-case-analytics/
├── data/
│   ├── raw/
│   │   └── support_cases_raw.csv
│   └── processed/
│       └── support_cases_clean.csv
├── sql/
│   ├── 00_create_table.sql
│   └── 01_kpi_queries.sql
├── powerbi/
├── images/
├── data_dictionary.md
├── insights.md
└── README.md
```

## Initial Insights

Initial insights will be added after running the SQL analysis and building the first dashboard.

## Next Steps

1. Load the CSV into a SQL database or analysis tool.
2. Run the SQL queries in the `sql` folder.
3. Build a Power BI dashboard.
4. Add dashboard screenshots to the `images` folder.
5. Document the final business insights in `insights.md`.
