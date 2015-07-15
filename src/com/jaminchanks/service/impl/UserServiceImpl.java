package com.jaminchanks.service.impl;

import com.jaminchanks.dao.UserDao;
import com.jaminchanks.pojo.User;
import com.jaminchanks.service.UserService;

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
        return userDao.addUser(user);
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

    @Override
    public User findUserByAccountNPassword(String account, String password) {
        return userDao.findUserByAccountNPassword(account, password);
    }

    @Override
    public User findUserById(int id) {
        return userDao.findUserById(id);
    }

    @Override
    public List<User> findUsersByUserName(String userName) {
        return userDao.findUsersByUserName(userName);
    }

    @Override
    public void banUser(User user) {
        user.setIsBaned(1);
        userDao.update(user);
    }

    @Override
    public void activeUser(User user) {
        user.setIsBaned(0);
        userDao.update(user);
    }

}
