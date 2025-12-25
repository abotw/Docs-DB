## create database

## create table

### 图书

| column name | data type   | constraints    |
| ----------- | ----------- | -------------- |
| 图书编号        | char(6)     | not null       |
| 书名          | varchar(20) | not null       |
| 类别          | char(12)    |                |
| 作者          | varchar(20) |                |
| 出版社         | varchar(20) | default: 人邮出版社 |
| 出版日期        | datetime    |                |
| 定价          | money       |                |

### 读者类型

| column name | data type | constraints |
| ----------- | --------- | ----------- |
| 类型编号        | int       | not null    |
| 类型名称        | char(8)   | not null    |
| 限借数量        | int       | not null    |
| 借阅期限        | int       |             |

### 读者

| column name | data type   | constraints           |
| ----------- | ----------- | --------------------- |
| 读者编号        | char(4)     | not null, primary key |
| 姓名          | char(6)     | not null              |
| 性别          | char(2)     |                       |
| 单位          | varchar(20) |                       |
| 电话          | varchar(13) |                       |
| 读者类型        | int         |                       |
| 已借数量        | int         |                       |

### 借阅

| column name | data type | constraints           |
| ----------- | --------- | --------------------- |
| 读者编号        | char(4)   | not null              |
| 图书编号        | char(6)   | not null, foreign key |
| 借书日期        | datetime  | not null              |
| 还书日期        | datetime  |                       |


