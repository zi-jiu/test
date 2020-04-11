package com.zj.service.type_info;

import com.zj.dao.type_info.TypeInfoDao;
import com.zj.domain.TypeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;

/**
 * ClassName:TypeinfoServiceImpl
 * Package:com.zj.service.type_info
 * Description:
 *
 * @Date:2020/3/22 11:15
 * @Author:zijiu@1008611
 */
@Service("typeinfoServiceImpl")
public class TypeinfoServiceImpl {

    @Autowired
    private TypeInfoDao typeInfoDao;

    /**
     * 查询所有文章分类
     *
     */
    public List<TypeInfo> list() {
        return typeInfoDao.list();
    }

    /**
     * 批量添加文章分类
     *
     */
    public void add(String[] idArr, String[] sortArr, String[] nameArr) {
        //遍历第一个数组
        for(int i=0;i<idArr.length;i++) {
            if (StringUtils.isEmpty(idArr[i])) {
                //插入
                typeInfoDao.insert(sortArr[i],nameArr[i]);
            } else {
                //更新
                typeInfoDao.update(idArr[i],sortArr[i],nameArr[i]);
            }

        }
    }

    public void del(String[] idArr){
        //遍历第一个数组
        for(int i=0;i<idArr.length;i++) {

                typeInfoDao.delete(idArr[i]);
        }

    }
}
