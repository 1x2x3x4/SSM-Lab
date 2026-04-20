package com.liliang.service;

import com.liliang.pojo.Admin;
import java.util.List;

public interface AdminService {

    // 【0】顾客注册检测
    public Integer checkAdmin(String username);

    // 【0】顾客注册
    public Integer registerAdmin(String username, String password);

    // 【1】顾客登录
    public Integer loginAdmin(String username, String password);

    //【2】查询客户列表
    public List<Admin> findAllAdmin();


}
