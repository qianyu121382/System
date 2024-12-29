package com.example.entity;

public class Slideshow {

    /**ID */
    private Integer id;
    /**关联宠物 */
    private Integer virtual_gameId;
    /**图片 */
    private String img;
    private String virtual_gameName;

    public String getPetName() {
        return virtual_gameName;
    }

    public void setPetName(String virtual_gameName) {
        this.virtual_gameName = virtual_gameName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPetId() {
        return virtual_gameId;
    }

    public void setPetId(Integer virtual_gameId) {
        this.virtual_gameId = virtual_gameId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}