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
import java.util.List;

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
}