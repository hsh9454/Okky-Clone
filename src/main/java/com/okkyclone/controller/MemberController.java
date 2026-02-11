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

  
    @GetMapping("/join")
    public void joinPage() {
        System.out.println("=== 회원가입 페이지로 이동 ===");
    }
    
 
    @PostMapping("/join")
    public String joinProcess(MemberVO vo) {
        System.out.println("=== 회원가입 시도 아이디: " + vo.getUserid() + " ===");
        memberService.join(vo);
        return "redirect:/member/login";
    }
    

    @GetMapping("/login")
    public void loginPage() {
        System.out.println("=== 로그인 페이지로 이동 ===");
    }


    @PostMapping("/login")
    public String loginPROCESS(MemberVO vo, javax.servlet.http.HttpSession session) {
        System.out.println("=== 로그인 시도 아이디: " + vo.getUserid() + " ===");
        
        MemberVO loginUser = memberService.login(vo);        
        
        if(loginUser != null) {
           
            System.out.println("로그인 성공! 환영합니다!"); 
            session.setAttribute("user", loginUser);
            return "redirect:/";
        } else {
            System.out.println("로그인 실패!");
            return "redirect:/member/login?error=y";
        }      
    }   
    
    @GetMapping("/logout")
    public String logout(javax.servlet.http.HttpSession session) {
        session.invalidate();
        System.out.println("=== 로그아웃 완료 ===");
        return "redirect:/";
    }
}