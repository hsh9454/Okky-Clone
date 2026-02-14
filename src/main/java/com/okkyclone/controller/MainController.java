package com.okkyclone.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.service.BoardService;
import com.okkyclone.domain.MemberVO;  
import com.okkyclone.domain.Criteria;
@Controller
public class MainController {  
	
    @Autowired
    private BoardService boardService; 
    
    @Autowired
    private BoardService service;
	
	@RequestMapping("/")
    public String mainPage(Criteria cri, Model model) { 
        model.addAttribute("boardList", boardService.getList(cri));         
        return "main"; 
    }

	@GetMapping("/register")
	public String register() {
		return "board/register";
	}
	
	@PostMapping("/register")
    public String register(BoardVO board, HttpSession session) {
    	MemberVO loginUser = (MemberVO) session.getAttribute("user");
    	 if(loginUser == null) {
    		 return "redirect:/member/login";
    	 }
    	 board.setWriter(loginUser.getUserid());
    	 service.register(board);
    	 return "redirect:/";
    }
} 