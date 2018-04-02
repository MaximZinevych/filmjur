package com.codecrab.filmjur.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Timestamp;

import static org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE;

@RestController
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

    @GetMapping(path = "/time/", produces = "application/json")
    public Timestamp getServerTime(){
        return new Timestamp(System.currentTimeMillis());
    }
}
