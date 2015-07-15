package com.jaminchanks.service.impl;

import com.jaminchanks.dao.VideoDao;
import com.jaminchanks.pojo.Video;
import com.jaminchanks.service.VideoService;

import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public class VideoServiceImpl implements VideoService {
    private VideoDao videoDao;

    public VideoDao getVideoDao() {
        return videoDao;
    }

    public void setVideoDao(VideoDao videoDao) {
        this.videoDao = videoDao;
    }

    @Override
    public int addVideo(Video video) {
        return (Integer)videoDao.save(video);
    }

    @Override
    public void deleteVideo(Video video) {

    }

    @Override
    public List<Video> findVideo(String hql, Object... params) {
        return videoDao.find(hql, params);
    }

    @Override
    public List<Video> findVideoByCatalogOrder(String catalog, String order) {
        return videoDao.findVideoByCatalogOrder(catalog, order);
    }

    //只显示4条数据
    @Override
    public List<Video> findVideoByCatalog4(String catalog) {
        List<Video> videos = findVideoByCatalogOrder(catalog, "upTime");
        return videos.subList(0, videos.size() > 4 ? 4 : videos.size());
    }

    @Override
    public Video findVideoById(int id){
       return videoDao.findVideoById(id);
    }

    @Override
    public void updateVideo(Video video) {
        videoDao.update(video);
    }


    @Override
    public List<Video> findVideosByUserId(int userId){
        return videoDao.findVideosByUserId(userId);
    }


    @Override
    public List<Video> findVideosByName(String videoName) {
        return videoDao.findVideosByName(videoName);
    }

}
