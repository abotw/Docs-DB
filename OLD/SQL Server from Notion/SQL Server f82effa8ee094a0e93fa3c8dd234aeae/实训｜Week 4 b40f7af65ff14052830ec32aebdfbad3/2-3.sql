-- HW2-3
-- 查询至少有2名男生的班号
-- Ssex，Class -> Student
select Class
from Student
group by Class
having (select COUNT(*) from Student where Ssex='男') >= 2