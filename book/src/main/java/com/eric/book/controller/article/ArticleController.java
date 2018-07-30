package com.eric.book.controller.article;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author:
 * @Description:
 * @Date: 11:26 2018/7/30
 */
@Controller
public class ArticleController {
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }
}
