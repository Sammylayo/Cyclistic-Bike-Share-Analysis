# Cyclistic Bike-Share Analysis: README
## Project Overview
This project analyzes the usage patterns of the Cyclistic bike-share program in Chicago. The primary goal is to understand the differences in behavior between casual riders and annual members. The insights gathered will help Cyclistic tailor marketing strategies to convert casual riders into annual members and improve overall user experience.

## Contents
1. [Introduction](#introduction)
2. [Data Extraction and Cleaning]
3. [Data Analysis]
4. [Visualizations]
5. [Key Insights and Recommendations]
6. [Files Included]
7. [Setup and Usage]

## Introduction <a name="introduction"></a>

Cyclistic offers bike rentals to both casual riders and annual members. This analysis investigates ride durations, temporal patterns, and geographic distributions to identify distinct usage patterns.

Data Extraction and Cleaning
Tools Used: SQL, R

SQL: Monthly data was extracted and cleaned using SQL queries.
R: Further analysis and visualization were conducted using R.
SQL Data Retrieval:

r
Copy code
# Setting up the connection
con <- dbConnect(odbc::odbc(), Driver = "SQL Server", Server = server, Database = database, Trusted_Connection = "Yes")

# Fetching the data
query <- "SELECT * FROM CycleData"
df <- dbGetQuery(con, query)
Data Analysis
Summary Statistics:

Casual riders have a higher average trip duration (~28 mins) compared to annual members (~12 mins).
Casual riders show higher variability in trip durations.
Peak usage times differ, with casual riders peaking in late morning and afternoon, while annual members peak during commute hours.
Temporal Patterns:

Hourly: Casual riders peak in late morning and afternoon; annual members peak during commute hours.
Weekly: Casual riders peak on weekends; annual members show consistent usage throughout the week with slight peaks on weekdays.
Seasonal: Both groups peak in summer months, with casual riders showing more seasonal variability.
Geographic Distribution:

Differences in popular ride start locations for casual riders and annual members.
Visualizations
Average and Count of Trips:
Median and Outliers:
Mode and Standard Deviation:
Hourly Ride Trend:
Weekly Analysis:
Monthly Ride Trend:
Geographic Analysis:
Key Insights and Recommendations
Promotional Offers: Introduce seasonal and trial memberships to attract casual riders.
Marketing Campaigns: Focus on commute incentives and leisure benefits to convert casual riders to annual members.
Digital Strategy: Use targeted ads and engaging content.
Service Improvements: Enhance top stations and provide exclusive perks for members.
Community and Events: Organize member-exclusive events and form local partnerships.
Files Included
Cyclistic_Bike-Share_Analysis.pptx: PowerPoint presentation with detailed analysis and visualizations.
Cyclistic_Bike-Share_Analysis.docx: Detailed report with methodology, analysis, and insights.
Setup and Usage
Install Necessary Packages:

r
Copy code
install.packages(c("odbc", "DBI", "tidyverse", "skimr", "janitor", "tibble", "ggplot2", "kableExtra"))
Load Libraries:

r
Copy code
library(odbc)
library(DBI)
library(tidyverse)
library(skimr)
library(janitor)
library(tibble)
library(ggplot2)
library(knitr)
library(dplyr)
library(kableExtra)
Database Connection:

r
Copy code
server <- 'SAMMYLAYO\\SQLEXPRESS02'
database <- 'Cyclisist'
con <- dbConnect(odbc::odbc(), Driver = "SQL Server", Server = server, Database = database, Trusted_Connection = "Yes")
Run Analysis:

Execute the SQL query to fetch data.
Use the provided R scripts for data cleaning, analysis, and visualization.
