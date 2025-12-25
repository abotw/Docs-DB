
## 0. T-SQL 模板

### 1. 在创建表时定义约束

- **列级约束：**

```sql
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT CHECK (Age >= 0),
    EnrollmentDate DATE DEFAULT GETDATE()
);
```

- **表级约束：**

```sql
CREATE TABLE Enrollments (
    EnrollmentID INT,
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (EnrollmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
```

---

### 2. 在表创建后添加或删除约束

- **添加主键：**

```sql
ALTER TABLE Students
ADD CONSTRAINT PK_Students PRIMARY KEY (StudentID);
```

- **添加外键：**

```sql
ALTER TABLE Enrollments
ADD CONSTRAINT FK_Enrollments_Students FOREIGN KEY (StudentID)
REFERENCES Students(StudentID);
```

- **添加检查约束：**

```sql
ALTER TABLE Students
ADD CONSTRAINT CHK_Students_Age CHECK (Age >= 18);
```

- **删除约束：**

```sql
ALTER TABLE Students
DROP CONSTRAINT CHK_Students_Age;
```

---

## 1. 约束的作用

约束用于对表中数据进行限制，确保数据完整性和一致性。常见约束包括：

- **PRIMARY KEY**：唯一标识表中的记录。
- **FOREIGN KEY**：建立表与表之间的关系。
- **NOT NULL**：防止列值为空。
- **UNIQUE**：确保列中的值唯一。
- **DEFAULT**：为列提供默认值。
- **CHECK**：限制列值的范围或条件。

---

## 2. 在创建表时使用约束

约束可以在列级和表级指定：

- **列级约束**：直接在列定义中声明。
- **表级约束**：在所有列定义之后声明。

**语法示例：**

```sql
CREATE TABLE table_name (
    column_name data_type [constraint],
    ...
    [table_constraint]
);
```

---

## 3. 在表创建后添加或修改约束

- **添加约束**： 使用 `ALTER TABLE` 添加新的约束。
    
    ```sql
    ALTER TABLE table_name
    ADD [CONSTRAINT constraint_name] constraint_definition;
    ```
    
- **删除约束**： 使用 `ALTER TABLE` 删除指定约束。
    
    ```sql
    ALTER TABLE table_name
    DROP CONSTRAINT constraint_name;
    ```
    

---

## 学习重点

1. **PRIMARY KEY 和 FOREIGN KEY** 是学习重点，掌握它们如何维护数据完整性。
2. 理解==列级约束==和==表级约束==的区别，明确适用场景。
3. 熟悉 `ALTER TABLE` 的使用，动态修改表结构和约束。

---


**建议：**

- 练习结合 `PRIMARY KEY` 和 `FOREIGN KEY` 创建==主表==和==从表==，观察数据完整性检查的效果。
- 在 SQL Server Management Studio 中，结合 GUI 和 T-SQL 代码，熟悉约束的添加、修改与删除操作。
