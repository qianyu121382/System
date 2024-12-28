package com.example.service;

import com.example.entity.PetType;
import com.example.mapper.PetTypeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class PetTypeService {

    @Resource
    private PetTypeMapper petTypeMapper;

    public void add(PetType petType) {
        petTypeMapper.insert(petType);
    }

    public void updateById(PetType petType) {
        petTypeMapper.updateById(petType);
    }

    public void deleteById(Integer id) {
        petTypeMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            petTypeMapper.deleteById(id);
        }
    }

    public PetType selectById(Integer id) {
        return petTypeMapper.selectById(id);
    }

    public List<PetType> selectAll(PetType petType) {
        return petTypeMapper.selectAll(petType);
    }

    public PageInfo<PetType> selectPage(PetType petType, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<PetType> list = petTypeMapper.selectAll(petType);
        return PageInfo.of(list);
    }

}
