select min(x),max(y)
from Functions
group by (x+y),(x*y)
having count(x) > 1
order by (x+y),(x*y);
