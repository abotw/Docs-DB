-- HW-1-2
-- 删除学号“00000025”学生的选修报名情况
UPDATE Course
SET WillNum = WillNum - 1
FROM Course
WHERE Course.CouNo = 
(SELECT CouNo FROM StuCou WHERE StuNo = '00000025')
DELETE StuCou
FROM StuCou
WHERE StuCou.StuNo = '00000025'