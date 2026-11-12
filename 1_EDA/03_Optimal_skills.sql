/*
Question: What are the most optimal skills for data engineers, balancing both demand and salary?
- Create a ranking column that combines demand count and median salary to identify the most valuable skills.
- Focus only on remote Data Engineer positions with specified annual salaries.
- Why?
  - This approach highlights skills that balance market demand and financial reward. It weights core skills appropriately, rather than letting rare, outlier skills distort the results.
*/

SELECT
    sd.skills,
    'R'||MEDIAN(jpf.salary_year_avg) || ' Demand count: ' || COUNT(jpf.*) as "Rank column"
    

FROM 
    job_postings_fact as jpf
INNER JOIN 
    skills_job_dim as sjd 
    ON jpf.job_id = sjd.job_id
INNER JOIN 
    skills_dim as sd 
    ON sjd.skill_id = sd.skill_id

WHERE 
    job_title_short = 'Data Engineer' 
    AND job_work_from_home = TRUE

GROUP BY sd.skills

HAVING 
    COUNT(jpf.*) > 200 --optional to check those with high

ORDER BY MEDIAN(jpf.salary_year_avg) DESC, COUNT(jpf.*) DESC

LIMIT 25;

/*

┌────────────┬───────────────────────────────┐
│   skills   │          Rank column          │
│  varchar   │            varchar            │
├────────────┼───────────────────────────────┤
│ rust       │ R210000.0 Demand count: 232   │
│ terraform  │ R184000.0 Demand count: 3248  │
│ golang     │ R184000.0 Demand count: 912   │
│ spring     │ R175500.0 Demand count: 364   │
│ neo4j      │ R170000.0 Demand count: 277   │
│ gdpr       │ R169615.5 Demand count: 582   │
│ graphql    │ R167500.0 Demand count: 445   │
│ mongo      │ R162250.0 Demand count: 265   │
│ fastapi    │ R157500.0 Demand count: 204   │
│ bitbucket  │ R155000.0 Demand count: 478   │
│ django     │ R155000.0 Demand count: 265   │
│ c          │ R151500.0 Demand count: 444   │
│ atlassian  │ R151500.0 Demand count: 249   │
│ typescript │ R151000.0 Demand count: 388   │
│ kubernetes │ R150500.0 Demand count: 4202  │
│ airflow    │ R150000.0 Demand count: 9996  │
│ ruby       │ R150000.0 Demand count: 736   │
│ css        │ R150000.0 Demand count: 262   │
│ redis      │ R149000.0 Demand count: 605   │
│ ansible    │ R148798.25 Demand count: 475  │
│ jupyter    │ R147500.0 Demand count: 400   │
│ kafka      │ R145000.0 Demand count: 6415  │
│ spark      │ R140000.0 Demand count: 12799 │
│ pyspark    │ R140000.0 Demand count: 4898  │
│ git        │ R140000.0 Demand count: 4641  │
└────────────┴───────────────────────────────┘


Key Insights
- Highest median salary: Rust (R210,000), with only 232 postings.
- Highest demand: Spark (12,799 postings), with a median salary of R140,000.
- Best salary-demand balance: Terraform (R184,000; 3,248 postings).
- Strong salary and demand: Airflow (9,996 postings; R150,000) and Kafka (6,415 postings; R145,000).
- High-demand skills: Kubernetes (4,202), PySpark (4,898) and Git (4,641).
- High-paying niche skills: Golang (R184,000), Spring (R175,500) and Neo4j (R170,000), with comparatively lower demand.
- Skills to prioritise: Terraform, Airflow, Kafka, Spark and Kubernetes, based on their combination of salary and demand.
*/