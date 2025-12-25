# MySQL-01: Introduction

## 1. What Is MySQL?

**MySQL** is a **relational database management system (RDBMS)**.

-   **Database**: a place to store data in an organized way
-   **Relational**: data is stored in tables with rows and columns
-   **SQL**: Structured Query Language, used to operate on data

MySQL is widely used in:

-   Web applications (PHP, Python, Java)
-   Backend systems
-   Data storage for small to large systems

------

## 2. Basic Concepts (Very Important)

### 2.1 Database

A **database** is a container for tables.

```
Database
 ├── table_1
 ├── table_2
 └── table_3
```

Example:

```sql
CREATE DATABASE school;
```

------

### 2.2 Table

A **table** stores data in rows and columns.

| id   | name  | age  |
| ---- | ----- | ---- |
| 1    | Alice | 20   |
| 2    | Bob   | 21   |

Example:

```sql
CREATE TABLE student (
    id INT,
    name VARCHAR(50),
    age INT
);
```

------

### 2.3 Row and Column

-   **Row (record)**: one piece of data
-   **Column (field)**: one attribute of data

Example:

```text
(1, 'Alice', 20) → one row
name, age        → columns
```

------

## 3. Installing MySQL (Overview)

Common ways:

-   MySQL Installer (Windows)
-   Homebrew (macOS)
-   Linux package manager (apt / yum)

After installation, log in:

```bash
mysql -u root -p
```

------

## 4. Basic SQL Categories

SQL statements are usually divided into:

| Category | Meaning          | Examples               |
| -------- | ---------------- | ---------------------- |
| DDL      | Define structure | CREATE, DROP           |
| DML      | Operate data     | INSERT, UPDATE, DELETE |
| DQL      | Query data       | SELECT                 |
| DCL      | Permissions      | GRANT, REVOKE          |

Beginners focus mainly on **DDL + DML + SELECT**.

------

## 5. Database Operations

### 5.1 Show Databases

```sql
SHOW DATABASES;
```

### 5.2 Create Database

```sql
CREATE DATABASE test_db;
```

### 5.3 Use Database

```sql
USE test_db;
```

------

## 6. Table Operations

### 6.1 Create Table

```sql
CREATE TABLE users (
    id INT,
    username VARCHAR(50),
    email VARCHAR(100)
);
```

### 6.2 View Table Structure

```sql
DESC users;
```

### 6.3 Drop Table

```sql
DROP TABLE users;
```

------

## 7. Data Types (Common Ones)

### 7.1 Numeric Types

| Type   | Description   |
| ------ | ------------- |
| INT    | Integer       |
| BIGINT | Large integer |

### 7.2 String Types

| Type       | Description            |
| ---------- | ---------------------- |
| VARCHAR(n) | Variable-length string |
| TEXT       | Long text              |

### 7.3 Date Types

| Type     | Description |
| -------- | ----------- |
| DATE     | YYYY-MM-DD  |
| DATETIME | Date + time |

------

## 8. Insert Data (INSERT)

```sql
INSERT INTO users (id, username, email)
VALUES (1, 'alice', 'alice@test.com');
```

Insert multiple rows:

```sql
INSERT INTO users VALUES
(2, 'bob', 'bob@test.com'),
(3, 'tom', 'tom@test.com');
```

------

## 9. Query Data (SELECT) ⭐ Most Important

### 9.1 Select All

```sql
SELECT * FROM users;
```

### 9.2 Select Specific Columns

```sql
SELECT username, email FROM users;
```

### 9.3 WHERE Condition

```sql
SELECT * FROM users WHERE id = 1;
SELECT * FROM users WHERE username = 'alice';
```

### 9.4 AND / OR

```sql
SELECT * FROM users
WHERE id > 1 AND username = 'bob';
```

------

## 10. Update Data (UPDATE)

```sql
UPDATE users
SET email = 'alice@new.com'
WHERE id = 1;
```

⚠️ **Always use WHERE**, or all rows will be updated.

------

## 11. Delete Data (DELETE)

```sql
DELETE FROM users WHERE id = 3;
```

Delete all rows:

```sql
DELETE FROM users;
```

------

## 12. Primary Key and Auto Increment

### 12.1 Primary Key

A **primary key** uniquely identifies a row.

```sql
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);
```

### 12.2 AUTO_INCREMENT

```sql
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);
```

Insert without id:

```sql
INSERT INTO student (name) VALUES ('Alice');
```

------

## 13. Constraints (Data Rules)

| Constraint  | Purpose           |
| ----------- | ----------------- |
| PRIMARY KEY | Unique identifier |
| NOT NULL    | Cannot be empty   |
| UNIQUE      | No duplicates     |
| DEFAULT     | Default value     |

Example:

```sql
CREATE TABLE account (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    status INT DEFAULT 1
);
```

------

## 14. Simple Sorting and Limiting

### 14.1 ORDER BY

```sql
SELECT * FROM users ORDER BY id DESC;
```

### 14.2 LIMIT

```sql
SELECT * FROM users LIMIT 2;
SELECT * FROM users LIMIT 2 OFFSET 1;
```

------

## 15. Basic Aggregation

### 15.1 COUNT

```sql
SELECT COUNT(*) FROM users;
```

### 15.2 GROUP BY

```sql
SELECT status, COUNT(*)
FROM account
GROUP BY status;
```

------

## 16. Very Simple JOIN (Preview)

```sql
SELECT u.username, o.order_id
FROM users u
JOIN orders o ON u.id = o.user_id;
```

(You can study JOIN in depth later.)

------

## 17. Common Beginner Mistakes

1.  Forgetting `WHERE` in UPDATE / DELETE
2.  Confusing `VARCHAR` length with actual storage
3.  Using `SELECT *` everywhere
4.  No primary key
5.  Mixing database and table concepts

------

## 18. How to Practice Effectively

1.  Create a small project:
    -   users
    -   orders
    -   products
2.  Write SQL by hand
3.  Use `DESC` and `SELECT` frequently
4.  Break complex queries into simple ones

------

## 19. What to Learn Next

After this tutorial, you should continue with:

-   JOIN (INNER / LEFT)
-   Indexes
-   Transactions
-   Normalization
-   MySQL with Python (PyMySQL / SQLAlchemy)

------

## 20. Summary

-   MySQL stores data in **tables**
-   SQL is used to **create, query, update, delete**
-   Start simple: `CREATE`, `INSERT`, `SELECT`
-   Practice is more important than memorization