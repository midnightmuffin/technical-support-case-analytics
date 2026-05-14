-- 02_create_views.sql
-- Analytical views for the Technical Support Case Analytics project.
-- These views prepare the data for Power BI reporting.

-- 1. Executive summary view
CREATE OR REPLACE VIEW vw_case_summary AS
SELECT
    COUNT(*) AS total_cases,
    SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END) AS closed_cases,
    SUM(CASE WHEN case_status = 'Open' THEN 1 ELSE 0 END) AS open_cases,
    SUM(CASE WHEN case_status = 'Pending Customer' THEN 1 ELSE 0 END) AS pending_customer_cases,
    SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) AS cases_within_sla,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS cases_outside_sla,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END), 0),
        2
    ) AS sla_compliance_rate,
    ROUND(
        AVG(actual_resolution_days),
        2
    ) AS avg_resolution_days
FROM support_cases;


-- 2. Monthly case volume view
CREATE OR REPLACE VIEW vw_monthly_case_volume AS
SELECT
    TO_CHAR(DATE_TRUNC('month', created_date), 'YYYY-MM') AS case_month,
    COUNT(*) AS total_cases
FROM support_cases
GROUP BY DATE_TRUNC('month', created_date)
ORDER BY DATE_TRUNC('month', created_date);


-- 3. Monthly SLA compliance view
CREATE OR REPLACE VIEW vw_monthly_sla_compliance AS
SELECT
    TO_CHAR(DATE_TRUNC('month', closed_date), 'YYYY-MM') AS closed_month,
    COUNT(*) AS closed_cases,
    SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) AS cases_within_sla,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS cases_outside_sla,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS sla_compliance_rate
FROM support_cases
WHERE case_status = 'Closed'
GROUP BY DATE_TRUNC('month', closed_date)
ORDER BY DATE_TRUNC('month', closed_date);


-- 4. Product component performance view
CREATE OR REPLACE VIEW vw_component_performance AS
SELECT
    product_component,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END) AS closed_cases,
    SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) AS cases_within_sla,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS breached_cases,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END), 0),
        2
    ) AS breach_rate,
    ROUND(
        AVG(actual_resolution_days),
        2
    ) AS avg_resolution_days
FROM support_cases
GROUP BY product_component
ORDER BY total_cases DESC;


-- 5. Root cause distribution view
CREATE OR REPLACE VIEW vw_root_cause_distribution AS
SELECT
    root_cause_category,
    COUNT(*) AS total_cases
FROM support_cases
WHERE root_cause_category IS NOT NULL
  AND root_cause_category <> ''
GROUP BY root_cause_category
ORDER BY total_cases DESC;


-- 6. Priority performance view
CREATE OR REPLACE VIEW vw_priority_performance AS
SELECT
    case_priority,
    COUNT(*) AS total_cases,
    SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END) AS closed_cases,
    SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END) AS cases_within_sla,
    SUM(CASE WHEN sla_met = 'No' THEN 1 ELSE 0 END) AS cases_outside_sla,
    ROUND(
        100.0 * SUM(CASE WHEN sla_met = 'Yes' THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN case_status = 'Closed' THEN 1 ELSE 0 END), 0),
        2
    ) AS sla_compliance_rate,
    ROUND(
        AVG(actual_resolution_days),
        2
    ) AS avg_resolution_days
FROM support_cases
GROUP BY case_priority
ORDER BY case_priority;
