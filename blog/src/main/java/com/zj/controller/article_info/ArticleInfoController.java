package com.zj.controller.article_info;

import com.github.pagehelper.PageHelper;
import com.zj.domain.ArticleInfo;
import com.zj.domain.ImageAdress;
import com.zj.domain.Result;
import com.zj.exception.MyException;
import com.zj.service.article_info.ArticleInfoServiceImpl;
import com.zj.service.type_info.TypeinfoServiceImpl;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.github.pagehelper.PageInfo;
/**
 * ClassName:ArticleInfoController
 * Package:com.zj.controller.article_info
 * Description:
 *
 * @Date:2020/3/25 22:16
 * @Author:zijiu@1008611
 */
@Controller
@RequestMapping("article_info")
public class ArticleInfoController {

    @Autowired
    private ArticleInfoServiceImpl articleInfoService;


    @Autowired
    public TypeinfoServiceImpl typeinfoService;


    /**
     * 查询所有文章(正常)
     * @return
     */
    @RequestMapping("listNormal.controller")
    public String listNormal(ModelMap map,Integer pageNumber){
        //分页
        if (pageNumber == null){
            pageNumber = 1;
        }
        PageHelper.startPage(pageNumber,10 ); //pageSize:9表示一页有9条数据
        List<ArticleInfo> list = articleInfoService.listNormal();
        PageInfo<ArticleInfo> pageInfo = new PageInfo<ArticleInfo>(list);
        map.put("pageInfo",pageInfo);
        return "admin/article_info/list_normal";
    }

    /**
     * 查询所有文章(已删除)
     * @return
     */
    @RequestMapping("listNormal_out.controller")
    public String listNormal_out(ModelMap map,Integer pageNumber){
        //分页
        if (pageNumber == null){
            pageNumber = 1;
        }
        PageHelper.startPage(pageNumber,10); //pageSize:10表示一页有10条数据
        List<ArticleInfo> list = articleInfoService.listNormal_out();
        PageInfo<ArticleInfo> pageInfo = new PageInfo<ArticleInfo>(list);
        map.put("pageInfo",pageInfo);
        return "admin/article_info/list_normal_del";
    }

    /**
     * 文章编辑
     * 1.新增文章
     * 2.更新文章
     * @return
     */
    @RequestMapping("edit.controller")
    public String edit(ModelMap map,
                       @RequestParam(required = false,value = "id")String id){
        //查询typeId,查typeId是因为，分类选择框
        map.put("typeList",typeinfoService.list());
        //如果有id,查询单个文章的信息,进行更新操作,跳转到edit页面
        if(!StringUtils.isEmpty(id)){
            ArticleInfo articleInfo = articleInfoService.selectById(id);
            map.put("articleInfo",articleInfo);
        }
        //如果没有id,则要进行新增操作,跳转到edit页面
        return "admin/article_info/edit";
    }

    /**
     * 文章删除
     * 状态码为1——>0
     * @return
     */
    @RequestMapping("del.controller")
    public String del(ModelMap map,Integer pageNumber){
        //分页
        if (pageNumber == null){
            pageNumber = 1;
        }
        PageHelper.startPage(pageNumber,10); //pageSize:10表示一页有10条数据
        List<ArticleInfo> list = articleInfoService.listNormal();
        PageInfo<ArticleInfo> pageInfo = new PageInfo<ArticleInfo>(list);
        map.put("pageInfo",pageInfo);
        return "admin/article_info/article_del";
    }


    @RequestMapping("del.json")
    @ResponseBody
    public Result deljson(
            @RequestParam(value = "idArr")String idArr[]) throws MyException {

        for (String s : idArr) {
            //如果sort或name为空则返回“添加字段不能为空”
            if(StringUtils.isEmpty(s)) {
                throw new MyException("请给我传值，谢谢!");
            }
        }
        articleInfoService.del(idArr);

        return Result.success();
    }

