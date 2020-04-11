package com.zj.domain;

import java.io.Serializable;

/**
 * ClassName:TypeInfo
 * Package:com.zj.domain
 * Description:
 *
 * @Date:2020/3/21 23:08
 * @Author:zijiu@1008611
 */
public class TypeInfo implements Serializable{
    private String id;
    private String name;
    private  String sort;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}
