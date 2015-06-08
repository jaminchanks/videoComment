package com.jaminchanks.common;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/7/15.
 */
public interface BaseDao<T>  {
    // 根据ID加载实体
    T get(Class<T> entityClazz, Serializable id);
    // 保存实体
    Serializable save(T entity);
    // 更新实体
    void update(T entity);
    // 删除实体
    void delete(T entity);
    // 根据ID删除实体
    void delete(Class<T> entityClazz, Serializable id);
    // 获取所有实体
    List<T> findAll(Class<T> entityClazz);
    //根据hql语句获取单个个体
    List<T> find(String hql, Object... params);
    // 获取实体总数
    long findCount(Class<T> entityClazz);

}
