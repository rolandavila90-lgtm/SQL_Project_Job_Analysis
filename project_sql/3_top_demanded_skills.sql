/*
Question: What are the most in-demand skills for Data Analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/


SELECT  
    skills,   
    COUNT(skills) AS demand_count
FROM    
    job_postings_fact      
INNER JOIN  
    skills_job_dim ON job_postings_fact.job_id  = skills_job_dim.job_id 
INNER JOIN  
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE   
    job_title_short = 'Data Analyst' AND    
    job_work_from_home = TRUE
GROUP BY    
    skills  
ORDER BY    
   demand_count DESC  
LIMIT 5;    

/*
MY ANALYSIS & INSIGHTS FOR PROJECT PROBLEM 3:

After running my query to isolate the top 5 most in-demand skills for Data Analysts 
across all remote job postings, I analyzed the total volume of mentions for each tool. 
Here is my breakdown of what the market volume actually reveals:

1. Core Languages
- SQL remains the undisputed foundation: With a staggering 7,291 mentions, SQL is far 
  and away the most demanded skill in the job market. Appearing nearly twice as much 
  as Python, my data confirms it is the absolute baseline requirement for any analyst role.
- Python is essential for modern stacks: Securing 4,330 mentions, Python holds a solid 
  third place. It proves that programming for automation and scripting is heavily expected 
  alongside traditional query skills.

2. Spreadsheets & Business Intelligence (BI) Tools
- Excel is nowhere near dead: Coming in at second place with 4,611 mentions, Excel proves 
  that traditional spreadsheet proficiency remains a critical pillar for operational business 
  reporting across the board.
- Tableau leads Power BI in demand volume: Tableau captured 3,745 mentions compared to 
  Power BI's 2,609 mentions. My analysis shows that while both data visualization tools are 
  highly marketable, Tableau currently maintains a distinct volume advantage in remote listings.


RESULTS     
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/
