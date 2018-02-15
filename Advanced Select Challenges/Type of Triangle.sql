select
case when  c>=(a+b) or a>=(b+c) or b>=(a+c) then "Not A Triangle"
    when a=b and b!=c or a=c and b!=c or b=c and a!=b then "Isosceles"
    when a=b and b=c then "Equilateral"
    else "Scalene" end
from triangles;
