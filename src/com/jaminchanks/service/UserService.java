package com.jaminchanks.service;

import com.jaminchanks.pojo.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/5/15.
 */
public interface UserService {
    Serializable addUser(User user);

    void deleteUser(int id);

    List<User> getAllUsers();

    List<User> findUser(String hql, String name, String pass);

    User findOne(String hql, int id);

    void updateUser(User user);

}
