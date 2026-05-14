-- 00_create_table.sql
-- Generic SQL table structure for the technical support case dataset.
-- You may need to adjust data types depending on your SQL tool.

CREATE TABLE support_cases (
    case_id VARCHAR(20),
    created_date DATE,
    closed_date DATE,
    customer_region VARCHAR(100),
    product_component VARCHAR(100),
    case_priority VARCHAR(10),
    case_status VARCHAR(50),
    owner_team VARCHAR(100),
    root_cause_category VARCHAR(100),
    sla_target_days INTEGER,
    actual_resolution_days INTEGER,
    sla_met VARCHAR(10)
);
