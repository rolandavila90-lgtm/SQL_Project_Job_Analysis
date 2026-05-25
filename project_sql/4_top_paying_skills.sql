/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT      
    skills,
    ROUND(AVG(salary_year_avg),0) AS skill_avg_salary
FROM    
    job_postings_fact   
INNER JOIN  
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN  
    skills_dim ON skills_job_dim.skill_id =  skills_dim.skill_id    
WHERE   
    job_title_short = 'Data Analyst' AND    
    job_work_from_home = TRUE AND   
    salary_year_avg IS NOT NULL
GROUP BY    
    skills  
ORDER BY    
   skill_avg_salary DESC    
LIMIT 25;   

/*      
MY ANALYSIS & INSIGHTS FOR PROJECT PROBLEM 4:

After analyzing the average salaries associated with different tools, my data reveals 
that the highest-paying skills are heavily dominated by specialized big data, DevOps, 
and advanced engineering workflows:

1. Big Data & Advanced Analytics Ecosystems
- PySpark and Databricks command elite salaries: PySpark takes the absolute #1 spot with an average 
  salary of $208,172, while Databricks hits $141,907. My analysis shows that companies pay top dollar 
  for analysts who can process massive datasets using distributed computing.
- Data Science libraries are highly rewarded: Tools like Pandas ($151,821), NumPy ($143,513), and 
  Scikit-Learn ($125,781) prove that shifting from basic spreadsheets to advanced programmatic 
  analysis in Jupyter notebooks ($152,777) heavily drives up your earning potential.

2. Software Engineering & DevOps Integration
- Version Control and CI/CD pay big: I noticed tools like Bitbucket ($189,155), GitLab ($154,500), 
  and Jenkins ($125,436) ranking incredibly high. This confirms that high-paying roles treat 
  analysts like software engineers who must maintain codebase integrity.
- System Infrastructure knowledge is valued: Linux ($136,508) and Kubernetes ($132,500) show up prominently, 
  proving that understanding system environments and containerization pays off massively.

3. Database Management 
- Advanced relational databases stand out: While standard SQL is common, specialized backend skills like 
  PostgreSQL ($123,879) command premium salaries, showing that deeper database engineering skills are highly rewarded.

RESULTS
[
  {
    "skills": "pyspark",
    "skill_avg_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "skill_avg_salary": "189155"
  },
  {
    "skills": "couchbase",
    "skill_avg_salary": "160515"
  },
  {
    "skills": "watson",
    "skill_avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "skill_avg_salary": "155486"
  },
  {
    "skills": "gitlab",
    "skill_avg_salary": "154500"
  },
  {
    "skills": "swift",
    "skill_avg_salary": "153750"
  },
  {
    "skills": "jupyter",
    "skill_avg_salary": "152777"
  },
  {
    "skills": "pandas",
    "skill_avg_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "skill_avg_salary": "145000"
  },
  {
    "skills": "golang",
    "skill_avg_salary": "145000"
  },
  {
    "skills": "numpy",
    "skill_avg_salary": "143513"
  },
  {
    "skills": "databricks",
    "skill_avg_salary": "141907"
  },
  {
    "skills": "linux",
    "skill_avg_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "skill_avg_salary": "132500"
  },
  {
    "skills": "atlassian",
    "skill_avg_salary": "131162"
  },
  {
    "skills": "twilio",
    "skill_avg_salary": "127000"
  },
  {
    "skills": "airflow",
    "skill_avg_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "skill_avg_salary": "125781"
  },
  {
    "skills": "jenkins",
    "skill_avg_salary": "125436"
  },
  {
    "skills": "notion",
    "skill_avg_salary": "125000"
  },
  {
    "skills": "scala",
    "skill_avg_salary": "124903"
  },
  {
    "skills": "postgresql",
    "skill_avg_salary": "123879"
  },
  {
    "skills": "gcp",
    "skill_avg_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "skill_avg_salary": "121619"
  }
]

*/