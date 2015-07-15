package com.jaminchanks.dao;

import com.jaminchanks.common.BaseDao;
import com.jaminchanks.pojo.Video;

import java.io.Serializable;
import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public interface VideoDao extends BaseDao<Video> {
    List<Video> findVideoByCatalogOrder(String catalog, String order);
    Video findVideoById(int id);
    List<Video> findVideosByUserId(int userId);
    List<Video> findVideosByName(String videoName);

    Serializable addVideo(Video video);
}
