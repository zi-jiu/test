package com.zj.dao.article_info;

import com.zj.domain.ArticleInfo;

import java.util.List;

/**
 * ClassName:TypeInfo
 * Package:com.zj.dao.type_info
 * Description:
 *
 * @Date:2020/3/21 23:14
 * @Author:zijiu@1008611
 */
public interface ArticleInfoDao {

    //查询所有文章分类
    List<ArticleInfo> listNormal();


    ArticleInfo selectById(String id);

    void insert(ArticleInfo articleInfo);

    void update(ArticleInfo articleInfo);

    void delete(String s);

    List<ArticleInfo> listNormal_out();

    void recover(String s);

    void updateViewCount(String id);
}
