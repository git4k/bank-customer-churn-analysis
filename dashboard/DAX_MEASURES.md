# Power BI DAX Measures

## Advanced DAX Functions Used in This Project

### 1. Basic Aggregation Measures

```dax
Total Customers = COUNTROWS(bank_churn)

Total Churned = 
CALCULATE(
    COUNTROWS(bank_churn),
    bank_churn[Exited] = 1
)

Total Retained = 
CALCULATE(
    COUNTROWS(bank_churn),
    bank_churn[Exited] = 0
)
```

### 2. Statistical & Percentage Measures

```dax
Churn Rate = 
DIVIDE(
    [Total Churned],
    [Total Customers],
    0
)

Churn Rate % = 
FORMAT([Churn Rate], "0.00%")

Retention Rate = 
1 - [Churn Rate]

Retention Rate % = 
FORMAT([Retention Rate], "0.00%")
```

### 3. Filter Context Measures

```dax
Avg Balance Churned = 
CALCULATE(
    AVERAGE(bank_churn[Balance]),
    bank_churn[Exited] = 1
)

Avg Balance Retained = 
CALCULATE(
    AVERAGE(bank_churn[Balance]),
    bank_churn[Exited] = 0
)

Avg Age Churned = 
CALCULATE(
    AVERAGE(bank_churn[Age]),
    bank_churn[Exited] = 1
)
```

### 4. Conditional & Logical Measures

```dax
High Risk Customers = 
CALCULATE(
    COUNTROWS(bank_churn),
    bank_churn[Age] >= 46,
    bank_churn[Age] <= 60,
    bank_churn[Geography] = "Germany"
)

High Value Churned = 
CALCULATE(
    COUNTROWS(bank_churn),
    bank_churn[Exited] = 1,
    bank_churn[Balance] > 100000
)

Risk Level = 
SWITCH(
    TRUE(),
    [Churn Rate] >= 0.30, "Critical",
    [Churn Rate] >= 0.20, "High",
    [Churn Rate] >= 0.10, "Medium",
    "Low"
)
```

### 5. Time Intelligence Functions (if date column available)

```dax
// Example for time-based analysis
Churn Rate MTD = 
CALCULATE(
    [Churn Rate],
    DATESMTD(bank_churn[Date])
)

Churn Rate YTD = 
CALCULATE(
    [Churn Rate],
    DATESYTD(bank_churn[Date])
)

Previous Month Churn = 
CALCULATE(
    [Churn Rate],
    PREVIOUSMONTH(bank_churn[Date])
)
```

### 6. Ranking & Top N Measures

```dax
Customer Rank by Balance = 
RANKX(
    ALL(bank_churn),
    [Balance],
    ,
    DESC,
    DENSE
)

Top 10% Customers = 
IF(
    [Customer Rank by Balance] <= [Total Customers] * 0.1,
    "Top 10%",
    "Others"
)
```

### 7. Text & Formatting Measures

```dax
Churn Status = 
IF(
    SELECTEDVALUE(bank_churn[Exited]) = 1,
    "Churned",
    "Retained"
)

Geography Summary = 
"Churn Rate in " & SELECTEDVALUE(bank_churn[Geography]) & 
" is " & FORMAT([Churn Rate], "0.00%")
```

### 8. Advanced Statistical Measures

```dax
Std Dev Balance = 
STDEV.P(bank_churn[Balance])

Median Age = 
MEDIAN(bank_churn[Age])

Balance Variance = 
VAR.P(bank_churn[Balance])

Correlation Age Balance = 
// Custom correlation calculation
VAR AvgAge = AVERAGE(bank_churn[Age])
VAR AvgBalance = AVERAGE(bank_churn[Balance])
RETURN
    SUMX(
        bank_churn,
        (bank_churn[Age] - AvgAge) * (bank_churn[Balance] - AvgBalance)
    ) / [Total Customers]
```

### 9. Dynamic Measures with Parameters

```dax
Selected Metric = 
SWITCH(
    SELECTEDVALUE('Metric Selector'[Metric]),
    "Churn Rate", [Churn Rate],
    "Avg Balance", AVERAGE(bank_churn[Balance]),
    "Avg Age", AVERAGE(bank_churn[Age]),
    "Total Customers", [Total Customers],
    BLANK()
)
```

### 10. Row Level Security (RLS) DAX

```dax
// RLS for Geography-based access
[Geography] = USERNAME()

// Or for email-based access
[Geography] = LOOKUPVALUE(
    Users[Geography],
    Users[Email],
    USERPRINCIPALNAME()
)
```

---

## Power BI Features Implemented

### Interactive Features
- ✅ Bookmarks for different dashboard views
- ✅ Sync Slicers across multiple pages
- ✅ Drill-Through filters for detailed analysis
- ✅ Edit Interactions for custom visual behavior
- ✅ Tooltips with additional context

### Data Model
- ✅ Star schema with fact and dimension tables
- ✅ Relationships and bridge tables
- ✅ Calculated columns and measures
- ✅ Hierarchies for drill-down

### Power BI Service
- ✅ Published reports to workspace
- ✅ Scheduled refresh configuration
- ✅ Row Level Security (RLS) implementation
- ✅ Report subscriptions for stakeholders
- ✅ Power BI Apps for distribution

---

## Usage in Dashboard

These DAX measures power the following visuals:
1. **KPI Cards**: Churn Rate, Retention Rate, Total Customers
2. **Bar Charts**: Churn by Geography, Gender, Products
3. **Line Charts**: Trend analysis over time
4. **Tables**: Detailed customer lists with risk scores
5. **Conditional Formatting**: Color-coded risk levels
