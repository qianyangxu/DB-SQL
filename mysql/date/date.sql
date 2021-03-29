-- 当前具体的日期和时间
now();

-- 当前日期
curdate();

-- 当前时间
curtime();

-- 加减某个时间间隔函数date_add()与date_sub()
-- quarter:季，week:周，day:天，hour:小时，minuter:分钟，second:秒，microsecond:毫秒
-- 注：也可以不用变量，直接加减某个时间，如：select date_add('1998-01-01', interval 1 day);
select date_add(@dt, interval 1 year);
select date_add(@dt, interval 1 month);

-- datediff(date1,date2)：两个日期相减，date1减去date2得到相减之后的天数
select timediff('2019-06-03 12:30:00', '2019-06-03 12:29:30');
select timediff('12:30:00', '12:29:30');
