package com.zj.domain;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:Result
 * Package:com.zj.domain
 * Description:
 *
 * @Date:2020/3/20 18:08
 * @Author:zijiu@1008611
 */
public class Result implements Serializable {
    //状态码，成功“1”失败“0”
    private String code;
    //错误信息
    private String message;

    //返回值，链式存储
    private Map<String,Object> data = new HashMap<String,Object>();

    public static Result success(){
        Result result = new Result();
        result.setCode("1");
        result.setMessage("操作成功");
        return result;
    }

    public static Result error(String str) {
        Result result = new Result();
        result.setCode("0");
        result.setMessage(str);
        return result;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

}
