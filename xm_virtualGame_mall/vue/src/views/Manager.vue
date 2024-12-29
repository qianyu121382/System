<template>
  <div class="manager-container">
    <div class="manager-header">
      <div class="manager-header-left">
        <img src="@/assets/imgs/logo.png" alt="">
        <div class="title">宠物商城</div>
      </div>
      <div class="manager-header-center">
        <el-breadcrumb separator="/">
          <el-breadcrumb-item :to="{ path: '/manager/home' }">首页</el-breadcrumb-item>
          <el-breadcrumb-item>{{ router.currentRoute.value.meta.name }}</el-breadcrumb-item>
        </el-breadcrumb>
      </div>
      <div class="manager-header-right">
        <el-dropdown style="cursor: pointer">
          <div style="padding-right: 20px; display: flex; align-items: center">
            <img style="width: 40px; height: 40px; border-radius: 50%;" :src="data.user.avatar" alt="">
            <span style="margin-left: 5px; color: white">{{ data.user.name }}</span>
            <span v-if="data.user.role === 'PETSHOP'">
              <span v-if="data.user.status === '审核通过'">（已认证）</span>
              <span v-else>（未认证）</span>
            </span>
            <el-icon color="#fff"><arrow-down /></el-icon>
          </div>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item @click="router.push('/manager/person')">个人资料</el-dropdown-item>
              <el-dropdown-item @click="router.push('/manager/identify')" v-if="data.user.role === 'PETSHOP'">认证信息</el-dropdown-item>
              <el-dropdown-item @click="router.push('/manager/password')">修改密码</el-dropdown-item>
              <el-dropdown-item @click="logout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
    <!-- 下面部分开始 -->
    <div style="display: flex">
      <div class="manager-main-left">
        <el-menu :default-active="router.currentRoute.value.path"
                 :default-openeds="['1', '2']"
                 router
        >
          <el-menu-item index="/manager/home" v-if="data.user.role === 'ADMIN'">
            <el-icon><HomeFilled /></el-icon>
            <span>系统首页</span>
          </el-menu-item>
          <el-menu-item index="/manager/noticeView" v-if="data.user.role === 'PETSHOP'">
            <el-icon><Phone /></el-icon>
            <span>系统公告</span>
          </el-menu-item>
          <el-sub-menu index="1" v-if="data.user.role === 'ADMIN' || (data.user.role === 'PETSHOP' && data.user.status === '审核通过')">
            <template #title>
              <el-icon><Menu /></el-icon>
              <span>信息管理</span>
            </template>
            <el-menu-item index="/manager/virtualGameType" v-if="data.user.role === 'ADMIN'">宠物类型</el-menu-item>
            <el-menu-item index="/manager/goodsType" v-if="data.user.role === 'ADMIN'">宠物用品类型</el-menu-item>
            <el-menu-item index="/manager/virtualGame">宠物信息</el-menu-item>
            <el-menu-item index="/manager/goods">宠物用品信息</el-menu-item>
            <el-menu-item index="/manager/virtualGameOrders">宠物订单信息</el-menu-item>
            <el-menu-item index="/manager/goodsOrders">宠物用品订单</el-menu-item>
            <el-menu-item index="/manager/forum" v-if="data.user.role === 'ADMIN'">宠物帖子信息</el-menu-item>
            <el-menu-item index="/manager/comment" v-if="data.user.role === 'ADMIN'">宠物帖子评论</el-menu-item>
            <el-menu-item index="/manager/slideshow" v-if="data.user.role === 'ADMIN'">轮播图信息</el-menu-item>
            <el-menu-item index="/manager/collect" v-if="data.user.role === 'ADMIN'">宠物收藏信息</el-menu-item>
            <el-menu-item index="/manager/address" v-if="data.user.role === 'ADMIN'">用户收货地址</el-menu-item>
            <el-menu-item index="/manager/notice" v-if="data.user.role === 'ADMIN'">系统公告</el-menu-item>
          </el-sub-menu>
          <el-sub-menu index="2" v-if="data.user.role === 'ADMIN'">
            <template #title>
              <el-icon><Menu /></el-icon>
              <span>用户管理</span>
            </template>
            <el-menu-item index="/manager/user">普通用户信息</el-menu-item>
            <el-menu-item index="/manager/virtualGameShop">宠物店主信息</el-menu-item>
            <el-menu-item index="/manager/admin">管理员信息</el-menu-item>
          </el-sub-menu>
        </el-menu>
      </div>
      <div class="manager-main-right">
        <RouterView @updateUser="updateUser" />
      </div>
    </div>
    <!-- 下面部分结束 -->


  </div>
</template>

<script setup>
import { reactive } from "vue";
import router from "@/router/index.js";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}')
})

if (data.user.role === 'USER') {
  router.push('/login')
}

const logout = () => {
  localStorage.removeItem('xm-user')
  router.push('/login')
}

const updateUser = () => {
  data.user =  JSON.parse(localStorage.getItem('xm-user') || '{}')
}

if (!data.user.id) {
  logout()
  ElMessage.error('请登录！')
}
</script>

<style scoped>
@import "@/assets/css/manager.css";
</style>