package com.okkyclone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; 
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.service.BoardService;

@Controller
public class MainController {
    

	@GetMapping("/register")
	public String register() {
		return "board/register";
	}
	
    @Autowired
    private BoardService boardService; 

    @RequestMapping("/")
    public String mainPage(Model model) { 
        model.addAttribute("boardList", boardService.getList());         
        return "main"; 
    }
    
    @PostMapping("/register")
    public String register(BoardVO board) {
    	 boardService.register(board);
    	return "redirect:/";
    }
    
    
}