# Data Dictionary

| Column | Description |
|---|---|
| case_id | Unique identifier for each support case. |
| created_date | Date when the case was created. |
| closed_date | Date when the case was closed. Blank if the case is still open or pending. |
| customer_region | Customer region associated with the case. |
| product_component | Product or platform component involved in the case. |
| case_priority | Case severity or priority level. P1 is the highest priority. |
| case_status | Current status of the case. |
| owner_team | Team responsible for handling the case. |
| root_cause_category | Main cause identified for the issue. |
| sla_target_days | Expected resolution target in days based on priority. |
| actual_resolution_days | Actual number of days required to resolve the case. Blank if unresolved. |
| sla_met | Indicates whether the case was resolved within the SLA target. |
