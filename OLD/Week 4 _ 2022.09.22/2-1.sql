-- HW2-1
-- 查询最高分同学的Sno、Cno和Degree列（使用不止一种方法实现）
-- Sno, Cno，Degree -> Score
-- method - 1 - order
select top 1 *
from Score
order by Degree desc
-- method 2 - 子查询
select *
from Score
where Degree = (select MAX(Degree) from Score)