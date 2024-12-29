package com.example.service;

import com.example.entity.VirtualGameType;
import com.example.mapper.VirtualGameTypeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 业务层方法
 */
@Service
public class VirtualGameTypeService
{

    @Resource
    private VirtualGameTypeMapper virtualGameTypeMapper;

    public void add(VirtualGameType virtualGameType) {
        virtualGameTypeMapper.insert(virtualGameType);
    }

    public void updateById(VirtualGameType virtualGameType) {
        virtualGameTypeMapper.updateById(virtualGameType);
    }

    public void deleteById(Integer id) {
        virtualGameTypeMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            virtualGameTypeMapper.deleteById(id);
        }
    }

    public VirtualGameType selectById(Integer id) {
        return virtualGameTypeMapper.selectById(id);
    }

    public List<VirtualGameType> selectAll(VirtualGameType virtualGameType) {
        return virtualGameTypeMapper.selectAll(virtualGameType);
    }

    public PageInfo<VirtualGameType> selectPage(VirtualGameType virtualGameType, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<VirtualGameType> list = virtualGameTypeMapper.selectAll(virtualGameType);
        return PageInfo.of(list);
    }

}
