package com.zj.controller.user_info;



import com.zj.domain.Result;
import com.zj.domain.UserInfo;
import com.zj.exception.MyException;
import com.zj.service.user_info.UserInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * ClassName:UserInfoController
 * Package:com.zj.controller
 * Description:
 *
 * @Date:2020/3/18 19:43
 * @Author:zijiu@1008611
 */
@Controller
@RequestMapping("admin")
public class UserInfoController {

    @Autowired
    private UserInfoServiceImpl userInfoServiceImpl;

    @RequestMapping("index.controller")
    public String index(){
        return "admin/index";
    }

    @RequestMapping("login.controller")
    public String login(){
        return "admin/login";
    }


    @RequestMapping("login_json.controller")
    @ResponseBody
    public Result login_json(ModelMap map, HttpServletRequest request) throws MyException{
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        //如果用户名或密码为空，返回用户名或密码不能为空
        if(StringUtils.isEmpty(name) || StringUtils.isEmpty(password)){
            throw new MyException("用户名或密码不能为空");
        }

        //如果用户名或密码不正确，返回用户名或密码不正确
        UserInfo userInfo = userInfoServiceImpl.selectUser(name, password);
        if(userInfo==null){
            System.out.println("用户名或密码不正确");
            throw new MyException("用户名或密码不正确");
        }

        //设置session
        request.getSession().setAttribute("userInfo",userInfo);

        return Result.success();
    }

    @RequestMapping("login_out.controller")
    public String login_out (HttpSession session){
        //销毁session
        session.invalidate();
        return "admin/login";

    }



}
