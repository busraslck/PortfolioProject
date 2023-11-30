select continent,LOCATION,DAY,TOTAL_CASES,new_cases,total_deaths,population 
FROM COVIDDEATHS
where continent is not null
order by 1,2;

--check death percentage
create table check_death_percentage as 
select location,day,population, total_cases,total_deaths, round((total_deaths/population)*100,2) as death_percentage
from coviddeaths
where continent is not null
order by 1,2;

--infected people
select location,population, MAX(total_cases) as highest_infected_people, round(MAX((total_cases/population)*100),2) as infected_percentage
from coviddeaths
where continent is not null
group by location,population
order by infected_percentage desc;


--percentage of people who got covid
select day,location,population, total_cases as infected_people, round((total_cases/population)*100,2) as infected_percentage
from coviddeaths
where continent is not null
order by 1,2;


--country based infection rate vs population 
select location,population, MAX(total_cases) as infected_people, round(MAX((total_cases/population)*100,2)as infected_percentage
from coviddeaths
where continent is not null
group by location,population
order by 1,2;

--death count
select location, MAX(total_deaths) as death_count
from coviddeaths
where continent is not null
group by location
order by 2 desc;

--global statistics
select sum(new_cases),sum(new_deaths),round((new_deaths/new_cases)*100)),2) as new_death_percentage,sum(total_cases),sum(total_deaths),round((total_deaths/total_cases)*100)),2) as death_percentage
from coviddeaths 
where continent is not null
group by day;
--order by 2 desc;

--total population vs vaccination
select * from coviddeaths dea
join covidvaccination vac
on dea.location = vac.location
and dea.day=vac.day;


--
select dea.continent,dea.location,dea.day,dea.population,vac.new_vaccinations
from coviddeaths dea
join covidvaccination vac
on dea.location = vac.location
and dea.day=vac.day
where dea.continent is not null
group by dea.location
order by 1,2,3;



