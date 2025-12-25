-- HW-1-3
-- 将“00多媒体”班的“杜晓静”名字修改为“杜小静”
UPDATE Student
SET StuName = '杜小静'
FROM Student, Class
WHERE
Student.ClassNo = Class.ClassNo 
and Class.ClassName = '00多媒体'
and Student.StuName = '杜晓静'