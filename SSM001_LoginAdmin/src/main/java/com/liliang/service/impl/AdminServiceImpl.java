package com.liliang.service.impl;

import com.liliang.dao.AdminDao;
import com.liliang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
    @Autowired  //注入Dao层的对象
    private AdminDao adminDao;

    // 【1】会员登录
    @Override
    public Integer loginAdmin(String username, String password) {
        return  adminDao.loginAdmin(username, password);
    }

}
