package com.example.mapper;

import com.example.entity.VirtualGame;

import java.util.List;

public interface VirtualGameMapper
{

    int insert(VirtualGame virtualGame);

    void updateById(VirtualGame virtualGame);

    void deleteById(Integer id);

    VirtualGame selectById(Integer id);

    List<VirtualGame> selectAll(VirtualGame virtualGame);

}
