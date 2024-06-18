# Cyclistic Bike-Share Analysis: README
## Project Overview
This project analyzes the usage patterns of the Cyclistic bike-share program in Chicago. The primary goal is to understand the differences in behavior between casual riders and annual members. The insights gathered will help Cyclistic tailor marketing strategies to convert casual riders into annual members and improve overall user experience. You can explore the dataset at: https://divvytripdata.s3.amazonaws.com/index.html
## Contents
1. [Introduction](#introduction)
2. [Data Extraction and Cleaning](#section2)
3. [Data Analysis](#section3)
4. [Visualizations](#section4)
5. [Key Insights and Recommendations](#section5)
6. [Files Included](#section6)
7. [Setup and Usage](#section7)

## Introduction <a name="introduction"></a>

Cyclistic offers bike rentals to both casual riders and annual members. This analysis investigates ride durations, temporal patterns, and geographic distributions to identify distinct usage patterns.

## Data Extraction and Cleaning <a name="section2"></a>
Tools Used: 
- SQL: Monthly data was extracted and cleaned using SQL queries.
- R: Further analysis and visualization were conducted using R.

## SQL Data Retrieval:

### Setting up the connection from R to SQL
con <- dbConnect(odbc::odbc(), Driver = "SQL Server", Server = server, Database = database, Trusted_Connection = "Yes")

### Fetching the data from SQL
- query <- "SELECT * FROM CycleData"
- df <- dbGetQuery(con, query)

## Data Analysis <a name="section3"></a>
### Summary Statistics:
- Casual riders have a higher average trip duration (~28 mins) compared to annual members (~12 mins).
- Casual riders show higher variability in trip durations.
- Peak usage times differ, with casual riders peaking in late morning and afternoon, while annual members peak during commute hours.
### Temporal Patterns:
- **Hourly**: Casual riders peak in late morning and afternoon; annual members peak during commute hours.
- **Weekly**: Casual riders peak on weekends; annual members show consistent usage throughout the week with slight peaks on weekdays.
- **Seasonal**: Both groups peak in summer months, with casual riders showing more seasonal variability.
- **Geographic** Distribution: Scatter plot showing start stations for both casual riders and annual members
- Differences in popular ride start locations for casual riders and annual members.

## Visualizations <a name="section4"></a>
- Average Dureation of Trips
- Total Amount of Trips 
- Median of Trip Duration
- Outliers
- Mode
- Standard Deviation of Trip Duration
- Hourly Ride Trend
- Weekly Analysis
- Monthly Ride Trend
- Geographic Analysis

## Key Insights and Recommendations <a name="section5"></a>
- **Promotional Offers**: Introduce seasonal and trial memberships to attract casual riders.
- **Marketing Campaigns**: Focus on commute incentives and leisure benefits to convert casual riders to annual members.
- **Digital Strategy**: Use targeted ads and engaging content.
- **Service Improvements**: Enhance top stations and provide exclusive perks for members.
- **Community and Events**: Organize member-exclusive events and form local partnerships.

## Files Included <a name="section6"></a>
- Cyclistic_Bike-Share_Analysis.pptx: PowerPoint presentation with detailed analysis and visualizations.
- Cyclistic_Bike-Share_Analysis.docx: Detailed report with methodology, analysis, and insights.
- PNG: Plots of each visualization
- Cyclistic Dataset : https://divvy-tripdata.s3.amazonaws.com/index.html

## Setup and Usage <a name="section7"></a>
### Install Necessary Packages
install.packages(c("odbc", "DBI", "tidyverse", "skimr", "janitor", "tibble", "ggplot2", "kableExtra"))
### Load Libraries
- **odbc**: Facilitates database connectivity in R through ODBC (Open Database Connectivity), enabling interaction with various database management systems.
- **DBI**: Defines a consistent interface between R and databases, offering methods for connecting to databases, executing queries, and managing data retrieval.
- **tidyverse**: A cohesive collection of R packages for modern data science, including dplyr (data manipulation), ggplot2 (visualization), tidyr (data tidying), readr (data import), and other tools designed to work together seamlessly.
- **skimr**: Provides concise summaries (skims) of datasets, offering quick insights into data structure, missing values, and summary statistics.
- **janitor**: Offers functions for data cleaning and tidying tasks in R, including renaming columns, removing empty rows/columns, and transforming data into a more manageable format.
- **tibble**: Enhances data frames in R (tibbles) with additional features for easier and more intuitive data manipulation, focusing on improved printing and subsetting capabilities.
- **ggplot2**: A versatile package for creating graphics and visualizations in R, utilizing a layered grammar of graphics approach to build complex plots from data.
- **knitr**: Enables dynamic report generation by integrating R code and output into documents (HTML, PDF, etc.), facilitating reproducible research and automated report generation.
- **dplyr**: Provides a set of functions for data manipulation tasks such as filtering, summarizing, mutating (creating new columns), and arranging data, optimizing performance with data frames.
- **kableExtra**: Extends table formatting capabilities in R Markdown documents generated with knitr, allowing customization of tables with advanced styling options for publication-quality outputs.
### Database Connection
- server <- 'SAMMYLAYO\\SQLEXPRESS02'
- database <- 'Cyclisist'
- con <- dbConnect(odbc::odbc(), Driver = "SQL Server", Server = server, Database = database, Trusted_Connection = "Yes")
### Run Analysis
- Execute the SQL query to fetch data.
- Use the provided R scripts for data cleaning, analysis, and visualization.
