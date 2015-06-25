package com.jaminchanks.pojo;

import java.sql.Timestamp;

/**
 * Created by jamin on 6/22/15.
 */
public class Comment {
    private int commentId;
    private String content;
    private Integer commentTo;
    private Timestamp commentTime;
    private int videoId;
    private int isBaned;
    private User user;

    public int getIsBaned() {
        return isBaned;
    }

    public void setIsBaned(int isBaned) {
        this.isBaned = isBaned;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getCommentTo() {
        return commentTo;
    }

    public void setCommentTo(Integer commentTo) {
        this.commentTo = commentTo;
    }

    public Timestamp getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Timestamp commentTime) {
        this.commentTime = commentTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Comment comment = (Comment) o;

        if (commentId != comment.commentId) return false;
        if (content != null ? !content.equals(comment.content) : comment.content != null) return false;
        if (commentTo != null ? !commentTo.equals(comment.commentTo) : comment.commentTo != null) return false;
        if (commentTime != null ? !commentTime.equals(comment.commentTime) : comment.commentTime != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = commentId;
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (commentTo != null ? commentTo.hashCode() : 0);
        result = 31 * result + (commentTime != null ? commentTime.hashCode() : 0);
        return result;
    }
}
