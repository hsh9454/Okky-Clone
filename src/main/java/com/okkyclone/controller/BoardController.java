package com.okkyclone.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    @Autowired
    private BoardService service;
    
    @GetMapping("/list")
    public void list(Model model) {
        model.addAttribute("list", service.getList());
    }

    @GetMapping("/get")
    public String get(@RequestParam("bno") Long bno, Model model) {
        model.addAttribute("board", service.get(bno));
        return "board/get";
    }
    
    @GetMapping("/modify")
    public String modify(@RequestParam("bno") Long bno, Model model) {
        model.addAttribute("board", service.get(bno));
        return "board/modify";
    }        
      
    @PostMapping("/modify")
    public String modify(BoardVO board, RedirectAttributes rttr) {	
    	if (service.modify(board)) {
    		rttr.addFlashAttribute("result", "success");
    	}
    	return "redirect:/board/list";
    	}
    
    @GetMapping("/remove")
    public String remove(Long bno, RedirectAttributes rttr) {
    	if (service.remove(bno)) {
    		rttr.addFlashAttribute("result", "success");
    	}
    	return "redirect:/board/list";
    	}
    
    @GetMapping("/register")
    public void register() {       
    }
    }
