package com.news;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan("com.news") // 必须加！扫描Controller、Service
@MapperScan("com.news.dao")
public class Application000 {
    public static void main(String[] args) {
        SpringApplication.run(Application000.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ 启动成功   ლ(´ڡ`ლ)ﾞ");
    }
}