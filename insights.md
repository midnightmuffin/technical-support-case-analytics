# Insights

This file will be updated as the analysis progresses.

## Questions to Answer

1. What is the overall SLA compliance rate?
2. Which priority level has the highest SLA breach rate?
3. Which product component generates the highest number of cases?
4. Which region generates the highest number of cases?
5. Which root cause category appears most frequently?
6. Are high-priority cases being resolved faster than low-priority cases?
7. Which team handles the highest number of escalated cases?
8. Is case volume increasing, decreasing, or stable over time?

## Initial Findings

The dataset contains 500 fictional technical support cases. Out of these, 449 cases are closed, 37 remain open, and 14 are pending customer action. This means that approximately 89.8% of all cases in the dataset are closed.

Most cases are medium-priority incidents. P3 cases represent the largest group with 213 cases, followed by P2 with 135 cases, P4 with 105 cases, and P1 with 47 cases.

Integration Server is the product component with the highest case volume, accounting for 170 cases, or 34% of the total dataset. This suggests that Integration Server should be closely monitored in the dashboard as a major driver of support workload.

SLA compliance is a key concern in this dataset. Out of 449 closed cases, only 197 were resolved within SLA, while 252 breached the SLA target. This results in an overall SLA compliance rate of 43.88%, meaning that 56.12% of closed cases were resolved outside the expected target.

Average resolution time increases as priority decreases. P1 cases have an average resolution time of 4.65 days, P2 cases average 7.79 days, P3 cases average 10.54 days, and P4 cases average 13.12 days. However, P1 and P2 cases appear to be taking longer than their expected SLA targets, which may indicate an opportunity to improve critical case handling.
