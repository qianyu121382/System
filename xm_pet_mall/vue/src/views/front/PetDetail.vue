<template>
  <div style="width: 60%; margin: 10px auto">
    <div class="card" style="padding: 20px; display: flex; grid-gap: 20px; margin-bottom: 20px">
      <img :src="data.pet.img" alt="" style="width: 400px; height: 350px">
      <div style="flex: 1; width: 0; display: flex; flex-direction: column; justify-content: space-around">
        <div style="font-size: 20px; font-weight: bold; margin-bottom: 10px">{{ data.pet.name }}</div>
        <div style="margin-bottom: 10px; display: flex; align-items: center;">
          <span style="color: #666">宠物店：</span>
          <div style="display: flex; align-items: center; cursor: pointer;" @click="router.push('/front/petShopDetail?id=' + data.pet.shopId)">
            <img style="width: 20px; height: 20px; border-radius: 50%" :src="data.pet.shopAvatar" alt="">
            <span>{{ data.pet.shopName }}</span>
          </div>
        </div>
        <div style="margin-bottom: 10px">
          <span style="color: #666">宠物类型：</span>
          <span>{{ data.pet.typeName }}</span>
        </div>
        <div style="margin-bottom: 10px">
          <span style="color: #666">宠物状态：</span>
          <el-tag type="success">售卖中</el-tag>
        </div>
        <div style="margin-bottom: 10px">
          <span style="color: #666">宠物性别：</span>
          <span>{{ data.pet.sex }}</span>
        </div>
        <div style="margin-bottom: 10px">
          <span style="color: #666">宠物价格：</span>
          <span style="color: red; font-size: 20px">￥{{ data.pet.price }}</span>
        </div>
        <div style="margin-bottom: 10px">
          <span style="color: #666">剩余数量：</span>
          <span>{{ data.pet.store }}</span>
        </div>
        <div class="line3" style="text-align: justify; line-height: 20px; height: 60px; margin-bottom: 10px">
          <span style="color: #666">宠物简介：</span>
          <el-tooltip effect="dark myTooltip" :content="data.pet.introduce" placement="top" v-if="data.pet.introduce?.length >= 114">
            <span>{{ data.pet.introduce }}</span>
          </el-tooltip>
          <span>{{ data.pet.introduce }}</span>
        </div>

        <div style="display: flex; grid-gap: 20px">
          <div>
            <el-button type="warning" v-if="data.pet.hasCollect" @click="addCollect(data.pet.id)">取消收藏</el-button>
            <el-button type="warning" v-else @click="addCollect(data.pet.id)">收藏宠物</el-button>
          </div>
          <el-button type="danger" @click="handleAdd" :disabled="data.pet.store < 1">立即购买</el-button>
        </div>
      </div>
    </div>

    <div class="card" style="padding: 20px">
      <div style="font-size: 24px; font-weight: bold; padding-bottom: 10px; border-bottom: 1px solid #ddd">宠物详情</div>
      <div style="padding: 20px 0" v-html="data.pet.content"></div>
    </div>

    <el-dialog title="收货地址" v-model="data.formVisible" width="40%" destroy-on-close>
      <el-form ref="formRef" :model="data.form" label-width="90px" style="padding: 20px">
        <el-form-item label="收货地址">
          <el-select style="width: 100%" v-model="data.form.addressId">
            <el-option v-for="item in data.addressList" :key="item.id" :value="item.id" :label="item.name + ' - ' + item.address + ' - ' + item.phone"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.formVisible = false">取 消</el-button>
          <el-button type="primary" @click="addOrder">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import {reactive} from "vue";
import router from "@/router/index.js";
import request from "@/utils/request.js";
import {ElMessage} from "element-plus";

const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  id: router.currentRoute.value.query.id,
  pet: {},
  addressList: [],
  form: {},
  formVisible: false
})

window.scrollTo({ top: 0 })

const addCollect = (petId) => {
  request.post('/collect/add', { fid: petId }).then(res => {
    if (res.code === '200') {
      ElMessage.success("操作成功")
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const handleAdd = () => {
  data.form = { petId: data.id, shopId: data.pet.shopId }
  data.formVisible = true
}

const addOrder = () => {
  if (!data.form.addressId) {
    ElMessage.warning('请选择收货地址')
    return
  }
  request.post('/petOrders/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success("下单成功")
      data.formVisible = false
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

if (data.user.id) {
  request.get('/address/selectAll', {
    params: {
      userId: data.user.id
    }
  }).then(res => {
    data.addressList = res.data
  })
}

const load = () => {
  request.get('/pet/selectById/' + data.id).then(res => {
    data.pet = res.data
  })
}
load()
</script>

<style>
.myTooltip {
  width: 30%;
}
</style>