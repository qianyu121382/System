package com.example.controller;

import com.example.common.Result;
import com.example.entity.VirtualGame;
import com.example.service.VirtualGameService;
import com.github.pagehelper.PageInfo;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 前端请求接口
 */
@RestController
@RequestMapping("/virtualGame")
public class VirtualGameController
{

    @Resource
    private VirtualGameService virtualGameService;

    /**
     * 新增
     */
    @PostMapping("/add")
    public Result add(@RequestBody VirtualGame virtualGame) {
        virtualGameService.add(virtualGame);
        return Result.success();
    }

    /**
     * 修改
     */
    @PutMapping("/update")
    public Result update(@RequestBody VirtualGame virtualGame) {
        virtualGameService.updateById(virtualGame);
        return Result.success();
    }

    /**
     * 单个删除
     */
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable Integer id) {
        virtualGameService.deleteById(id);
        return Result.success();
    }

    /**
     * 批量删除
     */
    @DeleteMapping("/delete/batch")
    public Result delete(@RequestBody List<Integer> ids) {
        virtualGameService.deleteBatch(ids);
        return Result.success();
    }

    /**
     * 单个查询
     */
    @GetMapping("/selectById/{id}")
    public Result selectById(@PathVariable Integer id) {
        VirtualGame virtualGame = virtualGameService.selectById(id);
        return Result.success(virtualGame);
    }

    /**
     * 查询所有
     */
    @GetMapping("/selectAll")
    public Result selectAll(VirtualGame virtualGame) {
        List<VirtualGame> list = virtualGameService.selectAll(virtualGame);
        return Result.success(list);
    }

    /**
     * 分页查询
     */
    @GetMapping("/selectPage")
    public Result selectPage(VirtualGame virtualGame,
                             @RequestParam(defaultValue = "1") Integer pageNum,
                             @RequestParam(defaultValue = "10") Integer pageSize) {
        PageInfo<VirtualGame> pageInfo = virtualGameService.selectPage(virtualGame, pageNum, pageSize);
        return Result.success(pageInfo);
    }

}