    /**
     * 文章恢复
     * 状态码为0——>1
     * @return
     */
    @RequestMapping("recover.controller")
    public String recover(ModelMap map,Integer pageNumber){
        //分页
        if (pageNumber == null){
            pageNumber = 1;
        }
        PageHelper.startPage(pageNumber,10); //pageSize:10表示一页有10条数据
        List<ArticleInfo> list = articleInfoService.listNormal_out();
        PageInfo<ArticleInfo> pageInfo = new PageInfo<ArticleInfo>(list);
        map.put("pageInfo",pageInfo);
        return "admin/article_info/list_normal_del_recover";
    }

    @RequestMapping("recover.json")
    @ResponseBody
    public Result recoverjson(
            @RequestParam(value = "idArr")String idArr[]) throws MyException {

        for (String s : idArr) {
            //如果sort或name为空则返回“添加字段不能为空”
            if(StringUtils.isEmpty(s)) {
                throw new MyException("请给我传值，谢谢!");
            }
        }
        articleInfoService.recover(idArr);

        return Result.success();
    }

    /**
     * bootstrap-fileinput上传图片到磁盘
     * @param
     * @return
     */
    @RequestMapping("upload.json")
    @ResponseBody
    public ImageAdress upload(MultipartFile file, HttpServletRequest request)throws IOException{
        //文件名称
        String szFileName = file.getOriginalFilename();
        //重命名后的文件名称
        String szNewFileName="";
        //根据日期自动创建三级目录
        String szDateFolder = "";

        //上传文件
        if(file!=null && szFileName!=null && szFileName.length()>0){
            Date date = new Date();
            szDateFolder = new SimpleDateFormat("yyyy/MM/dd").format(date);

            //存储文件物理路径
            String szDatePath = "D:/upload/"+szDateFolder;
            //自动创建文件夹
            File f = new File(szDatePath);
            if(!f.exists()){
                f.mkdirs();
            }
            //新的文件名
            szNewFileName =UUID.randomUUID()+szFileName.substring(szFileName.lastIndexOf("."));
            //新文件
            File newFile = new File(szDatePath+"/"+szNewFileName);
            //将内存中的数据写入磁盘
            file.transferTo(newFile);
        }
        System.out.println("进来上传文件了");
        String imgUrl ="/"+szDateFolder+"/"+szNewFileName;
        ImageAdress result = new ImageAdress();
        result.setAdress(imgUrl);
        return result;
    }
    @RequestMapping("editormdPic")
    @ResponseBody
    public JSONObject editormdPic (@RequestParam(value = "editormd-image-file", required = true) MultipartFile file, HttpServletRequest request,HttpServletResponse response) throws Exception{
        //文件名称
        String szFileName = file.getOriginalFilename();
        //重命名后的文件名称
        String szNewFileName="";
        //根据日期自动创建三级目录
        String szDateFolder = "";
        //上传文件
        if(file!=null && szFileName!=null && szFileName.length()>0){
            Date date = new Date();
            szDateFolder = new SimpleDateFormat("yyyy/MM/dd").format(date);
            //存储文件物理路径
            String szDatePath = "D:/upload/"+szDateFolder;
            //自动创建文件夹
            File f = new File(szDatePath);
            if(!f.exists()){
                f.mkdirs();
            }
            //新的文件名
            szNewFileName =UUID.randomUUID()+szFileName.substring(szFileName.lastIndexOf("."));
            //新文件
            File newFile = new File(szDatePath+"/"+szNewFileName);
            //将内存中的数据写入磁盘
            file.transferTo(newFile);
        }
        System.out.println("进来上传文件了");
        String imgUrl ="/"+szDateFolder+"/"+szNewFileName;

        JSONObject res = new JSONObject();
        res.put("url","http://3mf0744750.wicp.vip/upload"+imgUrl);
        res.put("success", 1);
        res.put("message", "upload success!");
        return res;

    }

    @RequestMapping("save")
    @ResponseBody
    public Result save(ArticleInfo articleInfo){
        articleInfoService.save(articleInfo);
        return Result.success();

    }


}