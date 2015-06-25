package com.jaminchanks.dao.impl;

import com.jaminchanks.common.impl.BaseDaoHibernate4Impl;
import com.jaminchanks.dao.UserDao;
import com.jaminchanks.pojo.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/5/15.
 */
public class UserDaoImpl extends BaseDaoHibernate4Impl<User> implements UserDao {
    @Override
    public int addUser(User user){
        //user的默认权限和头像在这里设置
        user.setIdentity(0);
        user.setHead("head.jpg");
        //查询有无相同的账户名
        List<User> userList = find("from User where account=?", user.getAccount());
        if (userList != null && userList.size() != 0) {
            return -1;
        }
        else{
            return (Integer)save(user); //这里总是返回0，不知道为什么
        }

    }

    @Override
    public User findUserByAccountNPassword(String account, String password) {
        String hql = "from User where account=? and password=?";
        List<User> users = find(hql, account, password);
        if (users != null && users.size() != 0) {
            return users.get(0);
        } else
            return null;
    }

    @Override
    public User findUserById(int id) {
        String hql ="from User where id=?";
        List<User> users = find(hql, id);
        if (users != null && users.size() != 0) {
            return users.get(0);
        } else
            return null;
    }
}
