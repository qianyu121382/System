package com.example.entity;

public class Slideshow {

    /**ID */
    private Integer id;
    /**关联宠物 */
    private Integer virtualGameId;
    /**图片 */
    private String img;
    private String virtualGameName;

    public String getVirtualGameName() {
        return virtualGameName;
    }

    public void setVirtualGameName(String virtualGameName) {
        this.virtualGameName = virtualGameName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVirtualGameId() {
        return virtualGameId;
    }

    public void setVirtualGameId(Integer virtualGameId) {
        this.virtualGameId = virtualGameId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}