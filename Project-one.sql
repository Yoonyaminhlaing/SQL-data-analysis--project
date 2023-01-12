select * from dbo.cov_death$

--Looking at total case vs total death

select location, date, total_cases, total_deaths,(total_deaths/total_cases)*100 as deathpercentage
from dbo.cov_death$
order by 1,2 

--Looking at total case vs population

select location, date, total_cases, population,(total_cases/population)*100 as casespercentage 
from dbo.cov_death$
where location = 'Asia'
order by 1,2

--looking at countries with highest infection rate compared to population
select location,population, MAX(total_cases) as highestinfectedcount, MAX(total_cases/population) as casespercentage
from dbo.cov_death$
group by location, population
order by casespercentage desc

--looking at countries with highest death count compared to population
select location, MAX(cast(total_deaths as int)) as highestdeathcount
from dbo.cov_death$
where continent is not null
group by location
order by highestdeathcount desc

--total death by continent

select continent, MAX(cast(total_deaths as int)) as highestdeathcount
from dbo.cov_death$
where continent is not null
group by continent
order by highestdeathcount desc

--Joining two table

select * 
from dbo.cov_death$ dea
join dbo.cov_vaccine$ vac
	on dea.location = vac.location
	and dea.date = vac.date 

-- Looking at total vaccinated people from total population 

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from dbo.cov_death$ dea
join dbo.cov_vaccine$ vac
	on dea.location = vac.location
	and dea.date = vac.date 
where dea.continent is not null
order by 2,3 

	



