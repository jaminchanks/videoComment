package com.jaminchanks.action;

import com.jaminchanks.pojo.User;
import com.jaminchanks.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;

import javax.swing.*;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by jamin on 6/5/15.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private User user;
    //根据id查找用户
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String login() {
        //登陆成功！ 找到用户
        user = getUserService().findUserByAccountNPassword(
                user.getAccount(), user.getPassword());
        if(user != null){
            putInSession("logonUser", user);
            return SUCCESS;
        } else {
            addActionMessage("密码或用户名错误！");
            return INPUT;
        }
    }

    public String register() {
        int result = userService.addUser(getUser());
        System.out.println(result);
        if (result >= 0) {
            addActionMessage("注册成功！请登陆...");
            return SUCCESS;
        }
        else {
            addActionMessage("账号已存在！");
            return "register";
        }
    }

    //从页面传过来的参数为用户的id,传出去的参数为request范围的user
    public String showUserDetail() {
        //登陆成功！ 找到用户
        user = getUserService().findUserById(id);
        if(user != null){
            return SUCCESS;
        } else {
            return ERROR;
        }
    }


    //注销
    public String logOut() {
        ActionContext actx = ActionContext.getContext();
        actx.getSession().clear();
        return SUCCESS;
    }

    //封号处理
    public String banUser() {
        return SUCCESS;
    }

    //激活账号处理
    public String activeUser() {
        return SUCCESS;
    }


    //修改用户信息
    public String updateUser(){
        getUserService().updateUser(user);
        ActionContext actx = ActionContext.getContext();
        actx.getSession().remove("logonUser");
        putInSession("logonUser", user);
        return SUCCESS;
    }

    //
    private void putInSession(String str, Object obj) {
        ActionContext actx = ActionContext.getContext();
        actx.getSession().put(str, obj);
    }
}
