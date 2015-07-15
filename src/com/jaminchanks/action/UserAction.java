package com.jaminchanks.action;

import com.jaminchanks.pojo.User;
import com.jaminchanks.pojo.Video;
import com.jaminchanks.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.swing.*;
import java.io.*;
import java.util.*;

/**
 * Created by jamin on 6/5/15.
 */
public class UserAction extends ActionSupport {
    private UserService userService;
    private User user;
    //根据id查找用户
    private int id;
    //根据用户名查询
    private String whatToSearch;
    private ArrayList<User> users;

    //头像相关
    private File file;// 对应文件域的file，封装文件内容
    private String fileContentType;// 封装文件类型
    private String fileFileName;// 封装文件名
    private String savePath;// 保存路径

    //验证码
    private String verifyCode;
    private String savedFileName; //保存文件的真实名

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public String getRealSavePath() {
        return ServletActionContext.getServletContext().getRealPath(savePath);
    }

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


    public ArrayList<User> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<User> users) {
        this.users = users;
    }

    public String getWhatToSearch() {
        return whatToSearch;
    }

    public void setWhatToSearch(String whatToSearch) {
        this.whatToSearch = whatToSearch;
    }


    public String login() {
        System.out.println("you input verifyCode:" + verifyCode);

        //检查校验码
        if ( ! ActionContext.getContext().getSession().get("securityCode").equals(verifyCode)) {
            addActionMessage("验证码错误！");
            return INPUT;
        }
        //登陆成功！ 找到用户
        user = getUserService().findUserByAccountNPassword(
                user.getAccount(), user.getPassword());

        if (user != null) {
            //如果被封号
            if (user.getIsBaned() == 1) {
                addActionMessage("账号当前无法登陆！");
                return INPUT;
            } else {
                putInSession("logonUser", user);
                return SUCCESS;
            }
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
        user = getUserService().findUserById(id);
        getUserService().banUser(user);
        return SUCCESS;
    }

    //激活账号处理
    public String activeUser() {
        user = getUserService().findUserById(id);
        getUserService().activeUser(user);
        return SUCCESS;
    }


    //修改用户信息
    public String updateUser() throws IOException {
        try {
            uploadFile();
        } catch (Exception ex) {
            user.setHead(user.getHead()); //出错就不修改头像
        }
        //如果选择了修改头像
        if (file != null)
            user.setHead(savedFileName);
        getUserService().updateUser(user);
        ActionContext actx = ActionContext.getContext();
        actx.getSession().remove("logonUser");
        putInSession("logonUser", user);
        return SUCCESS;
    }


    private void uploadFile() throws IOException {
        if (file != null) {
            System.out.println(getFileContentType());
            // 读取文件内容到InputStream里

            // 以服务器的文件保存地址和原文件名建立上传文件输出流, 并将上传到的文件重命名命名方式id+account.xxx
            savedFileName = user.getId() + user.getAccount() +
                    fileFileName.substring(fileFileName.lastIndexOf("."));
            FileOutputStream fos = new FileOutputStream(getRealSavePath() + "/" + savedFileName);
            System.out.println(getRealSavePath() + "/" + savedFileName);
            FileInputStream fis = new FileInputStream(file);
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = fis.read(buffer)) > 0) {
                fos.write(buffer, 0, len);
            }
            //关闭输入输出流
            fis.close();
            fos.close();
        }
    }

    //根据用户名字查询相关用户
    public String showSearchResultOfUserName(){
        users = (ArrayList<User>) getUserService().findUsersByUserName(whatToSearch);
        return SUCCESS;
    }


    //
    private void putInSession(String str, Object obj) {
        ActionContext actx = ActionContext.getContext();
        actx.getSession().put(str, obj);
    }
}
