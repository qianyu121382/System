package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Address;
import com.example.entity.VirtualGame;
import com.example.entity.VirtualGameOrders;
import com.example.exception.CustomException;
import com.example.mapper.VirtualGameOrdersMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 业务层方法
 */
@Service
public class VirtualGameOrdersService
{

    @Resource
    private VirtualGameOrdersMapper virtualGameOrdersMapper;
    @Resource
    private VirtualGameService virtualGameService;
    @Resource
    private AddressService addressService;
    @Resource
    private UserService userService;

    @Transactional
    public void add(VirtualGameOrders virtualGameOrders) {
        // 判断库存是否足够
        Integer virtualGameId = virtualGameOrders.getVirtualGameId();
        VirtualGame virtualGame = virtualGameService.selectById(virtualGameId);
        if (virtualGame.getStore() < 1) {  // 库存不足
            throw new CustomException("500", "宠物剩余数量不足");
        }
        Account currentUser = TokenUtils.getCurrentUser();
        // 判断账户余额是否充足
        if (currentUser.getAccount() == null || currentUser.getAccount().compareTo(virtualGame.getPrice()) < 0) {
            throw new CustomException("500", "账户余额不足");
        }
        // 扣减库存
        virtualGame.setStore(virtualGame.getStore() - 1);
        virtualGameService.updateById(virtualGame);
        String orderNo = DateUtil.format(new Date(), "yyyyMMdd") + String.valueOf(System.currentTimeMillis()).substring(8);
        virtualGameOrders.setOrderNo(orderNo);

        virtualGameOrders.setUserId(currentUser.getId());
        virtualGameOrders.setVirtualGameName(virtualGame.getName());
        virtualGameOrders.setVirtualGameImg(virtualGame.getImg());
        virtualGameOrders.setPrice(virtualGame.getPrice());
        // 设置收货地址信息
        if (virtualGameOrders.getAddressId() != null) {
            Address address = addressService.selectById(virtualGameOrders.getAddressId());
            virtualGameOrders.setPickupUser(address.getName());
            virtualGameOrders.setPickupAddress(address.getAddress());
            virtualGameOrders.setPickupPhone(address.getPhone());
        }
        virtualGameOrders.setStatus("待支付");
        virtualGameOrders.setTime(DateUtil.now());
        virtualGameOrders.setId(null);  // 这么做是为了防止再次购买的时候出现了id，导出数据库插入异常
        virtualGameOrdersMapper.insert(virtualGameOrders);
    }

    @Transactional
    public void updateById(VirtualGameOrders virtualGameOrders) {
        Account currentUser = TokenUtils.getCurrentUser();
        Integer virtualGameId = virtualGameOrders.getVirtualGameId();
        VirtualGame virtualGame = virtualGameService.selectById(virtualGameId);
        // 用户取消订单
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            if ("已取消".equals(virtualGameOrders.getStatus())) {
                virtualGame.setStore(virtualGame.getStore() + 1);
                // 退还库存
                virtualGameService.updateById(virtualGame);
            } else if ("待发货".equals(virtualGameOrders.getStatus())) {
                userService.updateAccountById(-virtualGameOrders.getPrice().doubleValue(), currentUser.getId());
            }
        }
        virtualGameOrdersMapper.updateById(virtualGameOrders);
    }

    public void deleteById(Integer id) {
        virtualGameOrdersMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            virtualGameOrdersMapper.deleteById(id);
        }
    }

    public VirtualGameOrders selectById(Integer id) {
        return virtualGameOrdersMapper.selectById(id);
    }

    public List<VirtualGameOrders> selectAll(VirtualGameOrders virtualGameOrders) {
        return virtualGameOrdersMapper.selectAll(virtualGameOrders);
    }

    public PageInfo<VirtualGameOrders> selectPage(VirtualGameOrders virtualGameOrders, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            virtualGameOrders.setUserId(currentUser.getId());
        }
        if (RoleEnum.GAMESHOP.name().equals(currentUser.getRole())) {
            virtualGameOrders.setShopId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<VirtualGameOrders> list = virtualGameOrdersMapper.selectAll(virtualGameOrders);
        return PageInfo.of(list);
    }

}
