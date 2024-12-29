package com.example.entity;

import java.math.BigDecimal;

public class Collect {

    /**主键 */
    private Integer id;
    /**关联ID */
    private Integer fid;
    /**用户 */
    private Integer userId;
    private String virtual_gameName;
    private String virtual_gameImg;
    private String userName;
    private BigDecimal virtual_gamePrice;

    public BigDecimal getPetPrice() {
        return virtual_gamePrice;
    }

    public void setPetPrice(BigDecimal virtual_gamePrice) {
        this.virtual_gamePrice = virtual_gamePrice;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPetName() {
        return virtual_gameName;
    }

    public void setPetName(String virtual_gameName) {
        this.virtual_gameName = virtual_gameName;
    }

    public String getPetImg() {
        return virtual_gameImg;
    }

    public void setPetImg(String virtual_gameImg) {
        this.virtual_gameImg = virtual_gameImg;
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
