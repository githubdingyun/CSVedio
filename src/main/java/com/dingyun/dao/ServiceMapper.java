package com.dingyun.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author DinGYun
 * @param <E>
 *     实现表的模糊查询，
 *     实现表的批量删除
 *     实现数据回显需要实现按  用户id查询
 */
public interface ServiceMapper<E> {

//    实现表的模糊查询
List<E> selectSome(E e);


//    实现表的批量删除
    Integer deleteMore(@Param("ids")Integer[] ids);



//    实现数据回显需要实现按  用户id查询

}
