<template>
  <div style="width: 60%; margin: 10px auto">
    <div style="margin-bottom: 20px">
      <el-radio-group v-model="data.type">
        <el-radio label="游戏购买订单" value="virtualGame"></el-radio>
        <el-radio label="游戏周边订单" value="goods"></el-radio>
      </el-radio-group>
    </div>
    <div class="card" style="padding: 20px" v-if="data.type === 'virtualGame'">
      <div style="margin-bottom: 20px">
        <el-input v-model="data.orderNo" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单编号查询"></el-input>
        <el-input v-model="data.virtualGameName" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入游戏名称查询"></el-input>
        <el-button type="info" plain @click="load">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
      </div>

      <div style="margin-bottom: 20px">
        <el-table stripe :data="data.tableData">
          <el-table-column type="expand">
            <template #default="scope">
              <div style="padding: 10px">
                <el-descriptions title="订单详情" :column="3" border>
                  <el-descriptions-item label="订单号">{{ scope.row.orderNo }}</el-descriptions-item>
                  <el-descriptions-item label="游戏店">{{ scope.row.shopName }}</el-descriptions-item>
                  <el-descriptions-item label="游戏名称">{{ scope.row.virtualGameName }}</el-descriptions-item>
                  <el-descriptions-item label="游戏图片">
                    <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.virtualGameImg" :preview-src-list="[scope.row.virtualGameImg]" preview-teleported></el-image>
                  </el-descriptions-item>
                  <el-descriptions-item label="游戏价格"><span style="color: red;">￥{{ scope.row.price }}</span></el-descriptions-item>
                  <el-descriptions-item label="收货人">{{ scope.row.pickupUser }}</el-descriptions-item>
                  <el-descriptions-item label="收货地址">{{ scope.row.pickupAddress }}</el-descriptions-item>
                  <el-descriptions-item label="收货人联系方式">{{ scope.row.pickupPhone }}</el-descriptions-item>
                  <el-descriptions-item label="订单状态">
                    <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
                    <el-tag type="warning" v-if="scope.row.status === '待支付'">待支付</el-tag>
                    <el-tag type="primary" v-if="scope.row.status === '待发货'">待发货</el-tag>
                    <el-tag type="info" v-if="scope.row.status === '待签收'">待签收</el-tag>
                    <el-tag type="success" v-if="scope.row.status === '已完成'">已完成</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="创键时间">{{ scope.row.time }}</el-descriptions-item>
                </el-descriptions>
              </div>
            </template>
          </el-table-column>
          <el-table-column prop="orderNo" label="订单号"></el-table-column>
          <el-table-column prop="shopName" label="游戏店"></el-table-column>
          <el-table-column prop="virtualGameName" label="游戏名称"></el-table-column>
          <el-table-column prop="virtualGameImg" label="游戏图片">
            <template #default="scope">
              <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.virtualGameImg" :preview-src-list="[scope.row.virtualGameImg]" preview-teleported></el-image>
            </template>
          </el-table-column>
          <el-table-column prop="price" label="游戏价格">
            <template #default="scope">
              <span style="color: red">￥{{ scope.row.price }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="status" label="订单状态">
            <template v-slot="scope">
              <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
              <el-tag type="warning" v-if="scope.row.status === '待支付'">待支付</el-tag>
              <el-tag type="primary" v-if="scope.row.status === '待发货'">待发货</el-tag>
              <el-tag type="info" v-if="scope.row.status === '待签收'">待签收</el-tag>
              <el-tag type="success" v-if="scope.row.status === '已完成'">已完成</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="160" fixed="right">
            <template v-slot="scope">
              <el-button size="small" type="success" @click="pay(scope.row)" v-if="scope.row.status === '待支付'">支付</el-button>
              <el-button size="small" type="danger" @click="cancel(scope.row)" v-if="scope.row.status === '待支付'">取消</el-button>
              <el-button size="small" type="primary" @click="buyAgain(scope.row)" v-if="scope.row.status === '已取消'">再次购买</el-button>
              <el-button size="small" type="primary" @click="confirm(scope.row)" v-if="scope.row.status === '待签收'">签收</el-button>
              <el-button type="danger" circle :icon="Delete" @click="del(scope.row.id)" v-if="scope.row.status === '已取消' || scope.row.status === '已完成'"></el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div v-if="data.total">
        <el-pagination @current-change="load" layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>

    <div class="card" style="padding: 20px" v-if="data.type === 'goods'">
      <div style="margin-bottom: 20px">
        <el-input v-model="data.goodsOrderNo" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入订单编号查询"></el-input>
        <el-input v-model="data.goodsName" prefix-icon="Search" style="width: 240px; margin-right: 10px" placeholder="请输入商品名称查询"></el-input>
        <el-button type="info" plain @click="loadGoods">查询</el-button>
        <el-button type="warning" plain style="margin: 0 10px" @click="reset">重置</el-button>
      </div>

      <div style="margin-bottom: 20px">
        <el-table stripe :data="data.goodsTableData">
          <el-table-column type="expand">
            <template #default="scope">
              <div style="padding: 10px">
                <el-descriptions title="订单详情" :column="3" border>
                  <el-descriptions-item label="订单号">{{ scope.row.orderNo }}</el-descriptions-item>
                  <el-descriptions-item label="游戏店">{{ scope.row.shopName }}</el-descriptions-item>
                  <el-descriptions-item label="商品名称">{{ scope.row.goodsName }}</el-descriptions-item>
                  <el-descriptions-item label="商品图片">
                    <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]" preview-teleported></el-image>
                  </el-descriptions-item>
                  <el-descriptions-item label="商品单价"><span style="color: red;">￥{{ scope.row.price }}</span></el-descriptions-item>
                  <el-descriptions-item label="购买数量"><span>x{{ scope.row.num }}</span></el-descriptions-item>
                  <el-descriptions-item label="商品总价"><span style="color: red;">￥{{ scope.row.total }}</span></el-descriptions-item>
                  <el-descriptions-item label="收货人">{{ scope.row.pickupUser }}</el-descriptions-item>
                  <el-descriptions-item label="收货地址">{{ scope.row.pickupAddress }}</el-descriptions-item>
                  <el-descriptions-item label="收货人联系方式">{{ scope.row.pickupPhone }}</el-descriptions-item>
                  <el-descriptions-item label="订单状态">
                    <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
                    <el-tag type="warning" v-if="scope.row.status === '待支付'">待支付</el-tag>
                    <el-tag type="primary" v-if="scope.row.status === '待发货'">待发货</el-tag>
                    <el-tag type="info" v-if="scope.row.status === '待签收'">待签收</el-tag>
                    <el-tag type="success" v-if="scope.row.status === '已完成'">已完成</el-tag>
                  </el-descriptions-item>
                  <el-descriptions-item label="创键时间">{{ scope.row.time }}</el-descriptions-item>
                </el-descriptions>
              </div>
            </template>
          </el-table-column>
          <el-table-column prop="orderNo" label="订单号"></el-table-column>
          <el-table-column prop="shopName" label="游戏店"></el-table-column>
          <el-table-column prop="goodsName" label="商品名称"></el-table-column>
          <el-table-column prop="goodsImg" label="商品图片">
            <template #default="scope">
              <el-image style="width: 50px; height: 50px; border-radius: 5px" :src="scope.row.goodsImg" :preview-src-list="[scope.row.goodsImg]" preview-teleported></el-image>
            </template>
          </el-table-column>
          <el-table-column prop="price" label="商品总价">
            <template #default="scope">
              <span style="color: red">￥{{ scope.row.total }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="status" label="订单状态">
            <template v-slot="scope">
              <el-tag type="danger" v-if="scope.row.status === '已取消'">已取消</el-tag>
              <el-tag type="warning" v-if="scope.row.status === '待支付'">待支付</el-tag>
              <el-tag type="primary" v-if="scope.row.status === '待发货'">待发货</el-tag>
              <el-tag type="info" v-if="scope.row.status === '待签收'">待签收</el-tag>
              <el-tag type="success" v-if="scope.row.status === '已完成'">已完成</el-tag>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="160" fixed="right">
            <template v-slot="scope">
              <el-button size="small" type="success" @click="payGoods(scope.row)" v-if="scope.row.status === '待支付'">支付</el-button>
              <el-button size="small" type="danger" @click="cancelGoods(scope.row)" v-if="scope.row.status === '待支付'">取消</el-button>
              <el-button size="small" type="primary" @click="buyAgainGoods(scope.row)" v-if="scope.row.status === '已取消'">再次购买</el-button>
              <el-button size="small" type="primary" @click="confirmGoods(scope.row)" v-if="scope.row.status === '待签收'">签收</el-button>
              <el-button type="danger" circle :icon="Delete" @click="delGoods(scope.row.id)" v-if="scope.row.status === '已取消' || scope.row.status === '已完成'"></el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
      <div v-if="data.total">
        <el-pagination @current-change="load" layout="total, prev, pager, next" :page-size="data.pageSize" v-model:current-page="data.pageNum" :total="data.total" />
      </div>
    </div>

  </div>
</template>

<script setup>

import {reactive} from "vue";
import request from "@/utils/request.js";
import {ElMessage, ElMessageBox} from "element-plus";
import {Delete, Edit} from "@element-plus/icons-vue";


const data = reactive({
  user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
  formVisible: false,
  form: {},
  tableData: [],
  pageNum: 1,
  pageSize: 10,
  total: 0,
  virtualGameName: null,
  orderNo: null,
  ids: [],
  type: 'virtualGame',

  goodsTableData: [],
  goodsPageNum: 1,
  goodsPageSize: 10,
  goodsTotal: 0,
  goodsName: null,
  goodsOrderNo: null,
})

const buyAgainGoods = (row) => {
  request.post('/goodsOrders/add', row).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      loadGoods()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const confirmGoods = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '已完成'
  ElMessageBox.confirm('您确认签收【 ' + row.goodsName + '】吗？', '签收确认', { type: 'warning' }).then(res => {
    request.put('/goodsOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('签收成功')
        loadGoods()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const cancelGoods = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '已取消'
  ElMessageBox.confirm('您确认取消【 ' + row.goodsName + '】订单吗？', '取消确认', { type: 'warning' }).then(res => {
    request.put('/goodsOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('取消成功')
        loadGoods()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const payGoods = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '待发货'
  ElMessageBox.confirm('您确认支付' + row.total + '元吗？账户余额不足将支付失败', '支付确认', { type: 'warning' }).then(res => {
    request.put('/goodsOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('支付成功')
        loadGoods()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}


const buyAgain = (row) => {
  request.post('/virtualGameOrders/add', row).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const confirm = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '已完成'
  ElMessageBox.confirm('您确认签收【 ' + row.virtualGameName + '】吗？', '签收确认', { type: 'warning' }).then(res => {
    request.put('/virtualGameOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('签收成功')
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const cancel = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '已取消'
  ElMessageBox.confirm('您确认取消【 ' + row.virtualGameName + '】订单吗？', '取消确认', { type: 'warning' }).then(res => {
    request.put('/virtualGameOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('取消成功')
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const pay = (row) => {
  data.form = JSON.parse(JSON.stringify(row))
  data.form.status = '待发货'
  ElMessageBox.confirm('您确认支付' + row.price + '元吗？账户余额不足将支付失败', '支付确认', { type: 'warning' }).then(res => {
    request.put('/virtualGameOrders/update', data.form).then(res => {
      if (res.code === '200') {
        ElMessage.success('支付成功')
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch()
}

const load = () => {
  request.get('/virtualGameOrders/selectPage', {
    params: {
      pageNum: data.pageNum,
      pageSize: data.pageSize,
      virtualGameName: data.virtualGameName,
      orderNo: data.orderNo
    }
  }).then(res => {
    if (res.code === '200') {
      data.tableData = res.data?.list || []
      data.total = res.data?.total
    } else {
      ElMessage.error(res.msg)
    }
  })
}
load()

const loadGoods = () => {
  request.get('/goodsOrders/selectPage', {
    params: {
      pageNum: data.goodsPageNum,
      pageSize: data.goodsPageSize,
      virtualGameName: data.goodsName,
      orderNo: data.goodsOrderNo
    }
  }).then(res => {
    if (res.code === '200') {
      data.goodsTableData = res.data?.list || []
      data.goodsTotal = res.data?.total
    } else {
      ElMessage.error(res.msg)
    }
  })
}
loadGoods()

const add = () => {
  request.post('/virtualGameOrders/add', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const update = () => {
  request.put('/virtualGameOrders/update', data.form).then(res => {
    if (res.code === '200') {
      ElMessage.success('操作成功')
      data.formVisible = false
      load()
    } else {
      ElMessage.error(res.msg)
    }
  })
}

const save = () => {
  data.form.id ? update() : add()
}

const del = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/virtualGameOrders/delete/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success("删除成功")
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    console.error(err)
  })
}

const delGoods = (id) => {
  ElMessageBox.confirm('删除后数据无法恢复，您确定删除吗？', '删除确认', { type: 'warning' }).then(res => {
    request.delete('/goodsOrders/delete/' + id).then(res => {
      if (res.code === '200') {
        ElMessage.success("删除成功")
        load()
      } else {
        ElMessage.error(res.msg)
      }
    })
  }).catch(err => {
    console.error(err)
  })
}


const reset = () => {
  data.virtualGameName = null
  data.orderNo = null
  load()
}
</script>