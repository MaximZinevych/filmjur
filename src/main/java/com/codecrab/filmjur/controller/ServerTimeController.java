package com.codecrab.filmjur.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;

@Controller
@RequestMapping("/api")
@Api(value = "servertime", description = "Returns server current time")
public class ServerTimeController {

    @ApiOperation(value = "Get current server time")
    @ApiResponses(value = {
            @ApiResponse(code = 200, message = "Successfully retrieved datetime"),
            @ApiResponse(code = 401, message = "You are not authorized to viw the resource"),
            @ApiResponse(code = 403, message = "Accessing the resource you were trying to reach is forbidden"),
            @ApiResponse(code = 404, message = "The resource you were trying to reach is not found")
    })

    @ResponseBody @GetMapping(path = "getServerTime")
    public String getServerTime(){
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        return timestamp.toString();
    }
}
