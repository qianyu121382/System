package com.example.controller;

import com.example.common.Result;
import com.example.entity.VirtualGameShop;
import com.example.service.VirtualGameShopService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/virtualGameShop")
public class VirtualGameShopController
{

    @Resource
    private VirtualGameShopService virtualGameShopService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody VirtualGameShop virtualGameShop) {
        virtualGameShopService.add(virtualGameShop);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody VirtualGameShop virtualGameShop) {
        virtualGameShopService.updateById(virtualGameShop);
        return Result.success();
    }

    @PutMapping("/identify")
    public Result identify(@RequestBody VirtualGameShop virtualGameShop) {
        virtualGameShopService.identify(virtualGameShop);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        virtualGameShopService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        virtualGameShopService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        VirtualGameShop virtualGameShop = virtualGameShopService.selectById(id);
        return Result.success(virtualGameShop);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(VirtualGameShop virtualGameShop) {
        List<VirtualGameShop> list = virtualGameShopService.selectAll(virtualGameShop);
        return Result.success(list);
    }

    @GetMapping("/selectRank")
    public Result selectRank() {
        List<VirtualGameShop> list = virtualGameShopService.selectRank();
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(VirtualGameShop virtualGameShop,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<VirtualGameShop> pageInfo = virtualGameShopService.selectPage(virtualGameShop, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
