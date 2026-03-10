Revenue Driver Analysis Using GA4 Data

Project Overview

This project investigates the behavioural drivers of ecommerce revenue using the Google Analytics 4 public dataset.

The goal is to understand which user behaviours and traffic characteristics most strongly influence total revenue.

The analysis combines SQL-based feature engineering with regression modelling.


Dataset

Source

GA4 Obfuscated Sample Dataset

Table
bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*

Key characteristics
	•	Data Scale: ~30k rows per event table (Physical: 1.31 MB | Logical: 22.84 MB)
	•	Nested GA4 schema
	•	Ecommerce interaction events

Data processing was performed in Google BigQuery.

Feature Engineering

Behavioural features were aggregated at the user level:
product_views
cart_additions
checkout_starts
promo_clicks

Categorical variables included:
traffic_source.medium
device.category

These were converted into machine-learning features using One-Hot Encoding.

Machine Learning Model

A linear regression model was trained using Python.

Libraries used:
	•	pandas
	•	scikit-learn
	•	matplotlib

Feature scaling was applied using StandardScaler.

Model performance:
R² = 0.253

Results

Feature Importance

The regression coefficients reveal the behavioural factors most strongly associated with revenue.
images

Key Findings

1 Checkout behaviour drives revenue

Checkout initiation shows the strongest relationship with revenue.

Users reaching the checkout stage are significantly more likely to generate revenue.

⸻

2 Promotion clicks show negative association

Promotion clicks correlate negatively with revenue.

This may indicate that certain promotions attract low-intent users.

⸻

3 Behaviour outweighs acquisition

User engagement within the shopping journey explains more revenue variation than traffic source or device type.

Tech Stack

SQL(Google BigQuery)

Python

Libraries
	•	pandas
	•	matplotlib
	•	scikit-learn
