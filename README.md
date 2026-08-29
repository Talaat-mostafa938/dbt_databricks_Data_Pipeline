# 🚀 Modern Data Engineering Project with databricks, dbt, Airflow, Power BI & Docker
![Pipeline](https://github.com/Talaat-mostafa938/dbt_databricks_Data_Pipeline/blob/main/images/Pipeline.jpg)

### 📌 Overview
---
### This project demonstrates a modern Data Engineering pipeline using:
* Databricks as the cloud data warehouse  
* dbt (Data Build Tool) for data modeling and transformation  
* Apache Airflow for workflow orchestration   
* Power BI for dashboard and reporting  
* Docker for containerization and environment setup   

### The data consists of 4 CSV files:
* orders.csv
* order_items.csv
* products.csv
* customers.csv
---

## ⚙️ Technologies Used
| **Tool** | **Role** |
|---|---|
| **Databricks** | Cloud data warehouse |
| **dbt** | Data transformation and modeling |
| **Airflow** | Workflow orchestration |
| **Power BI** | Dashboard and visualization |
| **Docker** | Containerization and environment setup |
---

## 🧱 dbt Models
### Staging Models
* stg_customers.sql 
* stg_orders.sql 
* stg_order_items.sql 
* stg_products.sql
  
These standardize and clean raw data from Snowflake.

### Mart Models
* fact_sales.sql 
---

## 🔄 Airflow Integration
Airflow is used to orchestrate dbt runs with:

Webserver, Scheduler, Worker & Flower
* DAG file: dags/dbt_dag.py
---

## 📊 Power BI Integration
After dbt models are materialized in Databricks:
  * Connect Power BI to Databricks via native connector.
  * Build visual dashboards showing:
![Dashboard](https://github.com/Talaat-mostafa938/dbt_databricks_Data_Pipeline/blob/main/images/Dashboard.png)
---

## 🐳 Docker Setup
Build and Run:
| Command | Description |
|---|---|
| `docker-compose build` | Build the Docker images |
| `docker-compose up` | Start the Docker containers |

