package com.zj.controller.type_info;

import com.zj.domain.Result;
import com.zj.domain.TypeInfo;
import com.zj.domain.UserInfo;
import com.zj.exception.MyException;
import com.zj.service.type_info.TypeinfoServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * ClassName:TypeInfoController
 * Package:com.zj.controller.type_info
 * Description:
 *
 * @Date:2020/3/22 11:12
 * @Author:zijiu@1008611
 */
@Controller
@RequestMapping("type_info")
public class TypeInfoController {

    @Autowired
    public TypeinfoServiceImpl typeinfoService;

    /**
     * 查询所有文章分类
     * @return
     */
    @RequestMapping("list.controller")
    public String list(ModelMap map){
        List<TypeInfo> list = typeinfoService.list();
        map.put("list",list);
        return "admin/type_info/list";
    }

    @RequestMapping("list_add0.controller")
    public String list_add0(ModelMap map){
        List<TypeInfo> list = typeinfoService.list();
        map.put("list",list);
        return "admin/type_info/list_add";
    }

    @RequestMapping("list_add.json")
    @ResponseBody
    public Result list_add(
            @RequestParam(value = "idArr")String idArr[],
            @RequestParam(value = "sortArr")String sortArr[],
            @RequestParam(value = "nameArr")String nameArr[]) throws MyException {

        for (String s : sortArr) {
            //如果sort或name为空则返回“添加字段不能为空”
            if(StringUtils.isEmpty(s)) {
                throw new MyException("添加字段不能为空");
            }
        }
        for (String s : nameArr) {
            //如果sort或name为空则返回“添加字段不能为空”
            if(StringUtils.isEmpty(s)){
                throw new MyException("添加字段不能为空");
            }
        }
        typeinfoService.add(idArr,sortArr,nameArr);

        return Result.success();
    }

    @RequestMapping("list_del.controller")
    public String list_del0(ModelMap map){
        List<TypeInfo> list = typeinfoService.list();
        map.put("list",list);
        return "admin/type_info/list_del";
    }

    @RequestMapping("list_del.json")
    @ResponseBody
    public Result list_del(
            @RequestParam(value = "idArr")String idArr[]) throws MyException {

        for (String s : idArr) {
            //如果sort或name为空则返回“添加字段不能为空”
            if(StringUtils.isEmpty(s)) {
                throw new MyException("请给我传值，谢谢!");
            }
        }
        typeinfoService.del(idArr);

        return Result.success();
    }

}
