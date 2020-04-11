package com.zj.exception;

import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:GlobalException
 * Package:com.zj.exception
 * Description:
 *
 * @Date:2020/3/21 21:02
 * @Author:zijiu@1008611
 */
public class GlobalException implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception e) {
        //1.打印错误信息
        e.printStackTrace();
        //定义错误信息
        String message = "系统繁忙，请稍后重试";
        //2.判断请求类型
        if(e instanceof MyException){
            message = ((MyException)e).getMessage();
        }
        //2.1 json返回json
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        ResponseBody responseBody =
                handlerMethod.getMethod().getAnnotation(ResponseBody.class);
        if(responseBody!=null){
            //如果是json请求返回json数据
            Map<String,Object> responseMap = new HashMap<String, Object>();
            responseMap.put("code","0");
            responseMap.put("message",message);
            //把错误信息转为json
            String json = new Gson().toJson(responseMap);
            response.setCharacterEncoding("utf-8");
            response.setContentType("application/json;charset=utf-8");
            try{
                response.getWriter().write(json);
                response.getWriter().flush();
            }catch (IOException e1){
                e1.printStackTrace();
            }
            //返回一个空的ModelAndView
            //业务处理器调用模型层处理完用户请求后，把结果数据存储在该类的model属性中，
            // 把要返回的视图信息存储在该类的view属性中，然后让该ModelAndView返回该Spring MVC框架。
            // 框架通过调用配置文件中定义的视图解析器，对该对象进行解析，最后把结果数据显示在指定的页面上
            // 这里他的作用类似于request对象的setAttribute方法的作用，用来在一个请求过程中传递处理的数据。
            return new ModelAndView();
        }

        //2.2 跳转页面返回跳转页面
        ModelAndView mv = new ModelAndView();
        mv.addObject("message",message);
        mv.setViewName("error");
        return mv;
    }

}

