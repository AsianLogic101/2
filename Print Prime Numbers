declare @max int = 1000
declare @b int = 2
declare @c int
declare @val varchar(1000)
set @val='2'

while @b <= @max
    
    begin 
        set @c = 2
        while @c <= @b/2 and @b%@c != 0
            begin
                set @c = @c+1
    end
    
    if @b%@c != 0
        set @val = @val + '&' + convert(varchar(1000), @b)
        set @b = @b+1
    end
    
select @val
