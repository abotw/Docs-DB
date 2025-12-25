# * 课堂｜Ranking Functions && Join｜Week 4

# Ranking Functions

- Returns a ranking value for each row in a partition
- **按序排名 →** + `ORDER BY column_name` → **+ `Ranking Function`** -> **新增排名列**

```sql
SELECT *, ROW_NUMBER() OVER (ORDER BY WillNum)
FROM Course

SELECT *, RANK() OVER (ORDER BY WillNum)
FROM Course

SELECT *, DENSE_RANK() OVER (ORDER BY WillNum)
FROM Course
```

## `ROW_NUMBER()`

- every row has a number
- 排名连续，无并列 —— 每个人都有一个排名

## `RANK()`

- 并列跳跃：相同排名并列 —— 排名跳跃

## `DENSE_RANK()`

- 并列不跳跃：相同排名并列 —— 排名不跳跃 —— 稠密

![Untitled](%E8%AF%BE%E5%A0%82%EF%BD%9CRanking%20Functions%20&&%20Join%EF%BD%9CWeek%204%20593f2874610d4c3a8f846b39b0ec7c00/Untitled.png)

# `Join` 多表连接查询数据

[SQL Join](https://www.quackit.com/sql/tutorial/sql_join.cfm)

**SQL Join**

[SQL Joins Tutorial](https://database.guide/sql-joins-tutorial/)

- [ ]  [**SQL Joins Tutorial**](https://database.guide/sql-joins-tutorial/)

## `Cross Join` - 交叉连接 (过时)

```sql
select *
from Class cross join Student
```

- 很多**无意义的数据 → +SOLUTION → Inner Join**

## **`Inner Join … On …` -** 内连接

[SQL Inner Join](https://www.quackit.com/sql/tutorial/sql_inner_join.cfm)

**SQL Inner Join**

- 解决 Cross Join 中很多无意义的数据

1. **相等连接：存在完全相等列**
2. 自然连接：取消完全相等列
3. **比较连接**
4. 自连接

### ※ 相等连接：最多

```sql
-- 查看学生基本信息和所在班级的信息
select *
from Student join Class
on Student.ClassNo = Class.ClassNo
-- 会有重复的 ClassNo
select *
from Student, Class
where Student.ClassNo = Class.ClassNo
```

```sql
-- 查询学生的选课信息，要求显示学号、姓名、课程...
-- Student / StuCou--StuNo / Course--CouNo
select Student.StuNo, StuName, Course.CouNo, CouName, WillOrder
from Student join StuCou
on Student.StuNo = StuCou.StuNo
join Course
on Course.CouNo = StuCou.CouNo
order by StuNo asc, WillOrder asc
```

```sql
-- 查询学生的选课信息，要求显示学号、姓名、课程...
-- Student / StuCou--StuNo / Course--CouNo
select Student.StuNo, StuName, Course.CouNo, CouName, WillOrder
from Student, StuCou, Course
where Student.StuNo=StuCou.StuNo and StuCou.CouNo=Course.CouNo
```

```sql
-- 查询“甘蕾”同学选修的
-- 课程名、学分、上课时间、志愿号，
-- 并按志愿号（升序）排序查询结果。
select CouName, Credit, SchoolTime, WillOrder
from Course join StuCou
on Course.CouNo = StuCou.CouNo
join Student
on Student.StuNo = StuCou.StuNo
where StuName = '甘蕾'
order by WillOrder asc
```

- 子查询应该怎么写？可不可以？

### 自然连接

### ※ 比较连接：次之

- 比较运算符
    - ≠

```sql
select classNo, CouName, Kind, Credit, Teacher, SchoolTime, WillNum
from Course join Class
on Class.DepartNo != Course.DepartNo
```

### 自连接：较少

- 别名

```sql
-- 别名
select C1.CouNo, C1.CouName, C1.Kind, C1.DepartNo
from Course C1 join Course C2
on C1.Kind=C2.Kind and C1.DepartNo!=C2.DepartNo
```

## `Outer Join` 外连接

[SQL Outer Join](https://www.quackit.com/sql/tutorial/sql_outer_join.cfm)

**SQL Outer Join**

- 显示出内连接中排除的数据

### `LEFT (OUTER) JOIN` 左外连接

```sql
-- LEFT JOIN
select StuNo, Course.CouNo, CouName
from StuCou left join Course
on Course.CouNo = StuCou.CouNo
```

### `RIGHT (OUTER) JOIN` 右外连接

```sql
-- RIGHT JOIN
select StuNo, Course.CouNo, CouName
from StuCou right join Course
on Course.CouNo = StuCou.CouNo
```

### `FULL (OUTER) JOIN` 全外连接

```sql
-- FULL JOIN
select StuNo, Course.CouNo, CouName
from StuCou full join Course
on Course.CouNo = StuCou.CouNo
-- Course left join StuCou
-- Course right join StuCou
```