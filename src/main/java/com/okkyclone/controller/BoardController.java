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
import com.okkyclone.domain.Criteria;
import com.okkyclone.service.BoardService;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, 
	                 @RequestParam(value="category", required=false) String category, 
	                 Model model) {
	    
	    log.info("접속 카테고리: " + category);
	    if (category == null || category.isEmpty()) {
	        model.addAttribute("list", service.getList(cri));
	    } else {
	        model.addAttribute("list", service.getListWithCategory(cri, category));
	    }

	    model.addAttribute("curCategory", category);
	}

	@GetMapping("/get")
	public String get(@RequestParam("bno") Long bno, Criteria cri, Model model) {
		model.addAttribute("board", service.get(bno));
		model.addAttribute("list", service.getList(cri));
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

	@PostMapping("/register")
	public String register(BoardVO board, HttpSession session, RedirectAttributes rttr) {
	    com.okkyclone.domain.MemberVO user = (com.okkyclone.domain.MemberVO) session.getAttribute("user");	    
	    if (user == null) {
	        return "redirect:/member/login";
	    }	    
	    board.setWriter(user.getUserid()); 	    
	    log.info("register (writer 세팅 완료): " + board);      	    
	    service.register(board);	    
	    rttr.addFlashAttribute("result", board.getBno());
	    return "redirect:/board/list?cat_id=" + board.getCat_id();
	}
}
