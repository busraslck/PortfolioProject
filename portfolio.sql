select LOCATION,DAY,TOTAL_CASES,new_cases,total_deaths,population 
FROM COVIDDEATHS
order by 1,2;

--check death percentage

select location,day,population, total_cases,total_deaths, round((total_deaths/population)*100,2) as death_percentage
from coviddeaths
order by 1,2;

--infected people
select location,population, MAX(total_cases) as highest_infected_people, round(MAX((total_cases/population)*100),2) as infected_percentage
from coviddeaths
group by location,population
order by infected_percentage desc;

