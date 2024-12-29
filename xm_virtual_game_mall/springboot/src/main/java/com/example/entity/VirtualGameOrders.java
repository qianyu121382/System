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
    private Integer virtual_gameId;
    /**宠物名称 */
    private String virtual_gameName;
    /**宠物图片 */
    private String virtual_gameImg;
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
        return virtual_gameId;
    }

    public void setPetId(Integer virtual_gameId) {
        this.virtual_gameId = virtual_gameId;
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
