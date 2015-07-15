package com.jaminchanks.dao.impl;

import com.jaminchanks.common.impl.BaseDaoHibernate4Impl;
import com.jaminchanks.dao.VideoDao;
import com.jaminchanks.pojo.Video;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public class VideoDaoImpl extends BaseDaoHibernate4Impl<Video> implements VideoDao {

    @Override
    public List<Video> findVideoByCatalogOrder(String catalog, String order) {
        String hql = "from Video where catalog=? order by "+ order +" desc";
        return find(hql, catalog);
    }

    @Override
    public Video findVideoById(int id){
        String hql = "from Video where videoId=?";
        List<Video> videos = find(hql, id);
        if (videos != null && videos.size() != 0)
            return videos.get(0);
        else return null;
    }

    @Override
    public List<Video> findVideosByUserId(int userId){
        String hql = "from Video where user.id=?";
        return find(hql, userId);
    }

    @Override
    public List<Video> findVideosByName(String videoName) {
        videoName = "%" + videoName + "%";
        String hql = "from Video where videoName like ?";
        return find(hql, videoName);
    }

    @Override
    public Serializable addVideo(Video video){
        video.setUpTime(new Timestamp(System.currentTimeMillis()));
        video.setWatchNumbers(0);
        video.setLikeNumbers(0);
        return save(video);
    }

}
