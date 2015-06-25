package com.jaminchanks.dao.impl;

import com.jaminchanks.common.impl.BaseDaoHibernate4Impl;
import com.jaminchanks.dao.CommentDao;
import com.jaminchanks.pojo.Comment;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public class CommentDaoImpl extends BaseDaoHibernate4Impl<Comment> implements CommentDao {

    //重写部分
    @Override
    public Serializable addComment(Comment comment) {
        comment.setIsBaned(0);
        return save(comment);
    }

    @Override
    public void delete(Comment comment){
        comment.setIsBaned(1);
        update(comment);
    }

    @Override
    public List<Comment> findCommentsByVideo(int videoId, int pageNo, int pageSize){
        String hql = "from Comment where videoId=? order by commentId desc";
        return findByPage(hql, pageNo, pageSize, videoId);
    }

    @Override
    public int getPagesOfCommentsByVideo(int videoId, int pageSize) {
        String hql = "from Comment where videoId=?";
        ArrayList<Comment> comments = (ArrayList<Comment>) find(hql, videoId);
        int maxPageSize = comments.size()/pageSize;
        return comments.size()%pageSize==0 ? maxPageSize : maxPageSize + 1;
    }

    @Override
    public Comment findCommentById(int id) {
        String hql = "from Comment where commentId=?";
        ArrayList<Comment> comments = (ArrayList<Comment>) find(hql, id);
        if (comments != null && comments.size()!=0) {
            return comments.get(0);
        }
        else return null;
    }
}
