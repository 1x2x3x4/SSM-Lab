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
        if (adminService.loginAdmin(username, password) > 0) {               //调用service层方法
            request.getSession().setAttribute("userId", username);     //HttpServletRequest request 设置拦截器
            model.addAttribute("message", username);
            return "redirect:/toIndex";
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

    //【2】查询客户列表
    @RequestMapping("/findAllAdmin")
    public String findAllAdmin(Model model) {
        List<Admin> admin = adminService.findAllAdmin();
        model.addAttribute("admin", admin);
        //返回客户信息展示页面
        return "/Admin_ManageAdmin";
    }

    // 【4】向添加客户页面跳转
    @RequestMapping("/toAddAdmin")  //设置访问路径
    public String toAddAdmin() {
        return "/Admin_AddAdmin";
    }

    //【4】添加客户
    @RequestMapping("/addAdmin")                                  //设置访问路径
    public String addCustomer(Admin admin, Model model) {   //Model model对象存储数据到视图页面显示
        String message;
        //执行Service层中的创建方法，返回的是受影响的行数
        int rows = adminService.addAdmin(admin);         //调用service层方法
        if (rows > 0) {
            message = "新用户" + admin.getUsername() + "添加成功！";
        } else {
            message = "新用户" + admin.getUsername() + "添加失败！";
        }
        //将添加结果信息保存
        model.addAttribute("message", message);

        //将添加后重新显示客户列表
        //List<Customer> customer1 = customerService.findAllCustomer();
        //model.addAttribute("customer", customer1);
        return "redirect:/findAllAdmin";
    }

    //【5】向更新客户信息页面跳转
    @RequestMapping("/toUpdateAdmin")                                 //设置访问路径
    public String toUpdateAdmin(int id, Model model) {             //Model model对象存储数据到视图页面显示
        Admin admin = adminService.findAdminById(id);     //调用service层方法
        model.addAttribute("admin", admin);
        return "/Admin_EditAdmin";
    }

    // 【5】更新客户
    @RequestMapping("/updateAdmin")                                   //设置访问路径
    public String updateAdmin(Admin admin, Model model) {    //Model model对象存储数据到视图页面显示
        String message;
        //执行Service层中的更新方法，返回的是受影响的行数
        int rows = adminService.updateAdmin(admin);          //调用service层方法
        if (rows > 0) {
            message = "用户" + admin.getId() + "信息更新成功！";
            return "redirect:/findAllAdmin";  //更新成功跳转到列表页面
        }
        //更新失败
        message = "用户" + admin.getId() + "信息更新失败！";
        //将更新结果信息保存
        model.addAttribute("message", message);
        return "/Admin_EditAdmin";
    }

}
