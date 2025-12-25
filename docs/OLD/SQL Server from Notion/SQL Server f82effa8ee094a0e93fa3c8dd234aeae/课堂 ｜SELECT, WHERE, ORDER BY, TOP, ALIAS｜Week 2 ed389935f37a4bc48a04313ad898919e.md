# * 课堂 ｜SELECT, WHERE, ORDER BY, TOP, ALIAS｜Week 2

## Operator

[SQL Operators](https://database.guide/sql-operators/)

- [ ]  [**SQL Operators**](https://database.guide/sql-operators/)

[12 Commonly Used SQL Operators](https://database.guide/12-commonly-used-sql-operators/)

- [ ]  [**12 Commonly Used SQL Operators**](https://database.guide/12-commonly-used-sql-operators/)
- 逻辑运算符
    - `and`｜`or` ｜`not`
- 算术运算符
    - `+`｜`-`｜`*`｜`/`｜`%`
- 比较运算符
    - `>`｜`<`｜`≥`｜`≤`｜`≠`
- 范围运算符
    - `in`
    - `between … and …`｜`not between … and …`

```sql
-- Method-1
SELECT CouNo, CouName
FROM Course
WHERE WillNum >= 30 and WillNum <= 40
-- Method-2
SELECT CouNo, CouName
FROM Course
WHERE WillNum between 30 and 40
```

```sql
-- Method-1
SELECT *
FROM Course
WHERE DepartNo ='02' or DepartNo ='03';

-- Method-2
SELECT *
FROM Course
WHERE DepartNo between '02' and '03';

-- Method-3
SELECT *
FROM Course
WHERE DepartNo in ('02', '03')
```

# `TOP`

[SQL Top](https://www.quackit.com/sql/tutorial/sql_top.cfm)

**SQL Top**

- `TOP 1 *`
- `TOP 10 PERCENT *`

```sql
SELECT TOP 10 PERCENT *
FROM Course
```

# `ALIAS`

[SQL Alias](https://www.quackit.com/sql/tutorial/sql_alias.cfm)

**SQL Alias**

[SQL Alias Explained](https://database.guide/sql-alias-explained/)

- [ ]  [**SQL Alias Explained**](https://database.guide/sql-alias-explained/)
1. `‘alias’ = column_name`
2. `column_name ‘alias’`
3. `column_name AS ‘alias’`

```sql
-- 1. '名字' = 列名
SELECT '学号' = StuNo, '姓名' = StuName
FROM Student

-- 2. 列名 '名字'
SELECT StuNo '学号', StuName '姓名'
FROM Student

-- 3. 列名 AS '名字'
SELECT StuNo AS '学号', StuName AS '姓名'
FROM Student
```

```sql

SELECT CouNo AS '课程编号', '的课程名称是', CouName AS '课程名称'
FROM Course
```

# `LIKE` **Pattern Matching /** 模糊匹配

- `LIKE` - operator
- `WHERE column_name LIKE ‘…’`
    1. `%` - 0个或多个字符
    2. `_` - 任意单个字符
    3. `[]` - 在范围内
    4. `[^]` - 不在范围内