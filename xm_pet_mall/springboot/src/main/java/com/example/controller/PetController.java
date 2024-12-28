package com.example.controller;

import com.example.common.Result;
import com.example.entity.Pet;
import com.example.service.PetService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/pet")
public class PetController {

    @Resource
    private PetService petService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody Pet pet) {
        petService.add(pet);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody Pet pet) {
        petService.updateById(pet);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        petService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        petService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        Pet pet = petService.selectById(id);
        return Result.success(pet);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(Pet pet) {
        List<Pet> list = petService.selectAll(pet);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(Pet pet,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<Pet> pageInfo = petService.selectPage(pet, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
