package com.jaminchanks.action;

import com.jaminchanks.pojo.User;
import com.jaminchanks.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by jamin on 6/5/15.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private User user;

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
        System.out.println(user.getAccount() + ".." + user.getPassword());
        System.out.println("userService==" + getUserService());
        if (getUserService().findUser("from User where account=? and password=?",
                user.getAccount(), user.getPassword()) != null) {
            return SUCCESS;
        } else {
            return INPUT;
        }
    }

}
