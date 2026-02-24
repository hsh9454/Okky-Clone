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
import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.BoardService;

@Controller
public class MainController {

	@Autowired
	private BoardService service;

	@RequestMapping("/")
	public String mainPage(@RequestParam(value = "type", required = false, defaultValue = "daily") String type,
			Model model) {

		List<BoardVO> boardList = service.getCategoryList("전체");

		long now = System.currentTimeMillis();
		if (boardList != null) {
			for (BoardVO board : boardList) {
				if (now - board.getRegdate().getTime() < (1000 * 60 * 60 * 24)) {
					board.setIsNew(true);
				}
			}
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("techList1", service.getTechList());

		List<BoardVO> popularList = service.getPopularList(type);
		if (popularList != null) {
			for (BoardVO board : popularList) {
				if (now - board.getRegdate().getTime() < (1000 * 60 * 60 * 24)) {
					board.setIsNew(true);
				}
			}
		}
		if (popularList != null && !popularList.isEmpty()) {
			int half = (int) Math.ceil(popularList.size() / 2.0);
			model.addAttribute("leftList", popularList.subList(0, half));
			model.addAttribute("rightList", popularList.subList(half, popularList.size()));
		}
		model.addAttribute("currentType", type);
		return "main";
	}

	@GetMapping(value = "/main/data", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<BoardVO> getMainData(@RequestParam("type") String type) {
		List<BoardVO> list = service.getPopularList(type);
		long now = System.currentTimeMillis();
		if (list != null) {
			for (BoardVO board : list) {
				if (now - board.getRegdate().getTime() < (1000 * 60 * 60 * 24)) {
					board.setIsNew(true);
				}
			}
		}
		return list;
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