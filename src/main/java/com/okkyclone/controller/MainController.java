package com.okkyclone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // 데이터 바구니 임포트
import org.springframework.web.bind.annotation.RequestMapping;

import com.okkyclone.service.BoardService;

@Controller
public class MainController {

    @Autowired
    private BoardService boardService; 

    @RequestMapping("/")
    public String mainPage(Model model) { 
        model.addAttribute("boardList", boardService.getList());         
        return "main"; 
    }
}