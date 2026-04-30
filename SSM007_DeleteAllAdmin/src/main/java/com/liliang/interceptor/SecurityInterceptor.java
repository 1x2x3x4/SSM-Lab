package com.liliang.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class SecurityInterceptor implements HandlerInterceptor {

    //【2】用户登录拦截器
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("SecurityInterceptor...preHandle...");
        System.out.println(request.getRequestURI());
        request.getContextPath();
        if (request.getRequestURI().contains("toRegister") ||
                request.getRequestURI().contains("register") ||
                request.getRequestURI().contains("toLogin") ||
                request.getRequestURI().contains("login") ||
                //request.getRequestURI().contains("toIndex") ||
                //request.getRequestURI().contains("index") ||
                request.getRequestURI().contains("admin01")){
            return true;
        }
        //这里可以根据session的用户来判断角色的权限，根据权限来转发不同的页面
        if (request.getSession().getAttribute("userId") != null) {
            return true;
        }
        request.getRequestDispatcher("/toLogin").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
    }
}