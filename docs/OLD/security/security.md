### 实验报告

#### 实验目的

通过本实验，学生将能够：

1. 深入理解数据安全性和完整性的基本概念。
2. 了解 SQL Server 提供的数据安全性和完整性控制机制。
3. 掌握用户、角色及操作权限的创建和管理方法。
4. 学会 T-SQL 表达触发器的实现和创建方法。

#### 实验任务与操作步骤

**任务 1：创建并验证 SQL Server 身份验证的登录名 stu_login1**

1. 打开 SQL Server Management Studio (SSMS)。
2. 使用 T-SQL 创建登录名 stu_login1。

```sql
CREATE LOGIN stu_login1
WITH PASSWORD = '123',
     DEFAULT_DATABASE = master;
```

3. 验证创建的登录名 stu_login1，尝试以该登录名连接到 SQL Server。

**任务 2：使用 T-SQL 创建并验证登录名 stu_login2**

1. 创建登录名 stu_login2，指定默认数据库为 library。

```sql
CREATE LOGIN stu_login2
WITH PASSWORD = '123',
     DEFAULT_DATABASE = library;
```

2. 验证创建的登录名 stu_login2，尝试以该登录名连接到 SQL Server。

**任务 3：创建数据库用户 stu_login1_u 和 stu_login2_u**

1. 使用登录账户 sa 登录。
2. 在 library 数据库中，为登录名 stu_login1 和 stu_login2 分别创建数据库用户。

```sql
USE library;
CREATE USER stu_login1_u FOR LOGIN stu_login1;
CREATE USER stu_login2_u FOR LOGIN stu_login2;
```

**任务 4：创建应用程序角色 applibrole**

1. 在 library 数据库中，创建应用程序角色 applibrole，并授予查询“图书”表的权限。

```sql
CREATE APPLICATION ROLE applibrole
WITH PASSWORD = '123';
GRANT SELECT ON Books TO applibrole;
```

2. 验证无权限查询“图书”表的用户 stu_loginp_u 能通过应用程序角色访问表。

**任务 5：创建登录账户 stu_loginA 并管理架构**

1. 创建登录账户 stu_loginA 并映射到库中的数据库用户 stu_loginA_U。

```sql
CREATE LOGIN stu_loginA
WITH PASSWORD = '123';
USE library;
CREATE USER stu_loginA_U FOR LOGIN stu_loginA;
```

2. 指定数据库用户 stu_loginA_U 为架构 stua_schema 所有者。

```sql
CREATE SCHEMA stua_schema AUTHORIZATION stu_loginA_U;
```

3. 将“读者”表移入架构中。

```sql
ALTER SCHEMA stua_schema TRANSFER dbo.Readers;
```

**任务 6：验证权限变化**

1. 创建数据库用户 stu_loginB_U。

```sql
CREATE USER stu_loginB_U WITHOUT LOGIN;
```

2. 授予其在架构 stua_schema 下对象的 SELECT 权限。

```sql
GRANT SELECT ON SCHEMA::stua_schema TO stu_loginB_U;
```

**任务 7：创建视图**

1. 授予数据库用户 stu_loginC_U 创建视图的权限。

```sql
CREATE USER stu_loginC_U WITHOUT LOGIN;
GRANT CREATE VIEW TO stu_loginC_U;
```

2. 创建视图 stuc_schema.bookcount，用于统计图书总数。

```sql
CREATE VIEW stuc_schema.bookcount AS
SELECT COUNT(*) AS TotalBooks FROM Books;
```

**任务 8：操作数据库用户权限**

1. 授予 stu_login1_u 创建表的权限。

```sql
GRANT CREATE TABLE TO stu_login1_u;
```

2. 验证 stu_login1_u 创建表的权限。

```sql
CREATE TABLE login1_schema.TestTable (
    ID INT PRIMARY KEY,
    Name NVARCHAR(50)
);
```

3. 授予 stu_login2_u 查询和更新“图书”表的权限。

```sql
GRANT SELECT, UPDATE ON Books TO stu_login2_u;
```

4. 验证查询和更新权限。

```sql
SELECT * FROM Books;
UPDATE Books SET Author = 'Updated Author' WHERE BookID = 1;
```

**任务 9：创建数据库角色 librole**

1. 在 library 数据库中创建角色 librole 并授予查询“图书”表部分列的权限。

```sql
CREATE ROLE librole;
GRANT SELECT (BookID, Title, Author) ON Books TO librole;
```

2. 将 lib_loginT_U 设置为 librole 成员，并授予其 WITH GRANT OPTION 权限。

```sql
CREATE USER lib_loginT_U WITHOUT LOGIN;
CREATE USER lib_loginS_U WITHOUT LOGIN;
ALTER ROLE librole ADD MEMBER lib_loginT_U;
GRANT ALTER ROLE TO lib_loginT_U WITH GRANT OPTION;
```

#### 实验总结

**知识点总结：**

1. **SQL Server 登录名与用户：**
    - 登录名用于认证，数据库用户用于授权。
    - 区分 SQL Server 身份验证与 Windows 身份验证。
2. **数据库用户和架构：**
    - 数据库用户与登录名的映射关系。
    - 架构用于组织数据库对象并控制权限。
    - 授权架构所有者可以管理架构中的对象。
3. **应用程序角色：**
    - 应用程序角色用于控制数据库访问权限，通常由应用程序激活。
    - 通过 `EXECUTE AS` 激活应用程序角色后，用户获取该角色的权限。
4. **权限管理：**
    - 授权和撤销权限：`GRANT`, `REVOKE`, `DENY`。
    - 权限继承与粒度：支持对象级、列级、架构级的权限控制。
    - `WITH GRANT OPTION` 用于允许用户将权限授予他人。
5. **视图：**
    - 视图用于封装查询逻辑，提高数据访问的安全性和灵活性。
    - 通过视图限制用户访问特定列或数据。
6. **角色：**
    - 数据库角色简化权限管理，用户通过角色继承权限。
    - `ALTER ROLE` 和 `DROP ROLE` 操作角色的成员资格。
7. **T-SQL 语法与实践：**
    - 熟练使用 T-SQL 语句完成用户创建、权限分配、视图创建等操作。
    - 动态管理数据库对象和权限。
