Create table Hospital(
	Hospital_Name Varchar(1000),
	Locations Varchar(1000),
	Department	Varchar(1000),
	Doctors_Count	Numeric(6),
	Patients_Count	Numeric(6),
	Admission_Date	Date,
	Discharge_Date	Date,
	Medical_Expenses Numeric(10,2)
);
Select * from Hospital;
SET datestyle = 'DMY';
Copy Hospital (Hospital_Name,Locations,Department,Doctors_Count,Patients_Count,Admission_Date,Discharge_Date,Medical_Expenses)
from 'C:/Users/ZEESHAN ALI/OneDrive/Desktop/SQL/Project 2/Hospital_Data.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

---1. Total Number of Patients
Select Sum(Patients_Count) as Number_of_Patients from hospital;
---Write an SQL query to find the total number of patients across all hospitals.

--2. Average Number of Doctors per Hospital
Select avg(Doctors_Count) as average_Doctors from hospital;
--Retrieve the average count of doctors available in each hospital.
--3. Top 3 Departments with the Highest Number of Patients
Select Department,sum(Patients_Count) as Patients_in_departmetns from hospital
group by department order by Patients_in_departmetns DESC limit 3;
--Find the top 3 hospital departments that have the highest number of patients.
--4. Hospital with the Maximum Medical Expenses
Select Hospital_name, sum(medical_expenses) as max_expenses from hospital
group by Hospital_name order by max_expenses Desc;
--Identify the hospital that recorded the highest medical expenses.
--5. Daily Average Medical Expenses
Select avg(medical_expenses) as avg_expenses from hospital;

--Calculate the average medical expenses per day for each hospital.
--6. Longest Hospital Stay
Select Admission_date,discharge_date,Age(discharge_date,admission_date) as longest_stay from hospital order by longest_stay desc limit 3;
--Find the patient with the longest stay by calculating the difference between the Discharge Date and Admission Date.
--7. Total Patients Treated Per City
Select locations,sum(patients_count) as Patients_Treated_Per_City from hospital 
group by locations order by Patients_Treated_Per_City desc;
--Count the total number of patients treated in each city.
--8. Average Length of Stay Per Department
Select department, avg(Age(discharge_date,admission_date)) as average_stay from hospital
group by department order by average_stay desc;
--Calculate the average number of days patients spend in each department.
--9. Identify the Department with the Lowest Number of Patients
Select department, coalesce(sum(patients_count),0) as lowest_patients
from hospital group by department order by lowest_patients ASC limit 3;
--Find the department with the least number of patients.
--10. Monthly Medical Expenses Report
SELECT 
    TO_CHAR(admission_date, 'YYYY-MM') AS monthly,  
    SUM(medical_expenses) AS total_expenses
FROM hospital
GROUP BY monthly
ORDER BY monthly;
Select * from hospital;
--Group the data by month and calculate the total medical expenses for each month.
