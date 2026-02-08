package com.mytest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.mytest.domain.MemberVO;
import com.mytest.mapper.MemberMapper;

@Controller
public class MainController {
   
    @Autowired
    private MemberMapper mapper;

    @RequestMapping("/")
    public String mainPage() {
        return "main"; 
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        return "login";
    }

    @PostMapping("/login")
    public String loginPROCESS(MemberVO vo) {
        System.out.println("=== 로그인 시도 ID: " + vo.getId() + " ===");
        
        MemberVO loginUser = mapper.login(vo);
        
        if(loginUser != null) {
            System.out.println("로그인 성공! 환영합니다, " + loginUser.getName() + "님!");
        } else {
            System.out.println("로그인 실패... 정보를 확인하세요.");
        }
        
        return "redirect:/"; 
    }
}