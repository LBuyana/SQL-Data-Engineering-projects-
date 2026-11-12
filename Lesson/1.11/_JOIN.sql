--Using the Left join

SELECT
    jpf.*, 
    cd.*
    
FROM 
    job_postings_fact AS jpf
LEFT JOIN 
    company_dim as cd
ON  
    jpf.company_id = cd.company_id
    
LIMIT 10;


--Using INNER JOIN

SELECT
    jpf.*, 
    cd.*
    
FROM 
    job_postings_fact AS jpf
INNER JOIN 
    company_dim as cd
ON  
    jpf.company_id = cd.company_id
    
LIMIT 10;

--Using the FULL OUTER JOIN

SELECT
    jpf.*, 
    cd.*
    
FROM 
    job_postings_fact AS jpf
FULL OUTER JOIN 
    company_dim as cd
ON  
    jpf.company_id = cd.company_id
    
LIMIT 10;




