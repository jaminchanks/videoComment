package com.jaminchanks.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Random;

/**
 * Created by jamin on 7/5/15.
 */
public class UploadVideoWrap extends ActionSupport{
    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }
    public String getRealSavePath() {
        return ServletActionContext.getServletContext().getRealPath(savePath);
    }

    public String getSavedFileName() {
        return savedFileName;
    }

    public void setSavedFileName(String savedFileName) {
        this.savedFileName = savedFileName;
    }


    private File file;// 对应文件域的file，封装文件内容
    private String fileContentType;// 封装文件类型
    private String fileFileName;// 封装文件名
    private String savePath;// 保存路径
    private String savedFileName;//保存到服务器的视频封面文件名字

    @Override
    public String execute() {
        try {
            System.out.println("is in uploadVideoAction" + file);

            Random random = new Random();
            if (file != null) {
                System.out.println(getFileContentType());
                // 读取文件内容到InputStream里

                // 以服务器的文件保存地址和原文件名建立上传文件输出流, 并将上传到的文件重命名命名方式id+account.xxx
                savedFileName = random.nextLong() +
                        fileFileName.substring(fileFileName.lastIndexOf("."));
                if (new File(getRealSavePath() + "/" + savedFileName).exists())
                    savedFileName = random.nextLong() +
                            fileFileName.substring(fileFileName.lastIndexOf("."));
                System.out.println(getRealSavePath() + "/" + savedFileName);
                FileOutputStream fos = new FileOutputStream(getRealSavePath() + "/" + savedFileName);

                FileInputStream fis = new FileInputStream(file);
                byte[] buffer = new byte[1024];
                int len = 0;
                while ((len = fis.read(buffer)) > 0) {
                    fos.write(buffer, 0, len);
                }
                System.out.println("上传成功！");
                //关闭输入输出流
                fis.close();
                fos.close();
            }
            return SUCCESS;
        }catch (Exception ex){
            return INPUT;
        }
    }
}
