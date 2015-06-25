package com.jaminchanks.pojo;

import java.sql.Date;

/**
 * Created by jamin on 6/16/15.
 */
public class Video {
    private int videoId;
    private Date upTime;
    private int likeNumbers;
    private String videoSrc;
    private String videoWrap;
    private String catalog;
    private String videoName;
    private User user;
    private int watchNumbers;

    public int getWatchNumbers() {
        return watchNumbers;
    }

    public void setWatchNumbers(int watchNumbers) {
        this.watchNumbers = watchNumbers;
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

    public Date getUpTime() {
        return upTime;
    }

    public void setUpTime(Date upTime) {
        this.upTime = upTime;
    }

    public int getLikeNumbers() {
        return likeNumbers;
    }

    public void setLikeNumbers(int likeNumbers) {
        this.likeNumbers = likeNumbers;
    }


    public String getVideoSrc() {
        return videoSrc;
    }

    public void setVideoSrc(String videoSrc) {
        this.videoSrc = videoSrc;
    }

    public String getVideoWrap() {
        return videoWrap;
    }

    public void setVideoWrap(String videoWrap) {
        this.videoWrap = videoWrap;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Video video = (Video) o;

        if (videoId != video.videoId) return false;
        if (likeNumbers != video.likeNumbers) return false;
        if (upTime != null ? !upTime.equals(video.upTime) : video.upTime != null) return false;
        if (videoSrc != null ? !videoSrc.equals(video.videoSrc) : video.videoSrc != null) return false;
        if (videoWrap != null ? !videoWrap.equals(video.videoWrap) : video.videoWrap != null) return false;
        if (catalog != null ? !catalog.equals(video.catalog) : video.catalog != null) return false;
        if (videoName != null ? !videoName.equals(video.videoName) : video.videoName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId;
        result = 31 * result + (upTime != null ? upTime.hashCode() : 0);
        result = 31 * result + likeNumbers;
        result = 31 * result + (videoSrc != null ? videoSrc.hashCode() : 0);
        result = 31 * result + (videoWrap != null ? videoWrap.hashCode() : 0);
        result = 31 * result + (catalog != null ? catalog.hashCode() : 0);
        result = 31 * result + (videoName != null ? videoName.hashCode() : 0);
        return result;
    }
}
