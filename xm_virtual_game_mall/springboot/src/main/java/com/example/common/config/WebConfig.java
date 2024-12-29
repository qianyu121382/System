package com.example.common.config;

import jakarta.annotation.Resource;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Resource
    private JWTInterceptor jwtInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(jwtInterceptor).addPathPatterns("/**")
                .excludePathPatterns("/")
                .excludePathPatterns("/login", "/register", "/files/**")
                .excludePathPatterns("/slideshow/selectAll", "/virtual_game/selectAll", "/goods/selectAll", "/virtual_gameShop/selectRank",
                        "/address/selectAll", "/virtual_game/selectById/**", "/virtual_gameShop/selectById/**",
                        "/virtual_game/selectPage", "/goods/selectPage", "/virtual_gameShop/selectPage", "/virtual_gameType/selectAll", "/goodsType/selectAll",
                        "/forum/selectPage", "/comment/selectTree/**", "/forum/updateViewCount/**", "/comment/selectCount/**",
                        "/forum/selectById/**")
        ;
    }

}
