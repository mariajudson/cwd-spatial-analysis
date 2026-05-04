## Data Analytics Portfolio Project | Power BI | Spatial Analysis

# US Chronic Wasting Disease (CWD) - Exploratory Data Analysis/Wild and Captive Positive Cervid Population Distribution

## Overview
This project explores the geographic distribution of Chronic Wasting Disease (CWD) in both wild and captive cervid populations across the United States.
Using Python for data processing and Power BI for visualization, the analysis highlights spatial patterns, state-level differences, and contrasts between wild and captive disease presence.

## Objectives
- Identify states with the highest number of CWD-affected counties;
- Compare disease distribution between wild and captive populations;
- Develop an interactive dashboard for exploratory analysis.

## Tools Used
- Python (Jupyter Notebook / Colab) – data cleaning and manipulation;
- Power BI – interactive dashboard and visualizations.

## Data Source
U.S. Geological Survey (USGS) – CWD distribution in the US by state and county (ver. 3.0, June 2025).

## Key Features
- Bar charts ranking states by number of affected counties;
- Interactive map showing disease distribution by state in wild cervid populations;
- Dynamic filtering using slicers (number of affected counties by state);



## Dashboard Preview
![Full Power BI Dashboard](images/wild_cwd_dashboard.png)

*Figure 1. Interactive Power BI dashboard showing wild CWD spatial distribution across 36 U.S. states.*


## Key Visualization

![CWD Top 15 States Graph](images/top10_captive.png)

*Figure 2. Top 10 U.S. States reporting captive CWD presence, in decreasing order.*


## Additional Visualization

![Wild vs Captive CWD Distribution Map](images/wild_vs_captive.png)

*Figure 3. Spatial distribution of wild and captive CWD cases across U.S. states, highlighting differences in geographic spread between populations.*


## Key Insights
- CWD cases are regionally concentrated, particularly in Midwestern states, indicating spatial clustering rather than uniform national distribution.
- Wild cervid populations show consistently higher geographic spread compared to captive populations.
- States such as Wisconsin and Colorado present relatively higher captive CWD presence, suggesting potential epidemiological or surveillance differences.
- The broader distribution in wild populations reflects complex transmission dynamics in free-ranging systems.


## Analysis Highlights

This analysis emphasizes the importance of wildlife surveillance and spatial monitoring in understanding and managing CWD spread.
The comparison between wild and captive populations provides insights into disease ecology, control challenges, and potential risk interfaces.

## Analytical Approach
- Data cleaning and preprocessing in Python;
- Aggregation at the state level (number of affected counties);
- Integration of wild and captive datasets;
- Comparative analysis between populations;
- Development of interactive visualizations in Power BI.

## Notebook
[View the full Python analysis](https://github.com/mariajudson/cwd-spatial-analysis/blob/main/cwd_project_v4.ipynb)

## Author
*Dr. Maria Julia Judson, DVM, MSC.*
