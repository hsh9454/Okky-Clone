package com.okkyclone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.okkyclone.domain.BoardVO;
import com.okkyclone.domain.Criteria;
import com.okkyclone.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;

	@GetMapping("/list")
	public void list(Criteria cri, @RequestParam(value = "category", required = false) String category, Model model) {

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

	@GetMapping("/main/categoryData")
	@ResponseBody
	public List<BoardVO> getCategoryData(
			@RequestParam(value = "category", required = false, defaultValue = "전체") String category) {
		System.out.println("컨트롤러 도착! 카테고리: " + category);

		try {
			List<BoardVO> list = service.getCategoryList(category);
			for (BoardVO board : list) {
				board.setIsNew(board.checkIsNew());
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@GetMapping("/group/{parentSlug}")
	public String getGroupList(@PathVariable("parentSlug") String parentSlug, Criteria cri, Model model) {

		model.addAttribute("list", service.getListByParent(parentSlug, cri));
		model.addAttribute("categoryName", parentSlug);
		return "board/list";
	}
}
