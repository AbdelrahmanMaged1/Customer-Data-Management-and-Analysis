# Customer Data Management and Analysis

## Overview
This project was developed as part of the Digital Egypt Pioneers Initiative (DEPI) to implement a comprehensive **Customer Data Management System**, integrating database design, data warehousing, and data visualization. The project covers the full lifecycle, from database design to building visualizations using Python and Power BI.

## Project Phases
1. **Database Design**:  
   - Created a relational database with key entities such as **Customers**, **Orders**, **Products**, **Payments**, and **Sellers**.
   - Designed ERD and implemented stored procedures, views, and indexes for optimizing performance.

2. **Data Warehouse Schema**:  
   - Implemented a **Star Schema** for efficient querying and reporting.
   - Fact table: **FactOrders**  
   - Dimension tables: **DimCustomer**, **DimProduct**, **DimSeller**, **DimShippingMethod**, **DimPayment**, and **DimDate**.

3. **ETL Process**:  
   - Extracted data from the transactional database, transformed it, and loaded it into the data warehouse using **SQL Server Integration Services (SSIS)**.

4. **Visualizations**:  
   - Created data visualizations using **Python** for detailed data analysis.
   - Designed interactive **Power BI dashboards** to provide insights into sales, customer behavior, and product performance.

## Technologies Used
- **SQL Server** for database and data warehouse implementation.
- **SSIS** for ETL processes.
- **Python** for data analysis and visualization.
- **Power BI** for business intelligence dashboards.

## Visualizations
- **Python**: 
  - Top 10 customers by total amount spent.
  - Top 5 products by the number of transactions.
- **Power BI**: 
  - Dashboards showing total sales, average seller salary, sales by category, orders by salesperson, etc.

## Team Members
- Abdelrahman Maged
- Mariem Ehab
- Roqia Nabil
- Ahmed AbdElmohaimen
- Alaa Mahdy
- Ali Shaaban

## Conclusion
We successfully created an integrated customer data management solution, from database design to visualization, providing valuable business insights through data reporting and analysis.

---
