package com.codecrab.filmjur.controller;

import com.codecrab.filmjur.entity.Hello;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RequestController {

    @ResponseBody @GetMapping(path = "/hello")
    public Hello requestHello(){
        return new Hello(1, "Master");
    }
}
