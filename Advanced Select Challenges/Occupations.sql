set @r1=0,@r2=0,@r3=0,@r4=0;

select group_concat(doc),group_concat(prof),group_concat(sing),group_concat(act) from 
    (select case 
        when occupation='Doctor' then (@r1:=@r1+1)
        when occupation='Professor' then (@r2:=@r2+1)
        when occupation='Singer' then (@r3:=@r3+1)
        when occupation='Actor' then (@r4:=@r4+1) end RowNum,
        case when occupation='Doctor' then name end doc,
        case when occupation='Professor' then name end prof,
        case when occupation='Singer' then name end sing,
        case when occupation='Actor' then name end act
        from occupations
        order by name) t1
    group by RowNum;
