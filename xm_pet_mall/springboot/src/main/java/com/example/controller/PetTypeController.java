package com.example.controller;

import com.example.common.Result;
import com.example.entity.PetType;
import com.example.service.PetTypeService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/petType")
public class PetTypeController {

    @Resource
    private PetTypeService petTypeService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody PetType petType) {
        petTypeService.add(petType);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody PetType petType) {
        petTypeService.updateById(petType);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        petTypeService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        petTypeService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        PetType petType = petTypeService.selectById(id);
        return Result.success(petType);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(PetType petType) {
        List<PetType> list = petTypeService.selectAll(petType);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(PetType petType,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<PetType> pageInfo = petTypeService.selectPage(petType, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
