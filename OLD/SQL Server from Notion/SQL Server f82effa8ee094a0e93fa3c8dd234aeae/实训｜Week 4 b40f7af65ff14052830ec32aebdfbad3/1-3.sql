-- HW1-3
-- 查询选修‘中餐菜肴制作’课程的学生学号，姓名和这门课的选修人数
-- StuNo, StuName -> Student
-- CouName, WillNum -> Course
-- Student -> +StuNo -> StuCou -> CouNo -> Course
-- 内连接
select Student.StuNo, StuName, WillNum
from Student join StuCou
on Student.StuNo = StuCou.StuNo
join Course
on StuCou.CouNo = Course.CouNo
where CouName like '中餐菜肴制作%'