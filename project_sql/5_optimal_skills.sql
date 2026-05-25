 /*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/  
WITH skills_demand AS (
SELECT  
    skills_dim.skill_id,  
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM    
    job_postings_fact      
INNER JOIN  
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN  
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE   
    job_title_short = 'Data Analyst' AND        
    job_work_from_home = TRUE AND
    salary_year_avg IS NOT NULL 
GROUP BY    
    skills_dim.skill_id
), average_salary AS (
SELECT      
    skills_job_dim.skill_id,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS skill_avg_salary
FROM    
    job_postings_fact   
INNER JOIN  
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
WHERE   
    job_title_short = 'Data Analyst' AND    
    job_work_from_home = TRUE AND   
    salary_year_avg IS NOT NULL
GROUP BY    
    skills_job_dim.skill_id     
)   
SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25;   

/*          
MY ANALYSIS & INSIGHTS FOR PROJECT PROBLEM 5:

After synthesizing demand volume and average salaries for remote Data Analyst roles, 
the data highlights the ultimate "sweet spot" skills—those that offer both high 
job security (demand) and top-tier financial rewards (pay):

1. High-Value Cloud & Big Data Platforms
- Cloud ecosystems dominate the top brackets: Snowflake ($112,948 avg, 37 postings), 
  Azure ($111,225 avg, 34 postings), and AWS ($108,317 avg, 32 postings) show strong 
  simultaneous demand and premium compensation. Transitioning from basic data analysis 
  to managing data inside cloud warehouses is highly lucrative.
- BigQuery and Hadoop also command high pay: Google's BigQuery ($109,654) and Hadoop ($113,193) 
  prove that big data infrastructure skills pay a significant premium even at lower overall volume.

2. The Programming Sweet Spot (Python vs. Niche Languages)
- Python is the ultimate optimal skill: With 236 mentions and a six-figure average salary ($101,397), 
  Python represents the perfect balance of massive market demand and high financial reward. 
- Niche programming languages command higher ceilings: Go ($115,320) and Java ($106,906) rank higher 
  on salary, but with much lower demand counts (27 and 17). They are great specialized skills, but 
  Python remains the safer, highly rewarding bet.

3. Business Intelligence & Data Pipelines
- Visualization tools maintain healthy baselines: Tableau stands out with incredible demand 
  (230 postings) while maintaining a strong average salary of $99,288. Looker is even more 
  optimal on pay, commanding $103,795 across 49 postings.
- Traditional SQL ecosystems hold their ground: Oracle ($104,534) and SQL Server ($97,786) 
  confirm that managing legacy enterprise data infrastructures remains highly valued by top-paying remote employers.

RESULTS
  {
    "skill_id": 8,
    "skills": "go",
    "demand_count": "27",
    "avg_salary": "115320"
  },
  {
    "skill_id": 234,
    "skills": "confluence",
    "demand_count": "11",
    "avg_salary": "114210"
  },
  {
    "skill_id": 97,
    "skills": "hadoop",
    "demand_count": "22",
    "avg_salary": "113193"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "37",
    "avg_salary": "112948"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "34",
    "avg_salary": "111225"
  },
  {
    "skill_id": 77,
    "skills": "bigquery",
    "demand_count": "13",
    "avg_salary": "109654"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "32",
    "avg_salary": "108317"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "17",
    "avg_salary": "106906"
  },
  {
    "skill_id": 194,
    "skills": "ssis",
    "demand_count": "12",
    "avg_salary": "106683"
  },
  {
    "skill_id": 233,
    "skills": "jira",
    "demand_count": "20",
    "avg_salary": "104918"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "37",
    "avg_salary": "104534"
  },
  {
    "skill_id": 185,
    "skills": "looker",
    "demand_count": "49",
    "avg_salary": "103795"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "13",
    "avg_salary": "101414"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "236",
    "avg_salary": "101397"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "148",
    "avg_salary": "100499"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "16",
    "avg_salary": "99936"
  },
  {
    "skill_id": 187,
    "skills": "qlik",
    "demand_count": "13",
    "avg_salary": "99631"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "230",
    "avg_salary": "99288"
  },
  {
    "skill_id": 197,
    "skills": "ssrs",
    "demand_count": "14",
    "avg_salary": "99171"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "13",
    "avg_salary": "99077"
  },
  {
    "skill_id": 13,
    "skills": "c++",
    "demand_count": "11",
    "avg_salary": "98958"
  },
  {
    "skill_id": 186,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 7,
    "skills": "sas",
    "demand_count": "63",
    "avg_salary": "98902"
  },
  {
    "skill_id": 61,
    "skills": "sql server",
    "demand_count": "35",
    "avg_salary": "97786"
  },
  {
    "skill_id": 9,
    "skills": "javascript",
    "demand_count": "20",
    "avg_salary": "97587"
  }
]   
*/