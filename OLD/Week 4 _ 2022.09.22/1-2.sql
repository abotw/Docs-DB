-- HW1-2
-- 查询各个系部的开设课程门数和限选人数
-- COUNT(*) -> Course
-- SUM(LimitNum) -> Course
-- DepartNo
select 
DepartNo as '系部编号',
COUNT(CouNo) as '开设课程门数',
SUM(LimitNum) as '限选人数'
from Course
group by DepartNo