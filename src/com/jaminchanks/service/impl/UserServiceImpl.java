package com.jaminchanks.service.impl;

import com.jaminchanks.dao.UserDao;
import com.jaminchanks.pojo.User;
import com.jaminchanks.service.UserService;

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
    public Serializable addUser(User user){
        return userDao.save(user);
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
    public List<User> findUser(String hql, String name, String pass) {
        return userDao.find(hql, name, pass);
    }

    @Override
    public User findOne(String hql, int id) {
        return userDao.find(hql, id).get(0);
    }

    @Override
    public void updateUser(User user) {
        userDao.update(user);
    }
}
