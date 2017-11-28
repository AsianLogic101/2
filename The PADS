select 
case when occupation= 'Doctor' then concat(name,'(D)')
    when occupation= 'Professor' then concat(name,'(P)')
    when occupation= 'Singer' then concat(name,'(S)')
    when occupation= 'Actor' then concat(name,'(A)')
    end
from occupations
order by name asc;
select 'There are a total of ', count(occupation), concat(lower(occupation),'s.') 
from occupations
group by occupation
order by count(occupation) asc, occupation asc;
