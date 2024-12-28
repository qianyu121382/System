package com.example.controller;

import com.example.common.Result;
import com.example.entity.PetOrders;
import com.example.service.PetOrdersService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/petOrders")
public class PetOrdersController {

    @Resource
    private PetOrdersService petOrdersService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody PetOrders petOrders) {
        petOrdersService.add(petOrders);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody PetOrders petOrders) {
        petOrdersService.updateById(petOrders);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        petOrdersService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        petOrdersService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        PetOrders petOrders = petOrdersService.selectById(id);
        return Result.success(petOrders);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(PetOrders petOrders) {
        List<PetOrders> list = petOrdersService.selectAll(petOrders);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(PetOrders petOrders,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<PetOrders> pageInfo = petOrdersService.selectPage(petOrders, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
