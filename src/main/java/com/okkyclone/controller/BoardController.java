package com.okkyclone.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.okkyclone.domain.PageDTO;
import com.okkyclone.service.AdService;
import com.okkyclone.service.BoardService; 

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@GetMapping("/getCategoryList")
	@ResponseBody
	public List<Map<String, String>> getCategoryList(@RequestParam("group") String group) {
		log.info("�븯�쐞 移댄뀒怨좊━ �슂泥� - group: " + group);

		List<Map<String, String>> list = new ArrayList<>();
		
		if ("qna".equals(group)) {
            list.add(createMap("11", "湲곗닠"));
            list.add(createMap("12", "而ㅻ━�뼱"));
            list.add(createMap("13", "湲고�"));
        } else if ("knowledge".equals(group)) {
            list.add(createMap("21", "Tech �돱�뒪"));
            list.add(createMap("22", "�똻"));
            list.add(createMap("23", "移쇰읆"));
            list.add(createMap("24", "由щ럭"));
            list.add(createMap("25", "IT蹂대룄�옄猷�"));
        } else if ("community".equals(group)) {
            list.add(createMap("31", "�궗�뒗�뼐湲�"));
            list.add(createMap("32", "AI"));
            list.add(createMap("33", "�뿰遊됀룸떒媛�"));
            list.add(createMap("34", "痍⑥��깮"));
            list.add(createMap("35", "IT �젙梨낇넗濡�"));
            list.add(createMap("36", "�뵾�뱶諛�"));
        } else if ("event".equals(group)) {
            list.add(createMap("41", "IT �뻾�궗"));
            list.add(createMap("42", "�솉蹂는룰킅怨�"));
        }         
        return list; 
    }
	
	private Map<String, String> createMap(String id, String name) {
        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("name", name);
        return map;
    }
	
	@GetMapping("/write")
	public String writeForm(@RequestParam("group") String group,
			@RequestParam(value = "category", required = false) String category, Model model) {

		log.info("湲��벐湲� �뤌 �슂泥� - group: " + group + ", category: " + category);

		model.addAttribute("group", group);
		model.addAttribute("category", category);

		return "board/write";
	}

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;

	@Autowired
	private AdService adService;

	@GetMapping("/list")
	public void list(Criteria cri, @RequestParam(value = "category", required = false) String category,
			@RequestParam(value = "group", required = false) String group, Model model) {

		if (category != null) {
			switch (category) {
			case "all":
				category = null;
				break;
			case "qna":
				category = "10";
				break;
			case "tech":
				category = "11";
				break;
			case "career":
				category = "12";
				break;
			case "etc":
				category = "13";
				break;
			case "knowledge":
				category = "20";
				break;
			case "news":
				category = "21";
				break;
			case "tips":
				category = "22";
				break;
			case "column":
				category = "23";
				break;
			case "review":
				category = "24";
				break;
			case "press":
				category = "25";
				break;
			case "community":
				category = "30";
				break;
			case "life":
				category = "31";
				break;
			case "ai":
				category = "32";
				break;
			case "salary":
				category = "33";
				break;
			case "jobs":
				category = "34";
				break;
			case "policy":
				category = "35";
				break;
			case "feedback":
				category = "36";
				break;
			case "event":
				category = "40";
				break;
			case "it-event":
				category = "41";
				break;
			case "promo":
				category = "42";
				break;
			case "meetup":
				category = "50";
				break;
			case "study":
				category = "51";
				break;
			case "project":
				category = "52";
				break;
			case "coding-study":
				category = "53";
				break;
			case "bootcamp":
				category = "60";
				break;
			case "course":
				category = "61";
				break;
			case "jobs-board":
				category = "70";
				break;
			case "contract":
				category = "71";
				break;
			case "full-time":
				category = "72";
				break;
			case "contact":
				category = "80";
				break;
			case "notice":
				category = "81";
				break;
			case "releases":
				category = "82";
				break;
			case "bug-report":
				category = "83";
				break;
			case "request":
				category = "84";
				break;
			case "okky-event":
				category = "85";
				break;

			default:
				break;
			}
		}

		System.out.println("DB濡� 蹂대궪 �떎�젣 ID: " + category);
		List<BoardVO> list = service.getListWithCategory(cri, category, group);
		list.forEach(board -> {
			board.setNew(board.checkIsNew());
		});
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri, category, group)));
		model.addAttribute("leftAds", adService.getAds("left"));
		model.addAttribute("rightAds", adService.getAds("right"));
	}

	@GetMapping("/get")
	public String get(@RequestParam("bno") Long bno, Criteria cri, Model model) {
		model.addAttribute("board", service.get(bno));
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("leftAds", adService.getAds("left"));
		model.addAttribute("rightAds", adService.getAds("right"));

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
		log.info("register (writer �꽭�똿 �셿猷�): " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list?cat_id=" + board.getCat_id();
	}

	@GetMapping("/main/categoryData")
	@ResponseBody
	public List<BoardVO> getCategoryData(
			@RequestParam(value = "category", required = false, defaultValue = "�쟾泥�") String category) {
		System.out.println("而⑦듃濡ㅻ윭 �룄李�! 移댄뀒怨좊━: " + category);

		try {
			List<BoardVO> list = service.getCategoryList(category);
	        if (list == null) return new ArrayList<>();
			for (BoardVO board : list) {
				board.setIsNew(board.checkIsNew());
			}
			return list;
		} catch (Exception e) {
	        System.err.println("移댄뀒怨좊━ �뜲�씠�꽣 媛��졇�삤湲� �떎�뙣: " + e.getMessage());
	        e.printStackTrace();
	        return new ArrayList<>();
		}
	}

	@GetMapping("/group/{parentSlug}")
	public String getGroupList(@PathVariable("parentSlug") String parentSlug, Criteria cri, Model model) {

		model.addAttribute("list", service.getListByParent(parentSlug, cri));
		model.addAttribute("categoryName", parentSlug);
		return "board/list";
	}
}
