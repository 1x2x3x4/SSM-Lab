package com.liliang.controller;
import com.liliang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller  //注入控制层的Bean
public class AdminController {

    @Autowired //注入Service层的对象
    private AdminService adminService;

    //【0】省略注册模块在原基础上进行以下登录模块的功能开发
    // 【1】向登录会员页面跳转
    @RequestMapping("/toLogin")  //设置访问路径
    public String toLoginAdmin() {
        return "/login";
    }

    //【1】会员登录
    @RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)           //设置访问路径
    public String loginAdmin(String username, String password, Model model) {  //Model model对象存储数据到视图页面显示
        if (adminService.loginAdmin(username, password) > 0) {              //调用service层方法
            model.addAttribute("message", username);
            return "redirect:toIndex";
        } else {
            model.addAttribute("message", "温馨提示: 很遗憾，您登录失败！");
        }
        return "/login";
    }

    //【2】查询会员列表跳转
    @RequestMapping("/toIndex")  //设置访问路径
    public String toIndexAdmin() {
        return "/index";
    }

}
