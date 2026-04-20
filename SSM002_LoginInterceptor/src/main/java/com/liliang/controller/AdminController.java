package com.liliang.controller;

import com.liliang.pojo.Admin;
import com.liliang.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller  //注入控制层的Bean
public class AdminController {
    @Resource //注入Service层的对象
    private AdminService adminService;

    // 【0】向注册客户页面跳转
    @RequestMapping("/toRegister")   //设置访问路径
    public String toRegisterAdmin() {
        return "/login";
    }

    // 【0】顾客注册
    @RequestMapping(value = "/registerAdmin", method = RequestMethod.POST)    //设置访问路径
    public String register(String username, String password, Model model) {   //Model model对象存储数据到视图页面显示
        if (adminService.checkAdmin(username) > 0) {                    //调用service层方法
            model.addAttribute("message", "温馨提示: 该用户名已存在！");
            return "redirect:/toRegister";
        }
        if (adminService.registerAdmin(username, password) > 0) {       //调用service层方法
            model.addAttribute("message", "温馨提示: 恭喜您，注册成功！");
        }
        return "/login";
    }

    // 【1】向登录客户页面跳转
    @RequestMapping("/toLogin")  //设置访问路径
    public String toLoginAdmin() {
        return "/login";
    }

    //【1】用户登录拦截器
    @RequestMapping(value = "/loginAdmin", method = RequestMethod.POST)      //设置访问路径
    public String loginAdmin(String username, String password, Model model, HttpServletRequest request) {
                                                                             //Model model对象存储数据到视图页面显示
                                                                             //HttpServletRequest request 设置拦截器
        if (adminService.loginAdmin(username, password) > 0) {               //调用service层方法 userId
            request.getSession().setAttribute("userId", username);     //HttpServletRequest request 设置拦截器
            model.addAttribute("message", username);
            return "redirect:toIndex";
        } else {
            model.addAttribute("message", "温馨提示: 很遗憾，您登录失败！");
        }
        return "/login";
    }

    //【2】查询客户列表跳转
    @RequestMapping("/toIndex")  //设置访问路径
    public String toIndexAdmin() {
        return "/index";
    }
}
