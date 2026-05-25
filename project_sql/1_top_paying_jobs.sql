/*
 * PROJECT PROBLEM 1:
 Question: What are the top-paying data analyst jobs?
 - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
 - Focuses on job postings with specified salaries (remove nulls).
 - Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment.
 */ 

SELECT 
    job_id, 
    job_title,  
    job_location,   
    job_schedule_type, 
    salary_year_avg,    
    job_posted_date,    
    name AS company_name 
FROM    
    job_postings_fact       
LEFT JOIN   
    company_dim ON   job_postings_fact.company_id = company_dim.company_id
WHERE   
    job_title = 'Data Analyst' AND  
    job_location = 'Anywhere'  AND  
    salary_year_avg IS NOT NULL 
ORDER BY    
    salary_year_avg DESC    
LIMIT 10;   

/*
MY ANALYSIS & INSIGHTS FOR PROJECT PROBLEM 1:

After executing my query to identify the top 10 highest-paying remote Data Analyst roles 
with specified salaries, I evaluated the resulting data to understand the market distribution. 
Here is my breakdown of what the data reveals:

1. Salary Ranges and Distribution
- Massive Top Outlier: The dataset features a dramatic outlier with Mantys offering an average 
  annual salary of $650,000.00. This is exceptionally rare for standard analyst positions and 
  likely indicates a highly specialized, foundational, or equity-heavy early hire role.
- Consistent High-Tier Bracket: Excluding the top outlier, the remaining 9 roles form a highly 
  competitive and tightly clustered bracket ranging from $135,000.00 to $165,000.00 per year. 
  This establishes a clear target ceiling for elite, standard remote data analyst compensation.

2. Industry Diversity and Company Types
- Tech Giants vs. Boutique Firms: Established tech players like Uber are represented in this elite 
  salary band ($140,500.00), demonstrating that high-scale operations value remote data talent. 
  However, the presence of specialized firms like Plexus Resource Solutions, Level, and Overmind 
  proves that smaller tech firms and consultancies are aggressively competing for top talent.
- Sector Variety: High-paying opportunities are not limited to pure tech; they span across multiple 
  sectors including Financial Services (InvestM Technology), Insurance (EPIC Brokers), and specialized 
  recruitment networks in Healthcare and IT.

3. Employment Flexibility
- 100% Remote Capability: Every position in this top-earning bracket is categorized as "Anywhere", 
  confirming that companies are willing to pay top dollar for exceptional data professionals 
  regardless of geographical constraints.
- Schedule Stability: All 10 postings are strictly full-time commitments, reflecting that 
  organizations investing this heavily in data infrastructure require dedicated, permanent resources.

RESULTS
[
  {
    "job_id": 226942,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "650000.0",
    "job_posted_date": "2023-02-20 15:13:33",
    "company_name": "Mantys"
  },
  {
    "job_id": 1246069,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-12-08 09:16:37",
    "company_name": "Plexus Resource Solutions"
  },
  {
    "job_id": 712473,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-08-14 16:01:19",
    "company_name": "Get It Recruit - Information Technology"
  },
  {
    "job_id": 456042,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "151500.0",
    "job_posted_date": "2023-09-25 10:59:56",
    "company_name": "Get It Recruit - Healthcare"
  },
  {
    "job_id": 405581,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-05-01 13:00:20",
    "company_name": "CyberCoders"
  },
  {
    "job_id": 479485,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "145000.0",
    "job_posted_date": "2023-03-15 16:59:55",
    "company_name": "Level"
  },
  {
    "job_id": 1090975,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "140500.0",
    "job_posted_date": "2023-03-24 07:06:43",
    "company_name": "Uber"
  },
  {
    "job_id": 1482852,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "138500.0",
    "job_posted_date": "2023-11-23 12:38:59",
    "company_name": "Overmind"
  },
  {
    "job_id": 1326467,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-06-26 17:00:18",
    "company_name": "EPIC Brokers"
  },
  {
    "job_id": 479965,
    "job_title": "Data Analyst",
    "job_location": "Anywhere",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "135000.0",
    "job_posted_date": "2023-02-26 01:04:44",
    "company_name": "InvestM Technology LLC"
  }
] 
*/
