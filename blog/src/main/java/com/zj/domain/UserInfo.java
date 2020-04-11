package com.zj.domain;

import java.io.Serializable;

/**
 * ClassName:UserInfo
 * Package:com.zj.domain
 * Description:
 *
 * @Date:2020/3/18 21:55
 * @Author:zijiu@1008611
 */
public class UserInfo implements Serializable {
    private Integer id;
    private String login_name;
    private String pass_word;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLogin_name() {
        return login_name;
    }

    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    public String getPass_word() {
        return pass_word;
    }

    public void setPass_word(String pass_word) {
        this.pass_word = pass_word;
    }

    @Override
    public String toString() {
        return "userInfo{" +
                "id=" + id +
                ", login_name='" + login_name + '\'' +
                ", pass_word='" + pass_word + '\'' +
                '}';
    }
}
