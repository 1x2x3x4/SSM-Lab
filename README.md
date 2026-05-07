# SSM & SpringBoot 后台管理系统案例合集

## 项目简介

本项目为基于 SSM（Spring + SpringMVC + MyBatis）以及 SpringBoot 的后台管理系统功能案例合集，主要用于学习 Java Web 后端开发中的管理员模块实现。

项目包含：

- 管理员注册
- 管理员登录
- 登录拦截器
- 管理员增删改查
- SpringBoot 版本实现
- MyBatis 数据库操作
- Maven 多模块管理

适合：

- Java Web 初学者
- SSM 框架学习
- SpringBoot 入门
- 后台管理系统功能练习

---

# 项目结构

```text
├── DB                               数据库脚本
├── SSM000_RegisterAdmin             管理员注册
├── SSM001_LoginAdmin                管理员登录
├── SSM002_LoginInterceptor          登录拦截器
├── SSM003_ManagerAdmin              管理员管理
├── SSM004_AddAdmin                  添加管理员
├── SSM005_AddAdmin                  添加管理员（扩展版）
├── SSM006_DeleteAdmin               删除管理员
├── SSM007_DeleteAllAdmin            批量删除管理员
├── SSM008_FindAdmin                 查询管理员
├── SpringBoot000_RegisterAdmin      SpringBoot 注册案例
├── pom.xml                          Maven 父工程
└── README.md
```

---

# 技术栈

## 后端技术

- Java
- Spring
- SpringMVC
- MyBatis
- SpringBoot
- Maven

## 数据库

- MySQL

## 前端技术

- JSP
- HTML
- CSS
- JavaScript

---

# 环境要求

| 软件 | 版本建议 |
|---|---|
| JDK | 8+ |
| Maven | 3.6+ |
| MySQL | 5.7+ |
| IDEA | 推荐 IntelliJ IDEA |

---

# 数据库配置

1. 创建数据库：

```sql
CREATE DATABASE [数据库名] DEFAULT CHARSET utf8;
```

2. 导入 `DB` 文件夹中的 SQL 脚本。

3. 修改数据库连接配置：

```properties
jdbc.url=jdbc:mysql://localhost:3306/[数据库名]
jdbc.username=root
jdbc.password=root
```

---

# 项目运行

## 1. 克隆项目

```bash
git clone 项目地址
```

## 2. 导入 IDEA

选择：

```text
Open -> 选择项目目录
```

等待 Maven 自动下载依赖。

---

## 3. 配置 Tomcat

- 添加 Tomcat
- 配置 Artifact
- 启动项目

---

## 4. 访问项目

示例：

```text
http://localhost:8080/
```

---

# 功能演示

## 管理员注册

模块：

```text
SSM000_RegisterAdmin
```

功能：

- 用户注册
- 表单提交
- 数据库存储

---

## 管理员登录

模块：

```text
SSM001_LoginAdmin
```

功能：

- 登录校验
- Session 保存
- 登录状态管理

---

## 登录拦截器

模块：

```text
SSM002_LoginInterceptor
```

功能：

- 未登录拦截
- 权限校验
- 登录保护

---

## 管理员管理

模块：

```text
SSM003_ManagerAdmin
```

功能：

- 管理员列表
- 管理员信息管理

---

## 添加管理员

模块：

```text
SSM004_AddAdmin
SSM005_AddAdmin
```

功能：

- 添加管理员
- 表单验证

---

## 删除管理员

模块：

```text
SSM006_DeleteAdmin
SSM007_DeleteAllAdmin
```

功能：

- 单个删除
- 批量删除

---

## 查询管理员

模块：

```text
SSM008_FindAdmin
```

功能：

- 条件查询
- 模糊查询

---

## SpringBoot 实现

模块：

```text
SpringBoot000_RegisterAdmin
```

功能：

- SpringBoot 注册功能实现
- 简化配置开发

---
---

# 学习建议

建议学习顺序：

```text
注册 -> 登录 -> 拦截器 -> 增删改查 -> SpringBoot
```

每个模块相互独立，方便单独学习与调试。

---
---

## 数据库连接失败

检查：

- MySQL 是否启动
- 用户名密码是否正确
- 数据库是否存在

---
---

# License

本项目仅供学习交流使用。