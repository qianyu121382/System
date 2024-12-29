package com.example.mapper;

import com.example.entity.VirtualGameType;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface VirtualGameTypeMapper
{

    int insert(VirtualGameType virtualGameType);

    void updateById(VirtualGameType virtualGameType);

    void deleteById(Integer id);

    @Select("select * from `virtual_game_type` where id = #{id}")
    VirtualGameType selectById(Integer id);

    List<VirtualGameType> selectAll(VirtualGameType virtualGameType);

}
