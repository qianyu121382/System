package com.example.service;

import com.example.common.enums.RoleEnum;
import com.example.entity.Account;
import com.example.entity.Collect;
import com.example.entity.VirtualGame;
import com.example.mapper.CollectMapper;
import com.example.mapper.VirtualGameMapper;
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
public class VirtualGameService
{

    @Resource
    private VirtualGameMapper virtualGameMapper;
    @Resource
    CollectMapper collectMapper;

    public void add(VirtualGame virtualGame) {
        virtualGameMapper.insert(virtualGame);
    }

    public void updateById(VirtualGame virtualGame) {
        virtualGameMapper.updateById(virtualGame);
    }

    public void deleteById(Integer id) {
        virtualGameMapper.deleteById(id);
    }

    public void deleteBatch(List<Integer> ids) {
        for (Integer id : ids) {
            virtualGameMapper.deleteById(id);
        }
    }

    public VirtualGame selectById(Integer id) {
        VirtualGame virtualGame = virtualGameMapper.selectById(id);
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser != null) {
            Collect collect = collectMapper.selectByFidAndUser(id, currentUser.getId());
            virtualGame.setHasCollect(collect != null);
        }
        return virtualGame;
    }

    public List<VirtualGame> selectAll(VirtualGame virtualGame) {
        return virtualGameMapper.selectAll(virtualGame);
    }

    public PageInfo<VirtualGame> selectPage(VirtualGame virtualGame, Integer pageNum, Integer pageSize) {
        Account currentUser = TokenUtils.getCurrentUser();
        if (currentUser != null && RoleEnum.PETSHOP.name().equals(currentUser.getRole())) {
            virtualGame.setShopId(currentUser.getId());
        }
        PageHelper.startPage(pageNum, pageSize);
        List<VirtualGame> list = virtualGameMapper.selectAll(virtualGame);
        return PageInfo.of(list);
    }

}
