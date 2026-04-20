package com.liliang.service;

import com.liliang.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

public interface AdminService {
    // 【0】顾客注册检测
    public Integer checkAdmin(String username);

    // 【0】顾客注册
    public Integer registerAdmin(String username, String password);
}
