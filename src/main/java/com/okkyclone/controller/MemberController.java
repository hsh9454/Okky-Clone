package com.okkyclone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.MemberService;

@Controller
@RequestMapping("/member/*") 
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/login")
    public void loginPage() {
    }

    @PostMapping("/login")
    public String loginPROCESS(MemberVO vo) {
        System.out.println("=== MemberController 로그인 시도: " + vo.getId() + " ===");
        
        MemberVO loginUser = memberService.login(vo);
        
        if(loginUser != null) {
            System.out.println("로그인 성공! 환영합니다, " + loginUser.getName() + "님!");
        } else {
            System.out.println("로그인 실패!");
        }
        
        return "redirect:/";
    }
}