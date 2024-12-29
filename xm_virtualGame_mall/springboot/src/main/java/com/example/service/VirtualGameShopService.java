package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.exception.CustomException;
import com.example.mapper.GoodsOrdersMapper;
import com.example.mapper.VirtualGameOrdersMapper;
import com.example.mapper.VirtualGameShopMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.Comparator;
import java.util.List;

/**
 * 业务层方法
 */
@Service
public class VirtualGameShopService
{

    @Resource
    private VirtualGameShopMapper virtualGameShopMapper;
    @Resource
    private VirtualGameService virtualGameService;
    @Resource
    private VirtualGameOrdersMapper virtualGameOrdersMapper;
    @Resource
    private GoodsOrdersMapper goodsOrdersMapper;

    public void add(VirtualGameShop virtualGameShop) {
        VirtualGameShop dbVirtualGameShop = virtualGameShopMapper.selectByUsername(virtualGameShop.getUsername());
        if (ObjectUtil.isNotNull(dbVirtualGameShop)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(virtualGameShop.getPassword())) {
            virtualGameShop.setPassword(Constants.USER_DEFAULT_PASSWORD);
        }
        if (ObjectUtil.isEmpty(virtualGameShop.getName())) {
            virtualGameShop.setName(virtualGameShop.getUsername());
        }
        virtualGameShop.setRole(RoleEnum.PETSHOP.name());
        virtualGameShop.setStatus("待提交");
        virtualGameShopMapper.insert(virtualGameShop);
    }

    public void updateById(VirtualGameShop virtualGameShop) {
        virtualGameShopMapper.updateById(virtualGameShop);
    }

    public void deleteById(Integer id) {
        virtualGameShopMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            virtualGameShopMapper.deleteById(id);
        }
    }

    public VirtualGameShop selectById(Integer id) {
        return virtualGameShopMapper.selectById(id);
    }

    public List<VirtualGameShop> selectAll(VirtualGameShop virtualGameShop) {
        return virtualGameShopMapper.selectAll(virtualGameShop);
    }

    public List<VirtualGameShop> selectRank() {
        VirtualGameShop params = new VirtualGameShop();
        params.setStatus("审核通过");
        List<VirtualGameShop> virtualGameShopList = virtualGameShopMapper.selectAll(params);
        for (VirtualGameShop virtualGameShop : virtualGameShopList) {
            Double virtualGameSum = virtualGameOrdersMapper.selectByShopId(virtualGameShop.getId());
            Double goodsSum = goodsOrdersMapper.selectByShopId(virtualGameShop.getId());
            Double sum = virtualGameSum + goodsSum;
            virtualGameShop.setSum(sum);
        }
        return virtualGameShopList.stream().sorted(Comparator.comparing(VirtualGameShop::getSum, Comparator.reverseOrder())).limit(10).toList();
    }

    public PageInfo<VirtualGameShop> selectPage(VirtualGameShop virtualGameShop, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<VirtualGameShop> list = virtualGameShopMapper.selectAll(virtualGameShop);
        for (VirtualGameShop shop : list) {
            VirtualGame virtualGame = new VirtualGame();
            virtualGame.setShopId(shop.getId());
            // 根据店铺id  查出这个店里面所有的宠物信息
            List<VirtualGame> virtualGameList = virtualGameService.selectAll(virtualGame);
            virtualGameList = virtualGameList.stream().limit(4).toList();
            shop.setPetList(virtualGameList);
        }
        return PageInfo.of(list);
    }

    /**
     * 登录
     */
    public VirtualGameShop login(Account account) {
        VirtualGameShop dbVirtualGameShop = virtualGameShopMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbVirtualGameShop)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!dbVirtualGameShop.getPassword().equals(account.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String token = TokenUtils.createToken(dbVirtualGameShop.getId() + "-" + dbVirtualGameShop.getRole(), dbVirtualGameShop.getPassword());
        dbVirtualGameShop.setToken(token);
        return dbVirtualGameShop;
    }

    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        VirtualGameShop dbVirtualGameShop = virtualGameShopMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbVirtualGameShop)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbVirtualGameShop.getPassword())) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        dbVirtualGameShop.setPassword(account.getNewPassword());
        virtualGameShopMapper.updateById(dbVirtualGameShop);
    }

    /**
     * 认证信息
     */
    public void identify(VirtualGameShop virtualGameShop) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.PETSHOP.name().equals(currentUser.getRole())) {
            // status = 待审核
            virtualGameShop.setStatus("待审核");
        }
        virtualGameShopMapper.updateById(virtualGameShop);
    }

}
