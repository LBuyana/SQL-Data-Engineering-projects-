SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    company_id
FROM
    job_postings_fact
Limit 10;

SELECT
    *
FROM Information_schema.tables;