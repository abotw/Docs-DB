# 实训｜Week 4

# 1-1

![1-1.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-1.png)

[1-1.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-1.sql)

- 多表连接查询
    - join … on …
    - …, … where …
- 子查询
    - in
    - exists

```sql
SELECT StuName, StuNo
FROM Student
WHERE EXISTS(
SELECT *
FROM Class
WHERE ClassName='00电子商务' and Class.ClassNo = Student.ClassNo)
```

# 1-2

![1-2.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-2.png)

[1-2.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-2.sql)

# 1-3

![1-3.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-3.png)

[1-3.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/1-3.sql)

# 2-1

![2-1.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-1.png)

[2-1.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-1.sql)

# 2-2

![2-2.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-2.png)

[2-2.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-2.sql)

# 2-3

![2-3.png](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-3.png)

[2-3.sql](%E5%AE%9E%E8%AE%AD%EF%BD%9CWeek%204%20b40f7af65ff14052830ec32aebdfbad3/2-3.sql)