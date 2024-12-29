package com.example.entity;

import java.math.BigDecimal;

public class Collect {

    /**主键 */
    private Integer id;
    /**关联ID */
    private Integer fid;
    /**用户 */
    private Integer userId;
    private String virtualGameName;
    private String virtualGameImg;
    private String userName;
    private BigDecimal virtualGamePrice;

    public BigDecimal getPetPrice() {
        return virtualGamePrice;
    }

    public void setPetPrice(BigDecimal virtualGamePrice) {
        this.virtualGamePrice = virtualGamePrice;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPetName() {
        return virtualGameName;
    }

    public void setPetName(String virtualGameName) {
        this.virtualGameName = virtualGameName;
    }

    public String getPetImg() {
        return virtualGameImg;
    }

    public void setPetImg(String virtualGameImg) {
        this.virtualGameImg = virtualGameImg;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
