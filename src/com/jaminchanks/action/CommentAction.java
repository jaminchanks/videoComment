package com.jaminchanks.action;

import com.jaminchanks.pojo.Comment;
import com.jaminchanks.pojo.User;
import com.jaminchanks.service.CommentService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by jamin on 6/20/15.
 */
public class CommentAction extends ActionSupport {
    private CommentService commentService;
    private Comment comment;
    private ArrayList<Comment> commentsWatching;
    private int commentId;
    private static int videoId;
    private String content;
    //分页变量
    private int pageNo = 1;
    private final int pageSize = 5; //一页默认显示10条记录
    private int maxPageSize;

    public int getMaxPageSize() {
        return maxPageSize;
    }

    public void setMaxPageSize(int maxPageSize) {
        this.maxPageSize = maxPageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }



    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public ArrayList<Comment> getCommentsWatching() {
        return commentsWatching;
    }

    public void setCommentsWatching(ArrayList<Comment> commentsWatching) {
        this.commentsWatching = commentsWatching;
    }

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public CommentService getCommentService() {
        return commentService;
    }

    public void setCommentService(CommentService commentService) {
        this.commentService = commentService;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    //分页查询评论
    public String showComments() {
        List<Comment> comments = getCommentService().findCommentsByVideo(videoId, pageNo, pageSize);
        if (comments != null && comments.size() != 0) {
            commentsWatching = (ArrayList<Comment>) comments;
            System.out.println("userName[0]==" + commentsWatching.get(0).getUser().getUserName());
            //告知最后一页是多少
            maxPageSize = getCommentService().getPagesOfCommentsByVideo(videoId, pageSize);
            return SUCCESS;
        } else {
            return ERROR;
        }
    }


    public String addComment(){
        //需要内容，用户id,视频id
        Comment comment1 = new Comment();
        comment1.setVideoId(videoId);

        comment1.setCommentTime(new Timestamp(System.currentTimeMillis()));
        //获取正在登陆的用户
        User user1= (User)ActionContext.getContext().getSession().get("logonUser");
        if (user1 == null) {
            return LOGIN;
        }
        comment1.setUser(user1);
        comment1.setContent(content);
        System.out.println("userId&& content" + user1.getId() + "//" + videoId + "//" + comment1.getContent());
        getCommentService().addComment(comment1);
        return SUCCESS;
    }

    //删除评论,将其内容设置为“评论已被删除”
    public String deleteComment(){
        Comment comment1 = getCommentService().findCommentById(commentId);
        getCommentService().deleteComment(comment1);
        return SUCCESS;
    }
}
