package com.zj.dao.user_info;

import com.zj.domain.UserInfo;
import org.apache.ibatis.annotations.Param;

/**
 * ClassName:UserInfoDao
 * Package:com.zj.dao.user_info
 * Description:
 *
 * @Date:2020/3/18 21:51
 * @Author:zijiu@1008611
 */
public interface UserInfoDao {


    UserInfo selectUser(@Param("name") String login_name, @Param("password") String pass_word);
}
