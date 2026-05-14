-- 01_kpi_queries.sql
-- SQL queries for the Technical Support Case Analytics project.

-- 1. Total number of cases
SELECT
    COUNT(*) AS total_cases
FROM support_cases;

-- 2. Cases by status
SELECT
    case_status,
    COUNT(*) AS total_cases
FROM support_cases
GROUP BY case_status
ORDER BY total_cases DESC;

-- 3. Cases created by month
SELECT
    DATE_TRUNC('month', created_date) AS case_month,
    COUNT(*) AS total_cases
FROM support_cases
GROUP BY DATE_TRUNC('month', created_date)
ORDER BY case_month;

-- 4. Cases by product component
SELECT
    product_component,
    COUNT(*) AS total_cases
FROM support_cases
GROUP BY product_component
ORDER BY total_cases DESC;

-- 5. Average resolution time by priority
SELECT
    case_priority,
    ROUND(AVG(actual_resolution_days), 2) AS avg_resolution_days
FROM support_cases
WHERE actual_resolution_days IS NOT NULL
GROUP BY case_priority
ORDER BY case_priority;

-- 6. SLA compliance rate for closed cases
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_compliance_rate
FROM support_cases
WHERE case_status = 'Closed';

-- 7. SLA compliance by priority
SELECT
    case_priority,
    COUNT(*) AS closed_cases,
    SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) AS cases_within_sla,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS cases_outside_sla,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_compliance_rate
FROM support_cases
WHERE case_status = 'Closed'
GROUP BY case_priority
ORDER BY case_priority;

-- 8. Case volume by region
SELECT
    customer_region,
    COUNT(*) AS total_cases
FROM support_cases
GROUP BY customer_region
ORDER BY total_cases DESC;

-- 9. Most common root cause categories
SELECT
    root_cause_category,
    COUNT(*) AS total_cases
FROM support_cases
WHERE root_cause_category IS NOT NULL
  AND root_cause_category <> ''
GROUP BY root_cause_category
ORDER BY total_cases DESC;

-- 10. Components with highest SLA breach rate
SELECT
    product_component,
    COUNT(*) AS closed_cases,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS breached_cases,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS breach_rate
FROM support_cases
WHERE case_status = 'Closed'
GROUP BY product_component
HAVING COUNT(*) >= 10
ORDER BY breach_rate DESC;
