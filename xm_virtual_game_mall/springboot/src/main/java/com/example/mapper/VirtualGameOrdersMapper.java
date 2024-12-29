package com.example.mapper;

import com.example.entity.VirtualGameOrders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface VirtualGameOrdersMapper
{

    int insert(VirtualGameOrders virtualGameOrders);

    void updateById(VirtualGameOrders virtualGameOrders);

    void deleteById(Integer id);

    @Select("select * from `virtual_game_orders` where id = #{id}")
    VirtualGameOrders selectById(Integer id);

    List<VirtualGameOrders> selectAll(VirtualGameOrders virtualGameOrders);

    @Select("select ifnull(sum(price), 0) from `virtual_game_orders` where shop_id = #{shopId} and status = '已完成'")
    Double selectByShopId(Integer shopId);
}
