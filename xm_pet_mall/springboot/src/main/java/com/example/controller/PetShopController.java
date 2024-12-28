package com.example.controller;

import com.example.common.Result;
import com.example.entity.PetShop;
import com.example.service.PetShopService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/petShop")
public class PetShopController {

    @Resource
    private PetShopService petShopService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody PetShop petShop) {
        petShopService.add(petShop);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody PetShop petShop) {
        petShopService.updateById(petShop);
        return Result.success();
    }

    @PutMapping("/identify")
    public Result identify(@RequestBody PetShop petShop) {
        petShopService.identify(petShop);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        petShopService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        petShopService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        PetShop petShop = petShopService.selectById(id);
        return Result.success(petShop);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(PetShop petShop) {
        List<PetShop> list = petShopService.selectAll(petShop);
        return Result.success(list);
    }

    @GetMapping("/selectRank")
    public Result selectRank() {
        List<PetShop> list = petShopService.selectRank();
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(PetShop petShop,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<PetShop> pageInfo = petShopService.selectPage(petShop, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
