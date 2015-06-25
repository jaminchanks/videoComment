package com.jaminchanks.action;

import com.jaminchanks.pojo.Video;
import com.jaminchanks.service.VideoService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by jamin on 6/16/15.
 */
public class VideoAction extends ActionSupport {
    private int id; //这是用户id
    private int videoId;
    private Video video;
    private Video videoWatching;
    private VideoService videoService;
    private String catalog;
    private ArrayList<Video> videos;
    private String orderBy;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }


    public ArrayList<Video> getVideos() {
        return videos;
    }

    public void setVideos(ArrayList<Video> videos) {
        this.videos = videos;
    }


    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }


    public Video getVideoWatching() {
        return videoWatching;
    }

    public void setVideoWatching(Video videoWatching) {
        this.videoWatching = videoWatching;
    }

    public int getUserId() {
        return id;
    }

    public void setUserId(int id) {
        this.id = id;
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
    public String showVideosByCatalog4() {
        //找出所有user_id为id 的视频
        List<Video> videosOfIT = getVideoService().findVideoByCatalog4("IT");
        putInSession("videoOfIT", videosOfIT);

        List<Video> videosOfComic = getVideoService().findVideoByCatalog4("comic");
        putInSession("videoOfComic", videosOfComic);
        List<Video> videosOfFunny = getVideoService().findVideoByCatalog4("funny");
        putInSession("videoOfFunny", videosOfFunny);
        return SUCCESS;
    }

    //显示单个分类下的所有视频
    public String showAllVideosByCatalog(){
        if (orderBy == null)
            orderBy = "upTime";
        videos = (ArrayList<Video>) getVideoService().findVideoByCatalogOrder(catalog, orderBy);
        System.out.println("///////orderBy" + orderBy);
        System.out.println("///////calatog" + videos.get(0).getVideoName());
        return SUCCESS;
    }

    //根据videoId 查询视频，显示单个视频
    public String showVideoById() {
        Video video1 = getVideoService().findVideoById(videoId);
        //观看次数自动加一
        video1.setWatchNumbers(video1.getWatchNumbers() + 1);
        System.out.println("watchNumbers////" + video1.getWatchNumbers());
        getVideoService().updateVideo(video1);
        videoWatching = video1;
        return SUCCESS;
    }

    //查询某用户的所有视频
    public String showVideoByUserId() {
        System.out.println("id==////////++" + id);
        videos = (ArrayList<Video>) getVideoService().findVideosByUserId(id);
       // System.out.println("videoName" + videos.get(0).getVideoName());
        return SUCCESS;
    }

    //根据视频名字匹配相关视频
    public String showSearchResultOfVideo(){
        videos = (ArrayList<Video>) getVideoService().findVideosByName(video.getVideoName());
        return SUCCESS;
    }
}
