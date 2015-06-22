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
        return 0;
    }

    @Override
    public void deleteVideo(Video video) {

    }

    @Override
    public List<Video> findVideo(String hql, Object... params) {
        return videoDao.find(hql, params);
    }

    @Override
    public List<Video> findVideoByCatalog(String catalog) {
        String hql = "from Video where catalog=? order by upTime desc";
        return videoDao.find(hql, catalog);
    }

    //只显示4条数据
    @Override
    public List<Video> findVideoByCatalog4(String catalog) {
        List<Video> videos = findVideoByCatalog(catalog);
        return videos.subList(0, videos.size()>4?4: videos.size());
    }

    @Override
    public Video findVideoById(int id){
        String hql = "from Video where videoId=?";
        List<Video> videos = videoDao.find(hql, id);
        if (videos != null && videos.size() != 0)
            return videos.get(0);
        else return null;
    }

    @Override
    public void UpdateVideo(Video video) {

    }
}
