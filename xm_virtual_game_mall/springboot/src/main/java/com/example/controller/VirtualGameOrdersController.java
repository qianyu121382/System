package com.example.controller;

import com.example.common.Result;
import com.example.entity.VirtualGameOrders;
import com.example.service.VirtualGameOrdersService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/virtual_gameOrders")
public class VirtualGameOrdersController
{

    @Resource
    private VirtualGameOrdersService virtualGameOrdersService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody VirtualGameOrders virtualGameOrders) {
        virtualGameOrdersService.add(virtualGameOrders);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody VirtualGameOrders virtualGameOrders) {
        virtualGameOrdersService.updateById(virtualGameOrders);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        virtualGameOrdersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        virtualGameOrdersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        VirtualGameOrders virtualGameOrders = virtualGameOrdersService.selectById(id);
        return Result.success(virtualGameOrders);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(VirtualGameOrders virtualGameOrders) {
        List<VirtualGameOrders> list = virtualGameOrdersService.selectAll(virtualGameOrders);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(VirtualGameOrders virtualGameOrders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<VirtualGameOrders> pageInfo = virtualGameOrdersService.selectPage(virtualGameOrders, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
