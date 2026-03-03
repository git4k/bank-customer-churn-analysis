# Power BI Dashboard Instructions

## Setup

1. Load `data/processed/bank_churn_clean.csv` into Power BI Desktop
2. Create the following visualizations:

## Visualizations

### 1. Overall Churn Rate (KPI Card)
- Field: Exited
- Calculation: Average * 100

### 2. Churn by Geography (Bar Chart)
- Axis: Geography
- Values: Count of Exited
- Legend: Exited

### 3. Age vs Churn (Box Plot)
- Category: Exited
- Values: Age

### 4. Balance Distribution (Histogram)
- Values: Balance
- Bins: 20

### 5. Active vs Inactive Members (Donut Chart)
- Legend: IsActiveMember
- Values: Count

## DAX Measures

Create these measures in Power BI:

```dax
Churn Rate = 
DIVIDE(
    COUNTROWS(FILTER(bank_churn, bank_churn[Exited]=1)), 
    COUNTROWS(bank_churn)
)

Avg Balance Churned = 
CALCULATE(
    AVERAGE(bank_churn[Balance]), 
    bank_churn[Exited]=1
)

Retention Rate = 1 - [Churn Rate]

Total Customers = COUNTROWS(bank_churn)

Churned Customers = 
CALCULATE(
    COUNTROWS(bank_churn),
    bank_churn[Exited]=1
)
```

## Color Scheme

- Churned: #E74C3C (Red)
- Retained: #2ECC71 (Green)
- Background: #ECF0F1 (Light Gray)
