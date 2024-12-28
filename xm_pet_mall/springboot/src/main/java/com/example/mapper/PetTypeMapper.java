package com.example.mapper;

import com.example.entity.PetType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PetTypeMapper {

    int insert(PetType petType);

    void updateById(PetType petType);

    void deleteById(Integer id);

    @Select("select * from `pet_type` where id = #{id}")
    PetType selectById(Integer id);

    List<PetType> selectAll(PetType petType);

}
