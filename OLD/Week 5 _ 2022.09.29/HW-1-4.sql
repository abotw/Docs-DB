-- HW-1-4
-- “00电子商务”班的“林斌”申请将已选修的
-- “网络信息检索原理与技术课程”修改为“Linux操作系统”
UPDATE StuCou
SET CouNo = 
(SELECT CouNo 
FROM Course 
WHERE CouName = 'Linux操作系统')
FROM Course, Student, Class, StuCou
WHERE Class.ClassNo = Student.ClassNo and
Student.StuNo = StuCou.StuNo and
StuCou.CouNo = Course.CouNo and
Class.ClassName = '00电子商务' and
Student.StuName = '林斌' and
Course.CouName = '网络信息检索原理与技术'