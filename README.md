# GA4 Ecommerce Revenue Drivers Analysis

## Project Overview

This project explores which user behaviours are most strongly associated with ecommerce revenue using the **GA4 Obfuscated Sample Ecommerce Dataset**.

The dataset is provided by Google and **emulates a web ecommerce implementation**, replicating the event structure typically captured in real-world Google Analytics 4 tracking.

The goal of this project is to identify behavioural signals that are most predictive of revenue using regression modelling.

---

## Dataset

Dataset Source  
GA4 Obfuscated Sample Ecommerce Dataset

Platform  
Google BigQuery

Description  
This public dataset provided by Google simulates a real ecommerce website and contains event-level user interaction data typically collected via Google Analytics 4.

Dataset Scale

- ~2.4M event records analysed
- ~30k aggregated user-level observations
- Behavioural features engineered from event interactions

---

## Project Workflow

### 1. Data Extraction

Data was queried from the GA4 public dataset using SQL in BigQuery.

Key steps included:

- Filtering relevant event types
- Aggregating event data to the user level
- Creating behavioural features representing ecommerce funnel activity

Example behavioural signals:

- Product views
- Add-to-cart events
- Checkout initiation
- Promotion clicks
- Page views
- Device category
- Traffic source

---

### 2. Feature Engineering

Event-level data was transformed into **user-level behavioural features**.

Feature examples:

| Feature | Description |
|------|------|
| page_views | Number of pages viewed |
| product_views | Number of product detail views |
| add_to_cart | Add-to-cart interactions |
| begin_checkout | Checkout initiation events |
| promotion_click | Promotion interaction events |
| device_category | Device type (encoded) |
| traffic_source | Acquisition channel (encoded) |

Categorical variables were encoded using **One-Hot Encoding**.

---

### 3. Data Processing

The modelling pipeline included:

- Train-test split
- Feature scaling using **StandardScaler**
- Linear regression modelling

Tools used:

- Python
- pandas
- scikit-learn
- matplotlib
- seaborn

---

## Model

Model Type  
Linear Regression

Target Variable  
User-level total revenue

Evaluation Metric

R² = **0.253**

The model explains approximately **25% of the variance in revenue**, indicating that behavioural funnel interactions have measurable predictive power.

---

## Key Insights

![Overall Funnel Chart](images/Feature_Importance_Revenue_Drivers_V2.png)

### 1. Checkout Behaviour is the Strongest Revenue Signal

Checkout initiation shows the strongest association with revenue.

Standardised coefficient:

β = **12.27**

Implication

Users who initiate checkout are significantly more likely to generate higher revenue.

This suggests that **optimising the checkout experience could have a meaningful impact on revenue performance.**

---

### 2. The "Promotion Paradox"

Promotion clicks show a **negative association with revenue**.

β = **-0.59**

Possible interpretation:

Promotion interactions may attract **lower-intent users** or interrupt the purchase journey.

Implication

Promotional strategies may require **careful experimentation (e.g., A/B testing)** to ensure they improve conversion quality.

---

### 3. Behaviour Outweighs Acquisition

Traffic source and device category have relatively small effects compared with behavioural funnel signals.

Implication

**What users do on the site appears to matter more than how they arrive.**

---

## Key Takeaway

Revenue variation appears to be more strongly associated with **user behaviour within the shopping funnel** than with **traffic acquisition characteristics**.

In practical terms:

Acquisition brings users.  
Behaviour converts them.

---

## Visualisation

Feature importance was analysed using standardised regression coefficients.

Example output:

- Checkout initiation dominates revenue prediction
- Promotion clicks show a negative coefficient
- Behavioural funnel signals outperform acquisition features

---

## Tools & Technologies

- SQL
- Google BigQuery
- Python
- pandas
- scikit-learn
- matplotlib
- seaborn

---

## Repository Structure
