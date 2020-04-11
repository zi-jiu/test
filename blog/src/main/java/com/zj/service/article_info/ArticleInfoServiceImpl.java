package com.zj.service.article_info;

import com.zj.dao.article_info.ArticleInfoDao;
import com.zj.domain.ArticleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SimpleTimeZone;

/**
 * ClassName:ArticleInfoServiceImpl
 * Package:com.zj.service.article_info
 * Description:
 *
 * @Date:2020/3/25 22:08
 * @Author:zijiu@1008611
 */
@Service("articleInfoServiceImpl")
public class ArticleInfoServiceImpl {

    @Autowired
    private ArticleInfoDao articleInfoDao;

    /**
     * 查询所有文章(正常)
     *
     */
    public List<ArticleInfo> listNormal() {
        return articleInfoDao.listNormal();
    }

    /**
     * 根据id查询文章
     * @param id
     * @return
     */
    public ArticleInfo selectById(String id) {
        return articleInfoDao.selectById(id);
    }

    /**
     * 保存文章
     * @param articleInfo
     */

    public void save(ArticleInfo articleInfo) {
        Date now = new Date();
        articleInfo.setUpdateTime(now); //更新时间

        articleInfo.setStatus(1); //博客状态1：正常，0：回收站
        articleInfo.setViewCount(100);  //阅读量
        if(StringUtils.isEmpty(articleInfo.getId())){
            //新增
            articleInfoDao.insert(articleInfo);
        }else{
            //更新
            articleInfoDao.update(articleInfo);
        }
    }

    public void del(String[] idArr){
        //遍历第一个数组
        for(int i=0;i<idArr.length;i++) {

            articleInfoDao.delete(idArr[i]);
        }

    }

    public List<ArticleInfo> listNormal_out() {
        return articleInfoDao.listNormal_out();
    }

    public void recover(String[] idArr) {
        //遍历第一个数组
        for(int i=0;i<idArr.length;i++) {

            articleInfoDao.recover(idArr[i]);
        }
    }

    public void updateViewCount(String id) {
        articleInfoDao.updateViewCount(id);
    }
}
