package com.news.controller;

import com.news.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    // 跳转到注册页
    @RequestMapping("/toRegister")
    public String toRegisterAdmin() {
        // 错误写法：return "/login";
        // 正确写法：不要加斜杠！自动拼接前缀后缀
        return "/login";
    }

    // 注册提交
    @RequestMapping(value = "/registerAdmin", method = RequestMethod.POST)
    public String register(String username, String password, Model model) {
        if (adminService.checkAdmin(username) > 0) {
            model.addAttribute("message", "温馨提示: 该用户名已存在！");
            return "login"; // 这里也不要 redirect，直接返回页面
        }
        if (adminService.registerAdmin(username, password) > 0) {
            model.addAttribute("message", "温馨提示: 恭喜您，注册成功！");
        }
        return "/login";
    }
}