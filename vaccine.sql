--Population_Infected_World_Wide

--Select TOP 50 location, population, max(total_cases) as Total_Cases, 
--((max(total_cases)/population))*100 as Percent_Population_Infected
--from PortfolioProject..vaccine 
--Where total_cases is not null and population is not null and location <> 'World'
--and continent is not null
--group by location, population
--order by 3 desc 

-----------------------------------------------------------------------------------
--Population_Infected_India

--Select location, population, max(total_cases) as Total_Cases, 
--((max(total_cases)/population))*100 as Percent_Population_Infected
--from PortfolioProject..vaccine 
--Where total_cases is not null and population is not null and location = 'India'
--and continent is not null
--group by location, population

---------------------------------------------------------------------------

--Vaccination_Drive_India

--select location, date, total_vaccinations as Vaccination_Drive
--from PortfolioProject..vaccine 
--Where location = 'India' 
--order by date desc

------------------------------------------------------------------------------

--Reproduction_rate_India

--select date, reproduction_rate
--from PortfolioProject..vaccine
--Where location = 'India' and date = '2021-07-07'
--order by date 

----------------------------------------------------------------------------------

--Population_Fully_Vaccinated_India

--select location, people_fully_vaccinated, population,
--((people_fully_vaccinated/population)*100) as Percentage_Population_Fully_Vaccinated
--from PortfolioProject..vaccine 
--Where location = 'India' and date = '2021-07-08'  
--order by location

------------------------------------------------------------------------------
--Fully_Vaccinated_World_Ranking

--select location, people_fully_vaccinated, population, 
--((people_fully_vaccinated/population))*100 as Percentage_Population_Fully_Vaccinated
--from PortfolioProject..vaccine 
--Where location <> 'World' and continent is not null and people_fully_vaccinated is not null
--and date = '2021-07-07'  
--order by Percentage_Population_Fully_Vaccinated desc

-----------------------------------------------------------------------------------------------------------------------------------------------------
----Added Two new Columns Months & Year to the Table
----Also Updated their values using the Date col

--ALTER TABLE PortfolioProject..Vaccine
--ADD Year nvarchar(255)

--ALTER TABLE PortfolioProject..Vaccine
--ADD Month nvarchar(255)

--UPDATE PortfolioProject..Vaccine     ----Extracting Year from Date using Substring
--SET Year = 2020
--Where substring (date,1,4) = '2020'

--UPDATE PortfolioProject..Vaccine	---Extracting Year from Date using Substring
--SET Year = 2021
--Where substring (date,1,4) = '2021' 

--UPDATE PortfolioProject..Vaccine	---Extracting Month from Date using Substring
--SET Month = 'Dec'
--Where substring (date,6,2) = '12' 

----------------------------------------------------------------------------
----Checked the data type of each col in the table
----Changed the data type of total_vaccination

--SELECT 
--TABLE_NAME, 
--COLUMN_NAME, 
--DATA_TYPE 
--FROM INFORMATION_SCHEMA.COLUMNS

--ALTER TABLE PortfolioProject..Vaccine 
--ALTER COLUMN total_vaccinations FLOAT 
------------------------------------------------------------------------------

--Extracting Monthly Vaccination in India Data 
select Month, (total_vaccinations)
from  PortfolioProject..vaccine 
where location = 'India' and Year = '2021' 
Group By Month, total_vaccinations
order by Month,total_vaccinations


--------------------------------------------------------------------------
