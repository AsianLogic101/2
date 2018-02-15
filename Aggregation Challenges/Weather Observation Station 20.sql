set @n:= (select count(id) from station);
set @row_id:= 0;

select round(avg(lat_n),4) from (select lat_n from station order by lat_n) as t1
where (select @row_id:=@row_id+1) between @n/2.0 and @n/2.0+1;
