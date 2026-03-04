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
        log.info("하위 카테고리 요청 - group: " + group);

        List<Map<String, String>> list = new ArrayList<>();
        
        if ("qna".equals(group)) {
            list.add(createMap("11", "기술"));
            list.add(createMap("12", "커리어"));
            list.add(createMap("13", "기타"));
        } else if ("knowledge".equals(group)) {
            list.add(createMap("21", "Tech 뉴스"));
            list.add(createMap("22", "팁"));
            list.add(createMap("23", "칼럼"));
            list.add(createMap("24", "리뷰"));
            list.add(createMap("25", "IT보도자료"));
        } else if ("community".equals(group)) {
            list.add(createMap("31", "사는얘기"));
            list.add(createMap("32", "AI"));
            list.add(createMap("33", "연봉·단가"));
            list.add(createMap("34", "취준생"));
            list.add(createMap("35", "IT 정책·토론"));
            list.add(createMap("36", "피드백"));
        } else if ("meetup".equals(group)) {
            list.add(createMap("51", "스터디"));
            list.add(createMap("52", "프로젝트"));
            list.add(createMap("53", "모각코·모각공"));
            list.add(createMap("54", "멘토링·튜터링"));
            list.add(createMap("55", "모임·네트워킹"));
            list.add(createMap("56", "공모전·해커톤"));
        } else if ("event".equals(group)) {
            list.add(createMap("41", "IT 행사"));
            list.add(createMap("42", "홍보·광고"));
        } else if ("bootcamp".equals(group)) {
            list.add(createMap("61", "교육과정"));
        } else if ("jobs-board".equals(group)) {
            list.add(createMap("71", "계약직"));
            list.add(createMap("72", "정규직"));
            list.add(createMap("73", "Talent"));
            list.add(createMap("74", "좋은회사/나쁜회사"));
        } else if ("contact".equals(group)) {
            list.add(createMap("81", "공지사항"));
            list.add(createMap("82", "Releases"));
            list.add(createMap("83", "버그 및 제안"));
            list.add(createMap("84", "게시판 생성 요청"));
            list.add(createMap("85", "OKKY 행사"));
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

		log.info("글쓰기 폼 요청 - group: " + group + ", category: " + category);

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

		System.out.println("DB로 보낼 실제 ID: " + category);
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
		board.setWriter(user.getUserId());
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
            if (list == null) return new ArrayList<>();
			for (BoardVO board : list) {
				board.setIsNew(board.checkIsNew());
			}
			return list;
		} catch (Exception e) {
            System.err.println("카테고리 데이터 가져오기 실패: " + e.getMessage());
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