package com.jaminchanks.service;

import com.jaminchanks.pojo.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/5/15.
 */
public interface UserService {
    //增
    int addUser(User user);

    //删
    void deleteUser(int id);

    //查找所有
    List<User> getAllUsers();

    //根据账户和密码查询用户
    User findUserByAccountNPassword(String account, String password);

    //根据id查询用户
    User findUserById(int id);

    //根据hql语句查询用户
    List<User> findUsers(String hql, Object... params);

    //改
    void updateUser(User user);

}
