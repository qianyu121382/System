package com.example.entity;

import java.math.BigDecimal;

public class VirtualGameOrders
{

    /**ID */
    private Integer id;
    /**订单号 */
    private String orderNo;
    /**用户 */
    private Integer userId;
    /**宠物店 */
    private Integer shopId;
    /**宠物 */
    private Integer virtualGameId;
    /**宠物名称 */
    private String virtualGameName;
    /**宠物图片 */
    private String virtualGameImg;
    /**宠物价格 */
    private BigDecimal price;
    /**收货人名称 */
    private String pickupUser;
    /**收货人地址 */
    private String pickupAddress;
    /**收货人电话 */
    private String pickupPhone;
    /**订单状态 */
    private String status;
    /**创建时间 */
    private String time;
    private String userName;
    private String shopName;
    private Integer addressId;

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Integer getPetId() {
        return virtualGameId;
    }

    public void setPetId(Integer virtualGameId) {
        this.virtualGameId = virtualGameId;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPickupUser() {
        return pickupUser;
    }

    public void setPickupUser(String pickupUser) {
        this.pickupUser = pickupUser;
    }

    public String getPickupAddress() {
        return pickupAddress;
    }

    public void setPickupAddress(String pickupAddress) {
        this.pickupAddress = pickupAddress;
    }

    public String getPickupPhone() {
        return pickupPhone;
    }

    public void setPickupPhone(String pickupPhone) {
        this.pickupPhone = pickupPhone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
