package com.zj.controller.portal_info;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zj.domain.ArticleInfo;
import com.zj.service.article_info.ArticleInfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * ClassName:PortalController
 * Package:com.zj.controller.portal_info
 * Description:
 *
 * @Date:2020/4/3 12:13
 * @Author:zijiu@1008611
 */
@Controller
@RequestMapping("portal")
public class PortalController {

    @Autowired
    private ArticleInfoServiceImpl articleInfoService;

    /**
     * 查询所有文章(正常)
     * @return
     */
    @RequestMapping("index.controller")
    public String index(ModelMap map, Integer pageNumber){
        //分页
        if (pageNumber == null){
            pageNumber = 1;
        }
        PageHelper.startPage(pageNumber,6); //pageSize:10表示一页有10条数据
        List<ArticleInfo> list = articleInfoService.listNormal();
        PageInfo<ArticleInfo> pageInfo = new PageInfo<ArticleInfo>(list);
        map.put("pageInfo",pageInfo);
        return "portal/index";
    }

    /**
     * 根据id查文章
     */
    @RequestMapping("art.controller")
    public String edit(ModelMap map,
                       @RequestParam(required = false,value = "id")String id){
        //如果有id,查询单个文章的信息
        if(!StringUtils.isEmpty(id)){
            //先更新文章的阅读量
            articleInfoService.updateViewCount(id);
            ArticleInfo articleInfo = articleInfoService.selectById(id);
            if(articleInfo==null){
                return "404";
            }
            map.put("articleInfo",articleInfo);
        }
        return "portal/art";
    }

    /**
     * 关于我界面
     */
    @RequestMapping("me")
    public String me(){
        return "portal/me";
    }

}
