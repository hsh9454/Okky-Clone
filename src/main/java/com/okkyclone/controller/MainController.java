package com.okkyclone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.domain.Criteria;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.BoardService;

@Controller
public class MainController {

	
	@Autowired
	private BoardService boardService;

	@Autowired
	private BoardService service;

	@RequestMapping("/")
	public String mainPage(Criteria cri, Model model) {
		cri.setAmount(10);
		List<BoardVO> allList = boardService.getList(cri);
		if (allList != null && !allList.isEmpty()) {
			int totalSize = allList.size();
			model.addAttribute("leftList", allList.subList(0, Math.min(totalSize, 5)));
			if (totalSize > 5) {
				model.addAttribute("rightList", allList.subList(5, Math.min(totalSize, 10)));
			}
		}
		return "main";
	}

	@GetMapping("/register")
	public String register() {
		return "board/register";
	}

	@PostMapping("/register")
	public String register(BoardVO board, HttpSession session) {
		MemberVO loginUser = (MemberVO) session.getAttribute("user");
		if (loginUser == null) {
			return "redirect:/member/login";
		}
		board.setWriter(loginUser.getUserid());
		service.register(board);
		return "redirect:/";
	}
	
	@GetMapping("/main")
	public void main(@RequestParam(value = "type", required = false, defaultValue = "daily") String type, Model model){
		model.addAttribute("boardList", service.getList());
		model.addAttribute("techList1", service.getTechList()); 
		model.addAttribute("popularList", service.getPopularList(type));
		model.addAttribute("currentType", type);
	}
	
	@GetMapping(value = "/main/data", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<BoardVO> getMainData(@RequestParam("type") String type) {
	    return service.getPopularList(type);
	}
	
}