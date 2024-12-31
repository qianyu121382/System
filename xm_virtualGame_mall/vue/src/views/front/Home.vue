<template>
  <div class="main-content">
    <div style="margin-bottom: 20px">
      <el-carousel height="400px">
        <el-carousel-item v-for="item in data.slideshowList" :key="item">
          <img @click="goTo('/front/virtualGameDetail?id=' + item.virtualGameId)" :src="item.img" alt="" style="width: 100%; height: 400px; cursor: pointer">
        </el-carousel-item>
      </el-carousel>
    </div>

    <div style="margin: 30px 0; display: flex; grid-gap: 20px">
      <div style="flex: 1">
        <div style="display: flex; align-items: center; margin-bottom: 20px">
          <div style="flex: 1; font-size: 24px; font-weight: bold">推荐游戏</div>
          <div style="cursor: pointer" @click="goTo('/front/virtualGame')">查看所有游戏 <el-icon style="top: 2px"><ArrowRight /></el-icon></div>
        </div>
        <div>
          <el-row :gutter="20">
           <el-col :span="12" v-for="item in data.recommendPetList" :key="item.id">
             <div @click="goTo('/front/virtualGameDetail?id=' + item.id)" class="card" style="padding: 0; margin-bottom: 20px;
                cursor: pointer; border-radius: 5px; overflow: hidden">
               <img :src="item.img" alt="" style="width: 100%; height: 220px; display: block">
               <div style="padding: 10px">
                 <div style="font-size: 20px; font-weight: bold; margin-bottom: 10px" class="line1">{{ item.name }}</div>
                 <div style="font-size: 20px; color: red">￥{{ item.price }}</div>
               </div>
             </div>
           </el-col>
          </el-row>
        </div>
      </div>
      <div style="flex: 1">
        <div style="display: flex; align-items: center; margin-bottom: 20px">
          <div style="flex: 1; font-size: 24px; font-weight: bold">热门游戏店</div>
          <div style="cursor: pointer" @click="goTo('/front/virtualGameShop')">查看所有游戏店 <el-icon style="top: 2px"><ArrowRight /></el-icon></div>
        </div>
        <div class="card" style="padding: 10px">
          <div @click="goTo('/front/virtualGameShopDetail?id=' + item.id)" class="virtualGameShop-item" v-for="item in data.virtualGameShopList" :key="item.id" style="display: flex; align-items: center; grid-gap: 40px;
            margin-bottom: 10px; border-bottom: 1px solid #ddd; padding: 10px 0; cursor: pointer">
            <div style="width: 100px; text-align: center">
              <img :src="item.avatar" alt="" style="width: 40px; height: 40px; border-radius: 50%">
              <div style="font-size: 16px" class="line1">{{ item.name }}</div>
            </div>
            <div>
              <div style="margin-bottom: 20px"><span style="color: #666">游戏店地址：</span>{{ item.address }}</div>
              <div><span style="color: #666">售卖游戏：</span>{{ JSON.parse(item.sellVirtualGame || '[]').join('、') }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div style="margin: 20px 0">
      <div style="display: flex; align-items: center; margin-bottom: 20px">
        <div style="flex: 1; font-size: 24px; font-weight: bold">热销游戏周边</div>
        <div style="cursor: pointer" @click="goTo('/front/goods')">查看所有游戏周边 <el-icon style="top: 2px"><ArrowRight /></el-icon></div>
      </div>
      <el-row :gutter="20">
       <el-col :span="6" v-for="item in data.goodsList" :key="item.id">
         <div class="card" style="padding: 0; border-radius: 5px; overflow: hidden; margin-bottom: 20px">
           <img :src="item.img" alt="" style="width: 100%; height: 200px">
           <div style="padding: 10px">
             <div style="font-size: 20px; margin-bottom: 10px; display: flex; align-items: center">
               <el-tag type="success">售卖中</el-tag>
               <span style="font-weight: bold; margin-left: 5px; flex: 1; width: 0" class="line1">{{ item.name }}</span>
             </div>
             <div style="display: flex; align-items: center; margin: 15px 0">
               <div style="font-size: 18px; color: red; flex: 1">￥{{ item.price }}</div>
               <div><el-button @click="view(item)" type="primary" plain size="small">查看详情</el-button></div>
             </div>
             <div style="display: flex; align-items: center">
               <div style="flex: 1">
                 <el-input-number v-model="item.num" :min="1" style="width: 100px" size="small"></el-input-number>
               </div>
               <div><el-button @click="addCart(item.id, item.num)" type="danger" size="small">加入购物车</el-button></div>
             </div>
           </div>
         </div>
       </el-col>
      </el-row>
    </div>

    <el-dialog title="游戏周边详情" v-model="data.goodsVisible" width="40%" destroy-on-close>
      <div style="padding: 20px; color: #333">
        <div style="text-align: center; margin-bottom: 10px"><img style="width: 50%" :src="data.goods.img" alt=""></div>
        <div style="display: flex; align-items: center; margin-bottom: 10px">
          <el-tag type="success">售卖中</el-tag>
          <span style="font-size: 20px; font-weight: bold; margin-left: 5px">{{ data.goods.name }}</span>
        </div>
        <div style="margin: 10px 0"><span style="color: #666">商品销量：</span>{{ data.goods.sale }}</div>
        <div style="margin: 10px 0"><span style="color: #666">剩余数量：</span>{{ data.goods.store }}</div>
        <div style="margin: 10px 0"><span style="color: #666">商品类型：</span>{{ data.goods.typeName }}</div>
        <div style="margin: 10px 0; text-align: justify; line-height: 20px"><span style="color: #666">商品简介：</span>{{ data.goods.descr }}</div>
        <div style="margin: 10px 0;"><span style="color: #666">商品价格：</span><span style="font-size: 18px; color: red">￥{{ data.goods.price }}</span></div>
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="data.goodsVisible = false">关 闭</el-button>
        </span>
      </template>
    </el-dialog>

  </div>
</template>

<script setup>
import { reactive } from "vue";
import request from "@/utils/request.js";
import router from "@/router/index.js";
import {ElMessage} from "element-plus";

const data = reactive({
  slideshowList: [],
  recommendPetList: [],
  virtualGameShopList: [],
  goodsList: [],
  goodsVisible: false,
  goods: {}
})

window.scrollTo({ top: 0 })

const addCart = (goodsId, num) => {
  request.post('/cart/add', { goodsId: goodsId, num: num}).then(res => {
    if (res.code === '200') {
      ElMessage.success('加入成功')
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const view = (goods) => {
  data.goods = goods
  data.goodsVisible = true
}

request.get('/slideshow/selectAll').then(res => {
  data.slideshowList = res.data
  console.log(data.slideshowList);
})

request.get('/virtualGame/selectAll', {
  params: {
    recommend: '是',
    status: '上架'
  }
}).then(res => {
  data.recommendPetList = res.data.splice(0, 4)
})

request.get('/goods/selectAll', {
  params: {
    status: '上架',
    orderBy: 'sale'
  }
}).then(res => {
  data.goodsList = res.data.splice(0, 8)
  data.goodsList.forEach(item => item.num = 1)
})

request.get('/virtualGameShop/selectRank').then(res => {
  data.virtualGameShopList = res.data
})

const goTo = (path) => {
  router.push(path)
}
</script>

<style>
.virtualGameShop-item:last-child {
  border: none !important;
  padding-bottom: 0 !important;
}
</style>