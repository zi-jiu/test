package com.zj.service.user_info;

import com.zj.dao.user_info.UserInfoDao;
import com.zj.domain.UserInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * ClassName:UserInfoServiceImpl
 * Package:com.zj.service.user_info
 * Description:
 *
 * @Date:2020/3/18 19:46
 * @Author:zijiu@1008611
 */
@Service("userInfoServiceImpl")
public class UserInfoServiceImpl {

    @Autowired
    private UserInfoDao userInfoDao;

    public  UserInfo selectUser(String login_name, String pass_word){
        return userInfoDao.selectUser(login_name,pass_word);
    }
}
