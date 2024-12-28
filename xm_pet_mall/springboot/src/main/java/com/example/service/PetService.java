package com.example.service;

import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Collect;
import com.example.entity.Pet;
import com.example.mapper.CollectMapper;
import com.example.mapper.PetMapper;
import com.example.utils.TokenUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class PetService {

    @Resource
    private PetMapper petMapper;
    @Resource
    CollectMapper collectMapper;

    public void add(Pet pet) {
        petMapper.insert(pet);
    }

    public void updateById(Pet pet) {
        petMapper.updateById(pet);
    }

    public void deleteById(Integer id) {
        petMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            petMapper.deleteById(id);
        }
    }

    public Pet selectById(Integer id) {
        Pet pet = petMapper.selectById(id);
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser != null) {
            Collect collect = collectMapper.selectByFidAndUser(id, currentUser.getId());
            pet.setHasCollect(collect != null);
        }
        return pet;
    }

    public List<Pet> selectAll(Pet pet) {
        return petMapper.selectAll(pet);
    }

    public PageInfo<Pet> selectPage(Pet pet, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser != null && RoleEnum.PETSHOP.name().equals(currentUser.getRole())) {
            pet.setShopId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<Pet> list = petMapper.selectAll(pet);
        return PageInfo.of(list);
    }

}
