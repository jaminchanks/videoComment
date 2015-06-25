package com.jaminchanks.dao;

import com.jaminchanks.common.BaseDao;
import com.jaminchanks.pojo.Comment;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public interface CommentDao extends BaseDao<Comment> {
    Serializable addComment(Comment comment);
    List<Comment> findCommentsByVideo(int videoId, int pageNo, int pageSize);
    int getPagesOfCommentsByVideo(int videoId, int pageSize);
    Comment findCommentById(int id);
}
