import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    { path: '/', redirect: '/manager/home' },
    {
      path: '/manager',
      component: () => import('@/views/Manager.vue'),
      children: [
        { path: 'home', meta: { name: '系统首页' }, component: () => import('@/views/manager/Home.vue'),  },
        { path: 'admin', meta: { name: '管理员信息' }, component: () => import('@/views/manager/Admin.vue'), },
        { path: 'notice', meta: { name: '系统公告' }, component: () => import('@/views/manager/Notice.vue'), },
        { path: 'person', meta: { name: '个人资料' }, component: () => import('@/views/manager/Person.vue'), },
        { path: 'password', meta: { name: '修改密码' }, component: () => import('@/views/manager/Password.vue'), },
        { path: 'virtual_gameType', meta: { name: '游戏类型' }, component: () => import('@/views/manager/VirtualGameType.vue'), },
        { path: 'goodsType', meta: { name: '游戏用品类型' }, component: () => import('@/views/manager/GoodsType.vue'), },
        { path: 'virtual_gameShop', meta: { name: '游戏店主信息' }, component: () => import('@/views/manager/VirtualGameShop.vue'), },
        { path: 'identify', meta: { name: '游戏店主认证' }, component: () => import('@/views/manager/Identify.vue'), },
        { path: 'user', meta: { name: '普通用户信息' }, component: () => import('@/views/manager/User.vue'), },
        { path: 'virtual_game', meta: { name: '游戏信息' }, component: () => import('@/views/manager/VirtualGame.vue'), },
        { path: 'slideshow', meta: { name: '轮播图信息' }, component: () => import('@/views/manager/Slideshow.vue'), },
        { path: 'goods', meta: { name: '游戏用品信息' }, component: () => import('@/views/manager/Goods.vue'), },
        { path: 'address', meta: { name: '用户收货地址信息' }, component: () => import('@/views/manager/Address.vue'), },
        { path: 'virtual_gameOrders', meta: { name: '游戏订单信息' }, component: () => import('@/views/manager/VirtualGameOrders.vue'), },
        { path: 'goodsOrders', meta: { name: '游戏用品订单信息' }, component: () => import('@/views/manager/GoodsOrders.vue'), },
        { path: 'forum', meta: { name: '游戏帖子信息' }, component: () => import('@/views/manager/Forum.vue'), },
        { path: 'comment', meta: { name: '游戏帖子评论信息' }, component: () => import('@/views/manager/Comment.vue'), },
        { path: 'collect', meta: { name: '游戏收藏信息' }, component: () => import('@/views/manager/Collect.vue'), },
        { path: 'noticeView', meta: { name: '系统公告' }, component: () => import('@/views/manager/NoticeView.vue'), },
      ]
    },
    {
      path: '/front',
      component: () => import('@/views/Front.vue'),
      children: [
        { path: 'home', component: () => import('@/views/front/Home.vue'),  },
        { path: 'person', component: () => import('@/views/front/Person.vue'),  },
        { path: 'password', component: () => import('@/views/front/Password.vue'), },
        { path: 'notice', component: () => import('@/views/front/Notice.vue'), },
        { path: 'virtual_gameDetail', component: () => import('@/views/front/VirtualGameDetail.vue'), },
        { path: 'virtual_gameShopDetail', component: () => import('@/views/front/VirtualGameShopDetail.vue'), },
        { path: 'virtual_gameShop', component: () => import('@/views/front/VirtualGameShop.vue'), },
        { path: 'virtual_game', component: () => import('@/views/front/VirtualGame.vue'), },
        { path: 'goods', component: () => import('@/views/front/Goods.vue'), },
        { path: 'address', component: () => import('@/views/front/Address.vue'), },
        { path: 'orders', component: () => import('@/views/front/Orders.vue'), },
        { path: 'cart', component: () => import('@/views/front/Cart.vue'), },
        { path: 'myForum', component: () => import('@/views/front/MyForum.vue'), },
        { path: 'forum', component: () => import('@/views/front/Forum.vue'), },
        { path: 'forumDetail', component: () => import('@/views/front/ForumDetail.vue'), },
        { path: 'myComment', component: () => import('@/views/front/MyComment.vue'), },
        { path: 'myCollect', component: () => import('@/views/front/MyCollect.vue'), },
      ]
    },
    { path: '/login', component: () => import('@/views/Login.vue') },
    { path: '/register', component: () => import('@/views/Register.vue') },
    { path: '/404', component: () => import('@/views/404.vue') },
    { path: '/:pathMatch(.*)', redirect: '/404' }
  ]
})

export default router
