select country.continent, floor(avg(city.population)) 
from city join country 
on country.code = city.countrycode
group by continent;
