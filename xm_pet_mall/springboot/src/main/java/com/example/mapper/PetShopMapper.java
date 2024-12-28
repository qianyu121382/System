package com.example.mapper;

import com.example.entity.PetShop;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PetShopMapper {

    int insert(PetShop petShop);

    void updateById(PetShop petShop);

    void deleteById(Integer id);

    @Select("select * from `pet_shop` where id = #{id}")
    PetShop selectById(Integer id);

    List<PetShop> selectAll(PetShop petShop);

    @Select("select * from `pet_shop` where username = #{username}")
    PetShop selectByUsername(String username);
}
