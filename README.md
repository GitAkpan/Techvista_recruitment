TechVista Solutions — Hiring Analytics Case Study

Project Overview
This project is a comprehensive HR analytics case study simulating a real-world hiring data investigation for TechVista Solutions, a Nigerian tech firm that spent ₦45,000,000 on recruitment in 2024. It was designed to sharpen advanced SQL skills through business-driven analysis across a fully relational 5-table database.
You step into the role of Jordan, a Data Analyst, presenting findings to an executive team demanding answers about recruitment spend, hiring quality, and process inefficiencies.

Database Schema
departments (4 records)
    ↓
positions (15 records)
    ↓
candidates (100 records)
    ↓
applications (100 records)
    ↓
interviews (85 records)
Table Relationships
Parent TableChild TableRelationshipdepartmentspositionsOne department → Many positionspositionsapplicationsOne position → Many applicationscandidatesapplicationsOne candidate → Many applicationsapplicationsinterviewsOne application → Many interview rounds

Business Scenario
Date: Monday, January 6, 2025
Setting: Urgent executive meeting called by Mrs. Adebayo (HR Director)
Executive Stakeholders
NameRoleKey ConcernMr. Olumide BankoleCEORejection rates & strategic directionMrs. Chinelo AdebayoHR DirectorCandidate quality & hiring trendsDr. Adewale ThompsonIT ManagerInterview process & technical hiringMr. Ibrahim KazeemFinance ManagerSalary budgets & cost efficiencyMs. Funke OlatundeMarketing ManagerRecruitment channels & ROI

Project Sections
Section 1 Executive Overview

Total applications, hires, and overall success rate
Cost-per-hire analysis (₦45M budget)
Time-to-hire across departments

Section 2 Salary & Budget Analysis

Candidate salary expectations vs. position budgets
Rejection rates for high vs. moderate salary expectations
Budget-constraint rejection impact

Section 3 Candidate Quality & Experience

Junior vs. Senior hiring rates
Education level impact (Master's vs. Bachelor's)
Resume score correlation with hiring success

Section 4 Recruitment Sources & Channels

LinkedIn vs. Jobberman vs. Employee Referral vs. Company Website
Referral program performance analysis
Channel ROI ranking

Section 5 Interview Process Analysis

Conversion rates at each stage (Phone Screen → Technical → Final)
Technical, cultural fit, and communication score comparison
Interviewer effectiveness and consistency

Section 6 Position & Department Performance

Hardest positions to fill
Headcount vs. budget utilization by department
Position attractiveness scores

Section 7 Rejection Analysis

Top rejection reasons breakdown
Lost talent (high-scorers rejected)
Reapplication patterns and success rates

Section 8 Trend Analysis

Monthly and quarterly hiring trends
Seasonal recruitment patterns
Year-over-year improvement metrics

Section 9 Strategic Recommendations

Department efficiency rankings and interventions
2025 budget reallocation proposals
Top 5 process improvement recommendations

Section 10 Advanced Analytics

Predictive hiring model using candidate attributes
Optimal candidate profile by position
Competitive compensation gap analysis

 SQL Concepts Covered

JOIN (INNER, LEFT) across multiple tables
GROUP BY, HAVING, ORDER BY
COUNT, AVG, SUM, MIN, MAX aggregations
CASE statements for segmentation
DATEDIFF for time-to-hire calculations
DATE_FORMAT, QUARTER() for trend analysis
Subqueries and CTEs
Self-joins for reapplication pattern detection
Filtering with LIKE, BETWEEN, and IN


Key Business Questions Answered

What is the overall hiring success rate, and which department performs best?
How much does it cost TechVista to hire one employee?
Does education level or years of experience predict hiring success?
Which recruitment channel delivers the best ROI?
Where in the interview process are we losing the most candidates?
How many high-quality candidates did we reject due to budget constraints?
What does the ideal candidate profile look like for each role?
