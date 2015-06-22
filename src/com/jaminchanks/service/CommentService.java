package com.jaminchanks.service;

import com.jaminchanks.pojo.Comment;

import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public interface CommentService {
    //增
    int addComment(Comment comment);

    //查
    List<Comment> findCommentsByVideo(int videoId, int pageNo, int pageSize);

    //显示页数
    int getPagesOfCommentsByVideo(int videoId, int pageSize);

    //删
    void deleteComment(Comment comment);

}
