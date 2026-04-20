package com.liliang.service;

import com.liliang.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

public interface AdminService {

    // 【1】会员登录
    public Integer loginAdmin(String username, String password);
}

