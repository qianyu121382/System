package com.example.mapper;

import com.example.entity.VirtualGameShop;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface VirtualGameShopMapper
{

    int insert(VirtualGameShop virtualGameShop);

    void updateById(VirtualGameShop virtualGameShop);

    void deleteById(Integer id);

    @Select("select * from `virtualGame_shop` where id = #{id}")
    VirtualGameShop selectById(Integer id);

    List<VirtualGameShop> selectAll(VirtualGameShop virtualGameShop);

    @Select("select * from `virtualGame_shop` where username = #{username}")
    VirtualGameShop selectByUsername(String username);
}
