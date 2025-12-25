-- HW-2-3
-- 查询课程成绩超过 85 分的每门课的最高分
SELECT Cno as '课程编号', MAX(Degree) as '课程成绩'
FROM Score
WHERE Score.Degree > 85
GROUP BY Cno