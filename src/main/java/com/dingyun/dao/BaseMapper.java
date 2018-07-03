package com.dingyun.dao;

import java.util.List;

public interface BaseMapper<E> {

    List<E> selectAll();
}
