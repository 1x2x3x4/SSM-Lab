package com.liliang.dao;

import com.liliang.pojo.Admin;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface AdminDao {

    // 【0】顾客注册检测
    public Integer checkAdmin(String username);

    // 【0】顾客注册
    public Integer registerAdmin(@Param("username") String username, @Param("password")String password);

    // 【1】顾客登录
    public Integer loginAdmin(@Param("username") String username, @Param("password")String password);

    // 【2】客户列表
    public List<Admin> findAllAdmin();

    //【4】添加客户
    public int addAdmin(Admin admin);
}
