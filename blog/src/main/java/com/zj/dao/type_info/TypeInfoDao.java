package com.zj.dao.type_info;

import com.zj.domain.TypeInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ClassName:TypeInfo
 * Package:com.zj.dao.type_info
 * Description:
 *
 * @Date:2020/3/21 23:14
 * @Author:zijiu@1008611
 */
public interface TypeInfoDao {

    //查询所有文章分类
    List<TypeInfo> list();

    //插入一条新的文章分类
    int insert(@Param("sort") String sort,@Param("name") String name);

    //更新一条文章分类
    int update(@Param("id") String id,@Param("sort") String sort,@Param("name") String name);

    void delete(@Param("id") String id);
}
