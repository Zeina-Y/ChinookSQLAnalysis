# Chinook Database Analysis

## Introduction
In this project, we query the Chinook Database to gain insights into the media types, sales patterns, customer behavior, and genre trends in different countries. The Chinook Database contains information about a music store's media, customers, employees, and invoices.

## Database Schema
The schema for the Chinook Database is provided below. The columns that link tables together are shown via arrows.
![image](https://github.com/Zeina-Y/Project-in-SQL/assets/114132855/20f38be9-87ac-47f1-ad83-8ea28f5a6ec4)

## Project Details

### Question 1: Is there a relationship between media type and sales?
This query retrieves the count of invoices for each media type. It joins the MediaType, Track, and InvoiceLine tables to get the required data.

**Findings**:
- MPEG audio file has the highest number of invoices with 1976 invoices.
- Other media types have from moderate low to very low numbers of invoices.

**SQL Code:** [Link to SQL file](https://github.com/Zeina-Y/Project-in-SQL/blob/main/Chinook_Analysis.sql#L6)

### Question 2: What percentages of albums according to sales?
This query categorizes albums into high, mid, and low sales based on the amount spent. It calculates the total amount spent on each album and then assigns a category based on the amount.

**Findings**:
- Most albums have low sales.
- Few albums achieve high sales.

**SQL Code:** [Link to Question 2](https://github.com/Zeina-Y/Project-in-SQL/blob/main/Chinook_Analysis.sql#L18)


### Question 3: What are general trends in genres for the top 5 countries in invoice numbers?
This query identifies the top 3 genres in the top 5 countries by invoice number. It uses CTEs to first find the top 5 countries and then to rank genres within those countries.

**Findings**:
- The USA has the highest number of invoices.
The rock genre has the highest number of invoices for all 5 countries followed by the Latin genre.

**SQL Code:** [Link to Question 3](https://github.com/Zeina-Y/Project-in-SQL/blob/main/Chinook_Analysis.sql#L33)

### Question 4: Is there a relationship between a customer being in a company and sales?
This query examines the average invoice total for customers who are associated with a company versus those who are not. It categorizes customers based on whether the company field is null and then calculates the average total.

**Findings**:
- There is a subtle difference between both categories in average sales.
- Customers who are not associated with a company have a higher average invoice total compared to those who are associated with a company.

**SQL Code:** [Link to Question 4](https://github.com/Zeina-Y/Project-in-SQL/blob/main/Chinook_Analysis.sql#L61)

[Chinook Database Analysis - Visualizations and Interpretations](https://github.com/Zeina-Y/ChinookSQLAnalysis/blob/main/Visualization.pdf)

## Conclusion
This analysis provides insights into various aspects of the Chinook Database. It examines the relationship between media types and sales, categorizes albums according to sales, identifies trends in genres for the top 5 countries by invoice numbers, and explores the relationship between customers being in a company and sales. The findings can help the Chinook team make informed decisions regarding their media inventory and customer engagement strategies.


## Installation and Setup

1- Install a SQL database tool (e.g., SQLite, PostgreSQL).

2- Download the Chinook Database here. (https://github.com/Zeina-Y/ChinookSQLAnalysis/blob/main/chinook.db)

3- Load the database into your SQL tool.

## Usage
1- Copy the provided SQL queries.

2- Run the queries in your SQL environment.

3- Analyze the results.

## References
Chinook Database Information: https://github.com/lerocha/chinook-database


