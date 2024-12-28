package com.example.mapper;

import com.example.entity.Pet;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface PetMapper {

    int insert(Pet pet);

    void updateById(Pet pet);

    void deleteById(Integer id);

    Pet selectById(Integer id);

    List<Pet> selectAll(Pet pet);

}
