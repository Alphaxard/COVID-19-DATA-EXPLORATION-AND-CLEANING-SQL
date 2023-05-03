--SELECT ALL DATA
USE [PortfolioProject]
GO
SELECT [iso_code]
      ,[continent]
      ,[location]
      ,[date]
      ,[population]
      ,[total_cases]
      ,[new_cases]
      ,[new_cases_smoothed]
      ,[total_deaths]
      ,[new_deaths]
      ,[new_deaths_smoothed]
      ,[total_cases_per_million]
      ,[new_cases_per_million]
      ,[new_cases_smoothed_per_million]
      ,[total_deaths_per_million]
      ,[new_deaths_per_million]
      ,[new_deaths_smoothed_per_million]
      ,[reproduction_rate]
      ,[icu_patients]
      ,[icu_patients_per_million]
      ,[hosp_patients]
      ,[hosp_patients_per_million]
      ,[weekly_icu_admissions]
      ,[weekly_icu_admissions_per_million]
      ,[weekly_hosp_admissions]
      ,[weekly_hosp_admissions_per_million]
  FROM [dbo].[CovidDeaths$]  ]
GO

--SELECT DATA THAT IS MOST IMPORTANT WORLD
SELECT location,date,total_cases,new_cases,total_deaths ,population
FROM CovidDeaths$
ORDER BY 1,2

---Africa
SELECT location,date,total_cases,new_cases,total_deaths ,population
FROM CovidDeaths$
WHERE continent='Africa'
ORDER BY 1,2

----Kenya
SELECT location,date,total_cases,new_cases,total_deaths ,population
FROM CovidDeaths$
WHERE location='Kenya'
ORDER BY 1,2




--TOTAL DEATHS VS TOTAL CASES/PERCENTAGE WORLD
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as Percent_deaths
FROM CovidDeaths$
ORDER BY 1,2

--TOTAL DEATHS VS TOTAL CASES/PERCENTAGE	KENYA
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as Percent_deaths
FROM CovidDeaths$
WHERE  location='Kenya'
ORDER BY 1,2

--TOTAL DEATHS VS TOTAL CASES/PERCENTAGE AFRICA
SELECT location,date,total_cases,total_deaths, (total_deaths/total_cases)*100 as Percent_deaths
FROM CovidDeaths$
WHERE continent='Africa'
ORDER BY 1,2

--TOTAL CASES VS POPULATION /PERCENTAGE	World
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
ORDER BY 1,2

--TOTAL CASES VS POPULATION /PERCENTAGE	KENYA
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
WHERE  location='Kenya'
ORDER BY 1,2

--TOTAL CASES VS POPULATION /PERCENTAGE	Africa
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
WHERE continent='Africa'
ORDER BY 1,2


--TOTAL CASES VS POPULATION /PERCENTAGE	World
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
ORDER BY 1,2

--TOTAL CASES VS POPULATION /PERCENTAGE	KENYA
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
WHERE  location='Kenya'
ORDER BY 1,2

--TOTAL CASES VS POPULATION /PERCENTAGE	Africa
SELECT location,date,total_cases,population, (total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
WHERE continent='Africa'
ORDER BY 1,2 

--Highest Infection Rate Compared with Population
SELECT location,Max(total_cases) as MaxCases,population, Max(total_cases/population)*100 as Percent_populatioinfected
FROM CovidDeaths$
Group BY location,population
ORDER BY Percent_populatioinfected Desc

---COUNTRY WITH HIGHEST NUMBER OF DEATHS PER POPULATION
SELECT location,MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc

--BY CONTINENT
SELECT continent,MAX(CAST(total_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc

---GLOBAL NUMBERS
--DEATHS PER DAY/DATE
SELECT date ,SUM(new_cases) As TotalNewCases,SUM(CAST(new_deaths as int)) As TotalNewDeaths,SUM(CAST(new_deaths as int))/SUM(new_cases)  *100 as DeathPercentage
FROM PortfolioProject..CovidDeaths$
WHERE continent is not null
GROUP BY date
ORDER BY 1,2

---JOIN VACCINATION AND DEATHS TABLES
SELECT vac.date,vac.location,dea.date,dea.location
FROM PortfolioProject..CovidDeaths$ dea
JOIN PortfolioProject..CovidVaccinations$ vac
ON dea.location=vac.location
AND dea.date=vac.date

SELECT *
FROM CovidVaccinations$

