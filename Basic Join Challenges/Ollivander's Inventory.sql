select w1.id, wp.age, w1.coins_needed, w1.power from 
(select p.age as age, min(w.coins_needed) as mp, w.power as power from wands w
join wands_property p on w.code = p.code
where p.is_evil = 0
group by w.power, p.age) as t1

join wands w1 on w1.coins_needed=t1.mp and w1.power=t1.power
join wands_property wp on wp.age=t1.age and wp.code=w1.code
where wp.is_evil=0
order by w1.power desc, wp.age desc;
