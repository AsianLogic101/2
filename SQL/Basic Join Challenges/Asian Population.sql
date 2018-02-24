select sum(city.population) from city
join country 
on country.code = city.countrycode
where country.continent='Asia';
