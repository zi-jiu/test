package com.zj.interceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/**
 * ClassName:Interceptor
 * Package:com.zj.interceptor
 * Description:
 *
 * @Date:2020/3/21 8:23
 * @Author:zijiu@1008611
 */
public class Interceptor implements HandlerInterceptor {
    /**
     * 配置拦截器，拦截未登录用户
     */
    @Override
    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
            throws Exception {
        //执行完毕，返回前拦截
    }

    @Override
    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
            throws Exception {
        //处理过程中执行拦截
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
        HttpSession session = request.getSession();
        Object userInfo = session.getAttribute("userInfo");

        if (userInfo == null) {
            //登录失败，跳转到登录页
            // WEB-INF/page/admin/login.jsp
            // D:\Maven\springssm\blog\src\main\webapp\WEB-INF\page\admin\login.jsp
            // login.jsp
            System.out.println("被拦截登录失败");
            response.sendRedirect(request.getContextPath()+"/admin/login.controller");
            return false;
        } else {
            //登陆成功，不拦截
            System.out.println("登录成功");
            return true;
        }
    }

}

