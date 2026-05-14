package com.liliang.service;

import com.liliang.pojo.Admin;
import com.liliang.pojo.Page;

import java.util.List;
import java.util.Map;

public interface AdminService {

    // 【0】顾客注册检测
    public Integer checkAdmin(String username);

    // 【0】顾客注册
    public Integer registerAdmin(String username, String password);

    // 【1】顾客登录
    public Integer loginAdmin(String username, String password);

    //【2】查询客户列表
    //public List<Admin> findAllAdmin();

    //【3】顾客有分页管理
    public Page findAllAdmin(int page, Admin admin);

    //【4】添加客户
    public int addAdmin(Admin admin);

    //【5】向更新客户信息页面跳转
    public Admin findAdminById(int id);

    // 【5】更新客户
    public int updateAdmin(Admin admin);

    //【6】删除客户
    public int deleteAdmin(int id);

    // 【7】批量删除用户
    public void deleteAdminByIds(List<Integer> ids);

    // 【8】根据姓名或职业查询
    public List<Admin> findAdminByNameOrJobs(Admin admin);

    // 【9】数据统计
    public Map<String, Integer> countSex();

}
