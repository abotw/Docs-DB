# * 课堂｜function，IN - subqueries｜Week 3

# Aggregate Functions 聚合函数

![Pic 1](%E8%AF%BE%E5%A0%82%EF%BD%9Cfunction%EF%BC%8CIN%20-%20subqueries%EF%BD%9CWeek%203%2013c118b172fe4aad8ae95091e5d42c31/Untitled.png)

Pic 1

![Pic 2](%E8%AF%BE%E5%A0%82%EF%BD%9Cfunction%EF%BC%8CIN%20-%20subqueries%EF%BD%9CWeek%203%2013c118b172fe4aad8ae95091e5d42c31/Untitled%201.png)

Pic 2

- [ ]  [SQL `AVG()` for Beginners](https://database.guide/sql-avg-for-beginners/)
- [ ]  [SQL `COUNT()` for Beginners](https://database.guide/sql-count-for-beginners/)
- [ ]  [SQL `MAX()` for Beginners](https://database.guide/sql-max-for-beginners/)
- [ ]  [SQL `MIN()` for Beginners](https://database.guide/sql-min-for-beginners/)
- [ ]  [SQL `SUM()` for Beginners](https://database.guide/sql-sum-for-beginners/)

## `COUNT`

[SQL Count](https://www.quackit.com/sql/tutorial/sql_count.cfm)

**SQL Count**

1. `COUNT(*)` ：returns **everything** — including **null values** and **duplicates**.
2. `COUNT(all)`
3. `COUNT(DISTINCT(column_name))`

count (distinct <colomn_name>)

# `GROUP BY` - 分组查询

- 按 … 分类 / 组、各类、各组

```sql
GROUP BY column_name
[WITH CUBE] -- 多了一行汇总行
[HAVING ...] -- conditions / criteria / 限制条件
```

- `HAVING` vs. `WHERE`
    - `HAVING` clause 里面**可以**使用聚合函数
    - `WHERE` clause 里面**不可以**使用聚合函数

```sql
GROUP BY ALL column_name
```

# `IN` - **Subqueries / 子查询 / 查询嵌套**

[SQL In](https://www.quackit.com/sql/tutorial/sql_in.cfm)

**SQL In**

- `IN` - operator from `WHERE`
- **subqueries** vs. **多表联查**
    - 查询的数据都来自多个表 (multiple tables)
- **适用**：
    1. 没有分组
    2. 需要使用聚合函数

```sql
WHERE column_name IN (SELECT the_same_column_name FROM table_name)
```

## `EXISTS`

？