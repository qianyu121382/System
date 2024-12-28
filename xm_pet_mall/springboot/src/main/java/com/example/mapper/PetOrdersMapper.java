package com.example.mapper;

import com.example.entity.PetOrders;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PetOrdersMapper {

    int insert(PetOrders petOrders);

    void updateById(PetOrders petOrders);

    void deleteById(Integer id);

    @Select("select * from `pet_orders` where id = #{id}")
    PetOrders selectById(Integer id);

    List<PetOrders> selectAll(PetOrders petOrders);

    @Select("select ifnull(sum(price), 0) from `pet_orders` where shop_id = #{shopId} and status = '已完成'")
    Double selectByShopId(Integer shopId);
}
