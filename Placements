select s.name from students s
join friends f on s.id = f.id
join packages t1 on s.id=t1.id
join packages t2 on f.friend_id= t2.id
where t1.salary < t2.salary
order by t2.salary;
