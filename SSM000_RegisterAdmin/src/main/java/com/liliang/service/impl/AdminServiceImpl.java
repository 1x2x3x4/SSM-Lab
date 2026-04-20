package com.liliang.service.impl;

import com.liliang.dao.AdminDao;
import com.liliang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
    @Autowired  //注入Dao层的对象
    private AdminDao adminDao;

    // 【0】顾客注册检测
    @Override
    public Integer checkAdmin(String username) {
        return adminDao.checkAdmin(username);
    }

    // 【0】顾客注册
    @Override
    public Integer registerAdmin(String username, String password) {
        return adminDao.registerAdmin(username, password);
    }
}
