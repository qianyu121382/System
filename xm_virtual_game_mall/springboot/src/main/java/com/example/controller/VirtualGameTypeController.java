package com.example.controller;

import com.example.common.Result;
import com.example.entity.VirtualGameType;
import com.example.service.VirtualGameTypeService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/virtual_gameType")
public class VirtualGameTypeController
{

    @Resource
    private VirtualGameTypeService virtualGameTypeService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody VirtualGameType virtualGameType) {
        virtualGameTypeService.add(virtualGameType);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody VirtualGameType virtualGameType) {
        virtualGameTypeService.updateById(virtualGameType);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        virtualGameTypeService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        virtualGameTypeService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        VirtualGameType virtualGameType = virtualGameTypeService.selectById(id);
        return Result.success(virtualGameType);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(VirtualGameType virtualGameType) {
        List<VirtualGameType> list = virtualGameTypeService.selectAll(virtualGameType);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(VirtualGameType virtualGameType,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<VirtualGameType> pageInfo = virtualGameTypeService.selectPage(virtualGameType, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
