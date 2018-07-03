package com.dingyun.service;


import java.util.List;

public interface BaseService<E> {

    int deleteByPrimaryKey(Integer ObjectId);

    int insert(E record);

    int insertSelective(E record);

    E selectByPrimaryKey(Integer ObjectId);

    int updateByPrimaryKeySelective(E record);

    int updateByPrimaryKey(E record);

    List<E> selectAll();

    //    实现表的模糊查询
    List<E> selectSome(E e);


    //    实现表的批量删除
    Integer deleteMore(Integer[] ids);

}
