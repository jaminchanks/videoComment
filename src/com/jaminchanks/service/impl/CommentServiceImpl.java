package com.jaminchanks.service.impl;

import com.jaminchanks.dao.CommentDao;
import com.jaminchanks.pojo.Comment;
import com.jaminchanks.service.CommentService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public class CommentServiceImpl implements CommentService {
    private CommentDao commentDao;

    public CommentDao getCommentDao() {
        return commentDao;
    }

    public void setCommentDao(CommentDao commentsDao) {
        this.commentDao = commentsDao;
    }

    @Override
    public int addComment(Comment comment) {
        return (Integer)commentDao.addComment(comment);
    }

    @Override
    public void deleteComment(Comment comment) {
        commentDao.delete(comment);
    }



    @Override
    public List<Comment> findCommentsByVideo(int videoId, int pageNo, int pageSize){
        return commentDao.findCommentsByVideo(videoId, pageNo, pageSize);
    }

    @Override
    public int getPagesOfCommentsByVideo(int videoId, int pageSize) {
        return commentDao.getPagesOfCommentsByVideo(videoId, pageSize);
    }

    @Override
    public Comment findCommentById(int id) {
        return commentDao.findCommentById(id);
    }
}
