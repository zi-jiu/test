package com.zj.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * ClassName:ArticleInfo
 * Package:com.zj.domain
 * Description:
 *
 * @Date:2020/3/25 21:28
 * @Author:zijiu@1008611
 */
public class ArticleInfo implements Serializable {
    private String id;
    private String title;
    private String content;
    private String contentText; //文章的简介
    private String cover;        //文章的封面
    private int viewCount;   //浏览次数
    private Date updateTime;    //更新时间
    private int status;          //文章的状态(1.正常 2.回收站)
    private String typeId;      //文章的分类id

    private String name; //文章分类的名字

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContentText() {
        return contentText;
    }

    public void setContentText(String contentText) {
        this.contentText = contentText;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
