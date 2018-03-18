package com.codecrab.filmjur.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;

@Controller
public class LocalTimeController {

    @ResponseBody @GetMapping(path = "getServerTime")
    public String getServerTime(){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        return timestamp.toString();
    }
}
