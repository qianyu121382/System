package com.example.service;

import cn.hutool.core.date.DateUtil;
import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Address;
import com.example.entity.Pet;
import com.example.entity.PetOrders;
import com.example.exception.CustomException;
import com.example.mapper.PetOrdersMapper;
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
public class PetOrdersService {

    @Resource
    private PetOrdersMapper petOrdersMapper;
    @Resource
    private PetService petService;
    @Resource
    private AddressService addressService;
    @Resource
    private UserService userService;

    @Transactional
    public void add(PetOrders petOrders) {
        // 判断库存是否足够
        Integer petId = petOrders.getPetId();
        Pet pet = petService.selectById(petId);
        if (pet.getStore() < 1) {  // 库存不足
            throw new CustomException("500", "宠物剩余数量不足");
        }
        Account currentUser = TokenUtils.getCurrentUser();
        // 判断账户余额是否充足
        if (currentUser.getAccount() == null || currentUser.getAccount().compareTo(pet.getPrice()) < 0) {
            throw new CustomException("500", "账户余额不足");
        }
        // 扣减库存
        pet.setStore(pet.getStore() - 1);
        petService.updateById(pet);
        String orderNo = DateUtil.format(new Date(), "yyyyMMdd") + String.valueOf(System.currentTimeMillis()).substring(8);
        petOrders.setOrderNo(orderNo);

        petOrders.setUserId(currentUser.getId());
        petOrders.setPetName(pet.getName());
        petOrders.setPetImg(pet.getImg());
        petOrders.setPrice(pet.getPrice());
        // 设置收货地址信息
        if (petOrders.getAddressId() != null) {
            Address address = addressService.selectById(petOrders.getAddressId());
            petOrders.setPickupUser(address.getName());
            petOrders.setPickupAddress(address.getAddress());
            petOrders.setPickupPhone(address.getPhone());
        }
        petOrders.setStatus("待支付");
        petOrders.setTime(DateUtil.now());
        petOrders.setId(null);  // 这么做是为了防止再次购买的时候出现了id，导出数据库插入异常
        petOrdersMapper.insert(petOrders);
    }

    @Transactional
    public void updateById(PetOrders petOrders) {
        Account currentUser = TokenUtils.getCurrentUser();
        Integer petId = petOrders.getPetId();
        Pet pet = petService.selectById(petId);
        // 用户取消订单
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            if ("已取消".equals(petOrders.getStatus())) {
                pet.setStore(pet.getStore() + 1);
                // 退还库存
                petService.updateById(pet);
            } else if ("待发货".equals(petOrders.getStatus())) {
                userService.updateAccountById(-petOrders.getPrice().doubleValue(), currentUser.getId());
            }
        }
        petOrdersMapper.updateById(petOrders);
    }

    public void deleteById(Integer id) {
        petOrdersMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            petOrdersMapper.deleteById(id);
        }
    }

    public PetOrders selectById(Integer id) {
        return petOrdersMapper.selectById(id);
    }

    public List<PetOrders> selectAll(PetOrders petOrders) {
        return petOrdersMapper.selectAll(petOrders);
    }

    public PageInfo<PetOrders> selectPage(PetOrders petOrders, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.USER.name().equals(currentUser.getRole())) {
            petOrders.setUserId(currentUser.getId());
        }
        if (RoleEnum.PETSHOP.name().equals(currentUser.getRole())) {
            petOrders.setShopId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<PetOrders> list = petOrdersMapper.selectAll(petOrders);
        return PageInfo.of(list);
    }

}
