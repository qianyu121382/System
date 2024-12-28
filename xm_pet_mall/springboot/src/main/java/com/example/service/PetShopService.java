package com.example.service;

import cn.hutool.core.util.ObjectUtil;
import com.example.common.Constants;
import com.example.common.enums.ResultCodeEnum;
import com.example.common.enums.RoleEnum;
import com.example.entity.*;
import com.example.exception.CustomException;
import com.example.mapper.GoodsOrdersMapper;
import com.example.mapper.PetOrdersMapper;
import com.example.mapper.PetShopMapper;
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
public class PetShopService {

    @Resource
    private PetShopMapper petShopMapper;
    @Resource
    private PetService petService;
    @Resource
    private PetOrdersMapper petOrdersMapper;
    @Resource
    private GoodsOrdersMapper goodsOrdersMapper;

    public void add(PetShop petShop) {
        PetShop dbPetShop = petShopMapper.selectByUsername(petShop.getUsername());
        if (ObjectUtil.isNotNull(dbPetShop)) {
            throw new CustomException(ResultCodeEnum.USER_EXIST_ERROR);
        }
        if (ObjectUtil.isEmpty(petShop.getPassword())) {
            petShop.setPassword(Constants.USER_DEFAULT_PASSWORD);
        }
        if (ObjectUtil.isEmpty(petShop.getName())) {
            petShop.setName(petShop.getUsername());
        }
        petShop.setRole(RoleEnum.PETSHOP.name());
        petShop.setStatus("待提交");
        petShopMapper.insert(petShop);
    }

    public void updateById(PetShop petShop) {
        petShopMapper.updateById(petShop);
    }

    public void deleteById(Integer id) {
        petShopMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            petShopMapper.deleteById(id);
        }
    }

    public PetShop selectById(Integer id) {
        return petShopMapper.selectById(id);
    }

    public List<PetShop> selectAll(PetShop petShop) {
        return petShopMapper.selectAll(petShop);
    }

    public List<PetShop> selectRank() {
        PetShop params = new PetShop();
        params.setStatus("审核通过");
        List<PetShop> petShopList = petShopMapper.selectAll(params);
        for (PetShop petShop : petShopList) {
            Double petSum = petOrdersMapper.selectByShopId(petShop.getId());
            Double goodsSum = goodsOrdersMapper.selectByShopId(petShop.getId());
            Double sum = petSum + goodsSum;
            petShop.setSum(sum);
        }
        return petShopList.stream().sorted(Comparator.comparing(PetShop::getSum, Comparator.reverseOrder())).limit(10).toList();
    }

    public PageInfo<PetShop> selectPage(PetShop petShop, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<PetShop> list = petShopMapper.selectAll(petShop);
        for (PetShop shop : list) {
            Pet pet = new Pet();
            pet.setShopId(shop.getId());
            // 根据店铺id  查出这个店里面所有的宠物信息
            List<Pet> petList = petService.selectAll(pet);
            petList = petList.stream().limit(4).toList();
            shop.setPetList(petList);
        }
        return PageInfo.of(list);
    }

    /**
     * 登录
     */
    public PetShop login(Account account) {
        PetShop dbPetShop = petShopMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbPetShop)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!dbPetShop.getPassword().equals(account.getPassword())) {
            throw new CustomException(ResultCodeEnum.USER_ACCOUNT_ERROR);
        }
        // 生成token
        String token = TokenUtils.createToken(dbPetShop.getId() + "-" + dbPetShop.getRole(), dbPetShop.getPassword());
        dbPetShop.setToken(token);
        return dbPetShop;
    }

    /**
     * 修改密码
     */
    public void updatePassword(Account account) {
        PetShop dbPetShop = petShopMapper.selectByUsername(account.getUsername());
        if (ObjectUtil.isNull(dbPetShop)) {
            throw new CustomException(ResultCodeEnum.USER_NOT_EXIST_ERROR);
        }
        if (!account.getPassword().equals(dbPetShop.getPassword())) {
            throw new CustomException(ResultCodeEnum.PARAM_PASSWORD_ERROR);
        }
        dbPetShop.setPassword(account.getNewPassword());
        petShopMapper.updateById(dbPetShop);
    }

    /**
     * 认证信息
     */
    public void identify(PetShop petShop) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (RoleEnum.PETSHOP.name().equals(currentUser.getRole())) {
            // status = 待审核
            petShop.setStatus("待审核");
        }
        petShopMapper.updateById(petShop);
    }

}
