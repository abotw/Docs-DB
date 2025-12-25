
存储过程是一组 T-SQL 语句的集合，用于完成特定任务。它可以重复调用，提供更高的代码复用性和性能优化能力。

---

### **学习重点**

1. **存储过程的基本结构**
    - 存储过程由名称、输入参数（可选）、输出参数（可选）、T-SQL 逻辑代码组成。
    - 语法以 `CREATE PROCEDURE` 开头，主体代码块包含在 `BEGIN...END` 之间。
2. **存储过程的优点**
    - **提高效率**：存储过程预编译并缓存，提高执行速度。
    - **代码复用**：复杂的业务逻辑封装为可重复调用的模块。
    - **安全性**：通过权限控制限制用户直接访问数据表。
3. **参数类型**
    - **输入参数**（`IN`）：供调用时传入值。
    - **输出参数**（`OUT`）：供存储过程返回结果。
    - **无参存储过程**：不需要传递任何参数。
4. **执行和调试**
    - 使用 `EXEC` 或 `EXECUTE` 调用存储过程。
    - 调试存储过程时可用 `PRINT` 输出调试信息。
5. **修改和删除**
    - 修改存储过程：使用 `ALTER PROCEDURE`。
    - 删除存储过程：使用 `DROP PROCEDURE`。

---

### **T-SQL 模版**

#### **创建存储过程**

```sql
CREATE PROCEDURE ProcedureName
    @Param1 DataType = DefaultValue, -- 输入参数1（可选默认值）
    @Param2 DataType OUTPUT          -- 输出参数（可选）
AS
BEGIN
    -- 主体代码块
    BEGIN TRY
        -- 主逻辑
        -- 示例：SELECT、INSERT、UPDATE 或其他业务逻辑
        SELECT @Param1 AS InputValue;
        
        -- 设置输出参数值（如果有）
        SET @Param2 = @Param1 * 2; 

    END TRY
    BEGIN CATCH
        -- 错误处理逻辑
        PRINT 'An error occurred.';
    END CATCH
END;
GO
```

---

#### **调用存储过程**

```sql
-- 调用存储过程（无输出参数）
EXEC ProcedureName @Param1 = 10;

-- 调用存储过程（带输出参数）
DECLARE @OutputVar DataType;
EXEC ProcedureName @Param1 = 10, @Param2 = @OutputVar OUTPUT;
PRINT @OutputVar;
```

---

#### **修改存储过程**

```sql
ALTER PROCEDURE ProcedureName
    @Param1 DataType
AS
BEGIN
    -- 修改后的逻辑
    PRINT 'Modified procedure logic';
END;
GO
```

---

#### **删除存储过程**

```sql
DROP PROCEDURE ProcedureName;
GO
```

---

### **实用示例**

#### **示例 1：无参数存储过程**

```sql
CREATE PROCEDURE GetAllEmployees
AS
BEGIN
    SELECT * FROM Employees; -- 返回所有员工信息
END;
GO

-- 调用存储过程
EXEC GetAllEmployees;
```

#### **示例 2：带输入参数**

```sql
CREATE PROCEDURE GetEmployeeById
    @EmployeeId INT
AS
BEGIN
    SELECT * FROM Employees WHERE Id = @EmployeeId;
END;
GO

-- 调用存储过程
EXEC GetEmployeeById @EmployeeId = 101;
```

#### **示例 3：带输出参数**

```sql
CREATE PROCEDURE CalculateSquare
    @InputValue INT,
    @Result INT OUTPUT
AS
BEGIN
    SET @Result = @InputValue * @InputValue;
END;
GO

-- 调用存储过程
DECLARE @Square INT;
EXEC CalculateSquare @InputValue = 4, @Result = @Square OUTPUT;
PRINT @Square; -- 输出结果为 16
```

---

### **常见错误和注意事项**

1. **事务管理**：在存储过程中使用事务时，确保处理好回滚（`ROLLBACK`）和提交（`COMMIT`）。
2. **权限控制**：限制用户对存储过程的访问权限，避免数据泄露。
3. **命名规范**：存储过程名称应简洁明了，遵循项目的命名约定。

通过这些要点和模版，学生可以快速掌握存储过程的基础和实际应用能力。