/*
Question: What are the highest-paying skills for data engineers?
- Calculate the median salary for each skill required in data engineer positions.
- Focus on remote positions with specified salaries.
- Include skill frequency to identify both salary and demand.
- Why?
  - Helps identify which skills command the highest compensation while also showing how common those skills are, providing a more complete picture for skill development priorities.
  - The median is used instead of the average to reduce the impact of outlier salaries.
*/

--GET HIGHEST PAYING SKILLS FOR DATA ENGINEERING

SELECT 
    sd.skills AS SKILLS,
    MEDIAN(salary_year_avg) as "Median Salary",
    COUNT(sd.*) as "Demand count"
FROM 
    job_postings_fact as jpf
INNER JOIN
    skills_Job_dim as sjd
    ON jpf.job_id  = sjd.job_id
INNER JOIN skills_dim as sd
    ON sjd.skill_id = sd.skill_id

WHERE 
    job_title_short = 'Data Engineer'
AND 
    job_work_from_home = TRUE

GROUP BY sd.skills
HAVING COUNT(sd.skills) >100
ORDER BY "Median Salary" DESC
LIMIT 25;

/*
Key insights:
┌────────────┬───────────────┬──────────────┐
│   SKILLS   │ Median Salary │ Demand count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ terraform  │      184000.0 │         3248 │
│ golang     │      184000.0 │          912 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169615.5 │          582 │
│ zoom       │      168437.5 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154223.5 │          129 │
│ atlassian  │      151500.0 │          249 │
│ c          │      151500.0 │          444 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ airflow    │      150000.0 │         9996 │
│ ruby       │      150000.0 │          736 │
│ node       │      150000.0 │          179 │
│ css        │      150000.0 │          262 │
│ redis      │      149000.0 │          605 │
│ vmware     │     148798.25 │          136 │
│ ansible    │     148798.25 │          475 │
│ jupyter    │      147500.0 │          400 │
└────────────┴───────────────┴──────────────┘

Key Insights
- Highest-paying skill: Rust (210,000), with low demand (232 postings).
- Highest-demand skill: Airflow (9,996 postings), with a median salary of 150,000.
- Best salary-demand balance: Terraform (184,000; 3,248 postings).
- Strong market demand: Kubernetes (4,202 postings; 150,500 median salary).
- Skills to prioritise: Terraform, Airflow and Kubernetes, based on salary and demand.
*/


