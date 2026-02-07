package com.mytest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {


    @RequestMapping("/")
    public String mainPage() {
        return "main"; 
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        
        return "login"; 
    }
}