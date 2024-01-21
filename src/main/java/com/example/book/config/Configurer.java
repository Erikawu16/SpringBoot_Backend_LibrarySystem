package com.example.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
@Configuration
public class Configurer implements WebMvcConfigurer {
    @Bean
    public CorsFilter corsFilter() {
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);   // 可选字段，表示是否允许发送Cookie,true表示允许
        config.addAllowedOrigin("http://localhost:8081");   // 必填字段，"*"表示接受任意域名的请求
        config.addAllowedHeader("*");   // 可选字段，允许CORS请求额外发送的头信息字段
        config.addAllowedMethod("*");   // 必填字段，允许CORS请求使用的HTTP方法, "*"表示全部方法
        config.setMaxAge(3600L);    // 可选字段，用来指定预检请求的有效期，单位为秒。在有效期间，不用发出另一条预检请求
        source.registerCorsConfiguration("/**", config);    // 必填字段，"/**"表示请求路径是多级，"/*/*"表示请求路径是两级
        return new CorsFilter(source);
    }
}