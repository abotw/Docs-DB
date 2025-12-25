-- HW1-1
-- 查询00电子商务班的学生姓名和学号（使用三种方法实现）
-- StuNo, StuName -> Student -> +ClassNo -> Class
-- ClassName='00电子商务' -> Class -> +ClassNo -> Student
-- method - 1 - 子查询
select StuName, StuNo
from Student
where ClassNo in (select ClassNo from Class where ClassName = '00电子商务')
-- method - 2 - 内连接 - 相等连接
select StuName, StuNo
from Student join Class
on Student.ClassNo = Class.ClassNo
where ClassName = '00电子商务'
-- method - 3 - ？
select StuName, StuNo
from Student, Class
where Student.ClassNo = Class.ClassNo and ClassName='00电子商务'