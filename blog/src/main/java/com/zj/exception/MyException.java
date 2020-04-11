package com.zj.exception;

/**
 * ClassName:MyException
 * Package:com.zj.exception
 * Description:自定义异常类,预期的异常
 *
 * @Date:2020/3/21 20:56
 * @Author:zijiu@1008611
 */
public class MyException extends Exception {

    private String message;

    public MyException(String message) {
        super(message);
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
