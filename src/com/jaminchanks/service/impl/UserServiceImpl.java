package com.jaminchanks.service.impl;

import com.jaminchanks.dao.UserDao;
import com.jaminchanks.pojo.User;
import com.jaminchanks.service.UserService;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/5/15.
 */

public class UserServiceImpl implements UserService {
    private UserDao userDao;

    public UserDao getUserDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }


    @Override
    public int addUser(User user){
        //user的默认权限和头像在这里设置
        user.setIdentity(0);
        user.setHead("head.jpg");
        //查询有无相同的账户名
        List<User> userList = userDao.find("from User where account=?", user.getAccount());
        if (userList != null && userList.size() != 0) {
            return -1;
        }
        else{
            return (Integer)userDao.save(user); //这里总是返回0，不知道为什么
        }

    }

    @Override
    public void deleteUser(int id) {
         userDao.delete(User.class, id);
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.findAll(User.class);
    }

    @Override
    public List<User> findUsers(String hql, Object... params) {
        return userDao.find(hql, params);
    }

    @Override
    public void updateUser(User user) {
        userDao.update(user);
    }
}
