package com.jaminchanks.action;

import com.jaminchanks.pojo.Comment;
import com.jaminchanks.pojo.Video;
import com.jaminchanks.service.VideoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by jamin on 6/16/15.
 */
public class VideoAction extends ActionSupport {
    private int userId;
    private int videoId;
    private Video video;
    private Video videoWatching;
    private Set<Comment> comments;
    private VideoService videoService;

    public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    public Video getVideoWatching() {
        return videoWatching;
    }

    public void setVideoWatching(Video videoWatching) {
        this.videoWatching = videoWatching;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getVideoId() {
        return videoId;
    }

    public void setVideoId(int videoId) {
        this.videoId = videoId;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public VideoService getVideoService() {
        return videoService;
    }

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }


    private void putInSession(String str, Object obj) {
        ActionContext actx = ActionContext.getContext();
        Map<String, Object> session = actx.getSession();
        session.put(str, obj);
    }

    //显示用户的所有上传视频
    public String showVideosByCatalog() {
        //找出所有user_id为id 的视频
        List<Video> videosOfIT = getVideoService().findVideoByCatalog4("IT");
        putInSession("videoOfIT", videosOfIT);

        List<Video> videosOfComic = getVideoService().findVideoByCatalog4("comic");
        putInSession("videoOfComic", videosOfComic);

        List<Video> videosOfFunny = getVideoService().findVideoByCatalog4("funny");
        putInSession("videoOfFunny", videosOfFunny);

        return SUCCESS;
    }

    //根据videoId 查询视频
    public String showVideoById() {
        Video video1 = getVideoService().findVideoById(videoId);
        videoWatching = video1;
        return SUCCESS;
    }
}
