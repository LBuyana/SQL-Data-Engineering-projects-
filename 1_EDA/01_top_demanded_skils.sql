/*


*/

SELECT 
    sd.skills,
    COUNT(jpf.*) as demand_count

FROM 
    Job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd 
    ON sjd.skill_id =sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Engineer'
    AND jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills 
ORDER BY
    demand_count DESC
LIMIT 25;


/*
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
│ kafka      │         6415 │
│ scala      │         6304 │
│ redshift   │         5737 │
│ hadoop     │         5447 │
│ pyspark    │         4898 │
│ git        │         4641 │
│ power bi   │         4600 │
│ nosql      │         4514 │
│ tableau    │         4402 │
│ docker     │         4316 │
│ kubernetes │         4202 │
│ sql server │         3931 │
│ bigquery   │         3523 │
│ mongodb    │         3512 │
│ postgresql │         3360 │
└────────────┴──────────────┘

Key insights:

SQL and Python dominate demand: SQL (29,221) and Python (28,776) are the most frequently requested skills, with significantly higher demand than other technologies.

Cloud computing skills are highly sought after: AWS (17,823) leads among cloud platforms, followed by Azure (14,143) and GCP (6,446). This highlights the importance of cloud technologies in data engineering roles.

Data processing and orchestration tools are important: Spark (12,799) and Airflow (9,996) rank among the most requested skills, indicating strong demand for data processing and workflow orchestration capabilities.

Modern data platforms feature prominently: Snowflake (8,639) and Databricks (8,183) appear in the top 10, reflecting demand for cloud-based data warehousing and analytics platforms.

Traditional and emerging technologies coexist: Hadoop (5,447) and Scala (6,304) remain relevant alongside tools such as Kafka (6,415), Docker (4,316) and Kubernetes (4,202).
*/

