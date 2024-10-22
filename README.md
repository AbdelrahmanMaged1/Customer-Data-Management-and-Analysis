# Customer Data Management and Analysis Project

## Overview

This project focuses on building an end-to-end **Customer Data Management System** that integrates:
- A **Transactional Database** for handling customer orders and interactions.
- A **Data Warehouse** for reporting and analysis.
- **Data Visualizations** using Python and Power BI to explore insights.

## Project Phases

### 1. **Database Design**
- **Technologies**: SQL Server, SSMS
- Created an **Entity-Relationship Diagram (ERD)** for the main database tables: Customers, Transactions, Orders, Products, Sellers, and more.
- Implemented **stored procedures**, **views**, and **indexes** to optimize performance.

### 2. **Data Warehouse Schema**
- **Schema**: We implemented a **Star Schema** to support reporting.
  - **Fact Table**: FactOrders (stores key measures like quantity, total amount)
  - **Dimension Tables**: DimCustomer, DimProduct, DimSeller, DimDate, etc.
- **ETL Process**: SQL Server Integration Services (SSIS) was used to extract, transform, and load data from the transactional database into the Data Warehouse.

### 3. **Python Visualizations**
- **Tools**: Python, Pandas, Matplotlib, Seaborn
- Created insights like:
  - Top 10 Customers by Total Amount Spent
  - Top 5 Products by Number of Transactions

### 4. **Power BI Visualizations**
- **Tools**: Power BI
- Developed dynamic dashboards showing:
  - Total Sales
  - Average Seller Salary
  - Number of Orders and Sales by Category
  - Orders by Salesperson

## Installation and Usage

1. **SQL Database**: Set up the original database schema using the provided SQL scripts.
2. **ETL Process**: Use SSIS for the ETL process. Refer to the `ETL_SSIS_Package.dtsx` for the package details.
3. **Python Visualizations**: Install necessary Python libraries (`requirements.txt`), and run the Jupyter notebooks for the analysis.
4. **Power BI Dashboards**: Open the `.pbix` file to view interactive dashboards.

## Team Members
- Abdelrahman Maged
- Ahmed AbdElmohaimen
- Alaa Mahdy
- Mariem Ehab
- Roqia Nabil
- Ali Shaaban

