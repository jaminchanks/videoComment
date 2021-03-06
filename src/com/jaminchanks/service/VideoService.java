package com.jaminchanks.service;

import com.jaminchanks.pojo.Video;

import java.util.List;

/**
 * Created by jamin on 6/8/15.
 */
public interface VideoService {
    //增
    int addVideo(Video video);

    //删
    void deleteVideo(Video video);

    //查
    List<Video> findVideo(String hql, Object... params);

    //按分类有序查找视频,显示全部
    List<Video> findVideoByCatalogOrder(String catalog, String order);

    //只显示4条数据，用于首页
    //按分类查找视频
    List<Video> findVideoByCatalog4(String catalog);

    //按id查找视频
    Video findVideoById(int id);

    //按用户id查找视频
    List<Video> findVideosByUserId(int userId);

    //根据视频的名字来查找视频
    List<Video> findVideosByName(String videoName);

    //改
    void updateVideo(Video video);


}
