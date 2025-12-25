## 0. T-SQL 模板

### 1. 创建简单数据库

```sql
CREATE DATABASE TestDB;
```

### 2. 创建带文件配置的数据库

```sql
CREATE DATABASE TestDB
ON PRIMARY 
(
    NAME = 'TestDB_Data',
    FILENAME = 'C:\SQLData\TestDB.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON
(
    NAME = 'TestDB_Log',
    FILENAME = 'C:\SQLData\TestDB_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
```

### 3. 修改数据库选项

```sql
ALTER DATABASE TestDB
SET RECOVERY SIMPLE;
```

### 4. 删除数据库

```sql
DROP DATABASE TestDB;
```

## 1. 创建数据库的基本语法

```sql
CREATE DATABASE database_name;
```

- **`database_name`**：数据库名称，需符合命名规则。
- **文件位置**：可通过 `ON` 和 `LOG ON` 指定数据文件和日志文件的路径。
- **文件大小**：可以使用 `SIZE`（初始大小）、`MAXSIZE`（最大大小） 和 `FILEGROWTH`（自动增长）配置。

## 2. 常见选项

```sql
CREATE DATABASE database_name
ON PRIMARY 
(
    NAME = 'logical_file_name',
    FILENAME = 'physical_file_path',
    SIZE = initial_size_MB,
    MAXSIZE = max_size_MB,
    FILEGROWTH = growth_MB
)
LOG ON
(
    NAME = 'log_file_name',
    FILENAME = 'log_file_path',
    SIZE = initial_size_MB,
    MAXSIZE = max_size_MB,
    FILEGROWTH = growth_MB
);
```

- **PRIMARY**：定义==主数据文件组==。
- **LOG ON**：配置==事务日志文件==。
- **`FILENAME`**：物理文件路径，建议采用==绝对路径==。

## 3. 数据库选项管理

- 使用 `ALTER DATABASE` 修改选项：
    
    ```sql
    ALTER DATABASE database_name
    SET OPTION_NAME = VALUE;
    ```
    
    - **示例选项**：`RECOVERY`（设置恢复模式），`AUTO_CLOSE`（是否自动关闭数据库）。
- 使用 `DROP DATABASE` 删除：
    
    ```sql
    DROP DATABASE database_name;
    ```

#### **4. 学习重点**

1. **语法熟悉度**：熟练掌握 `CREATE DATABASE` 的基本语法及常用选项。
2. **文件管理**：了解如何通过文件路径、大小、增长选项配置存储资源。
3. **事务日志的重要性**：==事务日志是数据库恢复的重要环节，需合理配置==。
4. **数据库选项管理**：掌握 `ALTER DATABASE` 和 `DROP DATABASE` 的常见用法。

**建议：**

- 重点练习模板，理解各部分配置的意义。
- 在 SQL Server Management Studio (SSMS) 上操作，结合 GUI 界面理解相关设置如何通过 T-SQL 实现。