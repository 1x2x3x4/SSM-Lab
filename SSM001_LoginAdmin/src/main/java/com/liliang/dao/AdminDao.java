package com.liliang.dao;

import org.apache.ibatis.annotations.Param;

public interface AdminDao {

    // 【0】顾客注册检测
    public Integer checkAdmin(String username);

    // 【0】顾客注册
    public Integer registerAdmin(@Param("username") String username, @Param("password") String password);

    // 【1】会员登录
    public Integer loginAdmin(@Param("username") String username, @Param("password") String password);

}
