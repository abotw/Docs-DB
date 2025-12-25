-- HW-2-2
-- 将学生“李军”的“计算机导论”课程成绩修改为 100
UPDATE Score
SET Degree = '100'
FROM Score, Course, Student
WHERE
Score.Sno = Student.Sno and
Course.Cno = Score.Cno and
Student.Sname = '李军' and
Course.Cname = '计算机导论'