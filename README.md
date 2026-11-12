# Exploratory Data Analysis with SQL: Job market Analysis  

![Project 1 Overview](1_EDA/images/1_1_Project1_EDA.png)  

A SQL projec analysing the data Engineer job market using real world job posting. **It shows my ability to write production quality analysis SQL, design efficient queries, and turn business question into data-driven insights.**

## Executive summary  
- Project scope: Built 3 analytical queries that answer key questions about the data engineer job market
- Data modeling: Used multi-table joins across fact and dimension tables to extract insights
- Analytics: Applied aggregations, filtering, and sorting to find top skills by demand, salary, and overall value
- Outcomes: Delivered actionable insights on SQL/Python dominance, cloud trends, and salary patterns

If you have a minute, review these:

1. [Top Demanded skills](1_EDA/01_top_demanded_skils.sql) 
2. [Top Paying skills](1_EDA/02_Top+paying_skill.sql)
3. [Optimal skills](1_EDA/03_Optimal_skills.sql)  

This project analyses a **Data warehouse** built using a star schema design. The warehouse structure consists of:

![Data warehouse](1_EDA/images/1_2_Data_Warehouse.png)  
- **Fact Table:** `job_postings_fact` – Central table containing job posting details (job titles, locations, salaries, dates, etc.)
- **Dimension Tables:**
  - `company_dim` – Company information linked to job postings
  - `skills_dim` – Skills catalog with skill names and types
- **Bridge Table:** `skills_job_dim` – Resolves the many-to-many relationship between job postings and skills

By querying across these interconnected tables, I extracted insights about skill demand, salary patterns, and optimal skill combinations for data engineering roles.

## Problem and context
Job market analysts need to answer questions like:
- Most in-demand: Which skills are most in-demand for data engineers?
- Highest paid: Which skills command the highest salaries?
- Best trade-off: What is the optimal skill set balancing demand and compensation?  


## Tech stack  

- **Query Engine:** DuckDB for fast OLAP-style analytical queries
- **Language:** SQL (ANSI-style with analytical functions)
- **Data Model:** Star schema with fact + dimension + bridge tables
- **Development:** VS Code for SQL editing + Terminal for DuckDB CLI
- **Version Control:** Git/GitHub for versioned SQL scripts

## Analysis Overview  

### Query Structure

1. **[Top Demanded Skills](1_EDA/01_top_demanded_skils.sql)** – Identifies the 10 most in-demand skills for remote data engineer positions
2. **[Top Paying Skills](1_EDA/02_Top+paying_skill.sql)** – Analyzes the 25 highest-paying skills with salary and demand metrics
3. **[Optimal Skills](1_EDA/03_Optimal_skills.sql)** – Calculates an optimal score using natural log of demand combined with median salary to identify the most valuable skills to learn

### Key Insights

- **Core Languages:** SQL (29,221) and Python (28,776) dominate demand, making them the most requested skills.

- **Cloud Platforms:** AWS (17,823) and Azure (14,143) lead cloud-related demand, followed by GCP (6,446).

- **Infrastructure and Tooling:** Terraform offers a median salary of R184,000 with 3,248 postings, while Kubernetes (4,202) has a median salary of R150,500. Docker (4,316) is also frequently requested.

- **Big Data Tools:** Spark (12,799), Airflow (9,996) and Kafka (6,415) show strong demand, with median salaries ranging from R140,000 to R150,000. Snowflake (8,639) and Databricks (8,183) also rank among the most requested technologies.  


## SQL Skills Demonstration

### Query Design & Optimization

- **Complex Joins:** Multi-table `INNER JOIN` operations across `job_postings_fact`, `skills_job_dim`, and `skills_dim`
- **Aggregations:** `COUNT()`, `MEDIAN()`, `ROUND()` for statistical analysis
- **Filtering:** Boolean logic with `WHERE` clauses and multiple conditions (`job_title_short`, `job_work_from_home`, `salary_year_avg IS NOT NULL`)
- **Sorting & Limiting:** `ORDER BY` with `DESC` and `LIMIT` for top-N analysis  

### Data Analysis Techniques

- **Grouping:** `GROUP BY` for categorical analysis by skill
- **Conditional Logic:** `CASE WHEN` statements for derived metrics
- **Mathematical Functions:** `LN()` for natural logarithm transformation to normalise demand metrics
- **Calculated Metrics:** Derived optimal score combining log-transformed demand with median salary
- **HAVING Clause:** Filtering aggregated results (skills with >= 100 postings)
- **NULL Handling:** Proper filtering of incomplete records (`salary_year_avg IS NOT NULL`)