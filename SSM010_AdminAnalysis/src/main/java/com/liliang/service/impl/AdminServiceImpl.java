package com.liliang.service.impl;

import com.liliang.dao.AdminDao;
import com.liliang.pojo.Admin;
import com.liliang.pojo.Page;
import com.liliang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
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

    // 【1】顾客登录
    @Override
    public Integer loginAdmin(String username, String password) {
        return adminDao.loginAdmin(username, password);
    }

    // 【3】 顾客无分页管理
    //@Override
    //public List<Admin> findAllAdmin() {
    //return this.adminDao.findAllAdmin();
    //}findAllAdmin

    //【3】顾客有分页管理
    @Override
    public Page findAllAdmin(int page, Admin admin) {
        int num = adminDao.countAdmin(admin);

        Page pageAndData = new Page(page, num);

        pageAndData.setRecords(adminDao.findAllAdmin(pageAndData.getStartIndex(), pageAndData.getPagesize(), admin));
        return pageAndData;
    }

    //【4】添加客户
    @Override
    public int addAdmin(Admin admin) {
        return this.adminDao.addAdmin(admin);
    }

    //【5】向更新客户信息页面跳转
    @Override
    public Admin findAdminById(int id) {
        return this.adminDao.findAdminById(id);
    }

    // 【5】更新客户
    @Override
    public int updateAdmin(Admin admin) {
        return this.adminDao.updateAdmin(admin);
    }

    //【6】删除客户
    @Override
    public int deleteAdmin(int id) {
        return adminDao.deleteAdmin(id);
    }

    // 【7】批量删除用户
    @Override
    @Transactional
    public void deleteAdminByIds(List<Integer> ids) {
        for (Integer id : ids) {
            adminDao.deleteAdminByIds(id);
        }
    }

    // 【8】根据姓名或职业查询
    @Override
    public List<Admin> findAdminByNameOrJobs(Admin admin) {
        return this.adminDao.findAdminByNameOrJobs(admin);
    }

    // 【9】数据统计
    @Override
    public Map<String, Integer> countSex() {
        Map<String, Integer> sexCount = new HashMap<String, Integer>();
        sexCount.put("男", adminDao.countSex("男"));
        sexCount.put("女", adminDao.countSex("女"));
        return sexCount;
    }
}
