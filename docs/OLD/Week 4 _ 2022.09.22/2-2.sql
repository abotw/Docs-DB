-- HW2-2
-- 查询所有选修“计算机导论”课程的“男”同学的成绩表。
-- Score -> Score
-- Ssex -> Student
-- Cname -> Course
-- Course -> +Cno -> Score -> +Sno -> Student
select Sname as '姓名', Degree as '成绩'
from Score join Student
on Score.Sno = Student.Sno
join Course
on Score.Cno = Course.Cno
where Cname = '计算机导论' and Ssex = '男'
