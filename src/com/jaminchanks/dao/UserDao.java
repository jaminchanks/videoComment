package com.jaminchanks.dao;

import com.jaminchanks.common.BaseDao;
import com.jaminchanks.pojo.User;

import java.util.List;

/**
 * Created by jamin on 6/5/15.
 */
public interface UserDao extends BaseDao<User> {
    int addUser(User user);
    User findUserByAccountNPassword(String account, String password);
    User findUserById(int id);
    //根据用户名模糊搜索用户
    List<User> findUsersByUserName(String userName);

}
