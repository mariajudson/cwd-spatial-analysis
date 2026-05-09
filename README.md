# US Chronic Wasting Disease (CWD) — Spatial Distribution Analysis
### Wild and Captive Positive Cervid Populations | Exploratory Data Analysis

*Data Analytics Portfolio Project · Python · Power BI · Spatial Analysis*

---

## Overview

Chronic Wasting Disease (CWD) is a fatal prion disease affecting cervid populations (deer, elk, moose) across North America, with significant implications for wildlife management and public health surveillance. This project explores the geographic distribution of CWD in both wild and captive cervid populations across the United States, using official USGS surveillance data.

Python was used for data cleaning, aggregation, and exploratory analysis. Power BI was used to build an interactive dashboard for spatial visualization and dynamic filtering. The analysis surfaces state-level patterns, quantifies the disparity between wild and captive disease burden, and identifies high-risk states where both populations are affected.

---

## Objectives

1. Identify states with the highest number of CWD-affected counties in wild and captive populations;
2. Quantify and compare disease burden between wild and captive cervids at the state level;
3. Identify geographic overlap states where both populations are affected, potential bidirectional transmission zones;
4. Deliver an interactive dashboard for exploratory surveillance analysis.

---

## Tools & Stack

| Layer | Tool |
|---|---|
| Data cleaning & analysis | Python (pandas, matplotlib, seaborn) |
| Notebook environment | Jupyter Notebook / Google Colab |
| Interactive visualization | Power BI |

---

## Data Source

**U.S. Geological Survey (USGS)** — CWD Distribution in the US by State and County (ver. 3.0, June 2025)

---

## Key Insights

| # | Finding |
|---|---|
| 1 | **Regional concentration:** CWD clusters heavily in Midwestern states. Nebraska leads wild presence with 68 affected counties, followed by Kansas and Wisconsin. |
| 2 | **Wild > Captive burden:** Wild populations affect 36 states and 593 counties vs. 22 states and 166 counties for captive — roughly 3.6× more counties. |
| 3 | **Wisconsin & Colorado outliers:** These states show the highest captive-to-wild county ratio, suggesting elevated captive facility exposure or documented spillover risk. |
| 4 | **Surveillance gap hypothesis:** The lower geographic spread in captive populations may partially reflect differences in surveillance intensity rather than true disease absence. |

---

## Dashboard Preview

![Full Power BI Dashboard](images/wild_cwd_dashboard.png)
*Figure 1. Interactive Power BI dashboard showing wild CWD spatial distribution across 36 U.S. states.*

![Wild vs Captive CWD Distribution](images/wild_vs_captive.png)
*Figure 2. Comparative spatial distribution of wild and captive CWD cases across U.S. states.*

![Top 10 States — Captive CWD](images/top10_captive.png)
*Figure 3. Top 10 U.S. states reporting captive CWD presence, ranked by number of affected counties.*

---

## Analytical Approach

- Loaded and standardized raw USGS CSV datasets (wild and captive)
- Aggregated data at the state level by count of CWD-positive counties
- Merged wild and captive datasets to enable direct population comparison
- Calculated wild-to-captive county ratios to identify epidemiological outliers
- Exported clean, aggregated data for Power BI dashboard development

---

## Repository Structure

```
cwd-spatial-analysis/
├── notebooks/
│   └── cwd_analysis.ipynb       # Full Python analysis
├── images/
│   ├── wild_cwd_dashboard.png
│   ├── wild_vs_captive.png
│   └── top10_captive.png
└── README.md
```

---

## Notebook

[View the full Python analysis →](https://github.com/mariajudson/cwd-spatial-analysis/blob/main/notebooks/cwd_analysis.ipynb)

---

## Author

**Dr. Maria Julia Judson, DVM, MSc**
Veterinarian · Data Analyst · Wildlife Epidemiology
PhD Student in Health Technology

*Open to data analytics roles*
