package com.okkyclone.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.UUID;
import org.springframework.web.bind.annotation.ModelAttribute;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {

	@Autowired
	private MemberService memberService;

	@GetMapping("/join")
	public void joinPage() {
		System.out.println("=== 회원가입 페이지로 이동 ===");
	}

	@PostMapping("/join")
	public String joinProcess(MemberVO vo) {
		System.out.println("=== 회원가입 시도 아이디: " + vo.getUserid() + " ===");
		memberService.join(vo);
		return "redirect:/member/login";
	}

	@GetMapping("/login")
	public void loginPage() {
		System.out.println("=== 로그인 페이지로 이동 ===");
	}

	@PostMapping("/login")
	public String loginPROCESS(MemberVO vo, javax.servlet.http.HttpSession session) {
		System.out.println("=== 로그인 시도 아이디: " + vo.getUserid() + " ===");

		MemberVO loginUser = memberService.login(vo);

		if (loginUser != null) {

			System.out.println("로그인 성공! 환영합니다!");
			session.setAttribute("user", loginUser);
			return "redirect:/";
		} else {
			System.out.println("로그인 실패!");
			return "redirect:/member/login?error=y";
		}
	}

	@PostMapping("/modifyImg")
	public String modifyImg(@RequestParam("uploadFile") MultipartFile uploadFile, // @RequestParam 추가
			@RequestParam("userid") String userid, // @RequestParam 추가
			RedirectAttributes rttr, HttpSession session) {

		if (uploadFile == null || uploadFile.isEmpty()) {
			return "redirect:/member/mypage";
		}
		String uploadFolder = "C:\\upload\\profile";
		File uploadPath = new File(uploadFolder);
		if (!uploadPath.exists()) {
			uploadPath.mkdirs();
		}

		String uuid = UUID.randomUUID().toString();
		String uploadFileName = uuid + "_" + uploadFile.getOriginalFilename();
		File saveFile = new File(uploadPath, uploadFileName);

		try {
			uploadFile.transferTo(saveFile);
			memberService.modifyProfileImg(userid, uploadFileName);

			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user != null) {
				user.setUserImg(uploadFileName);
			}

		} catch (Exception e) {
			System.out.println("에러 발생: " + e.getMessage());
			e.printStackTrace();
		}
		return "redirect:/member/mypage";
	}

	@GetMapping("/mypage")
	public void mypage(Principal principal, HttpSession session, Model model) {
		if (principal != null) {
			String userid = principal.getName();
			MemberVO vo = memberService.read(userid);

			session.setAttribute("user", vo);

			model.addAttribute("user", vo);
		}
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("C:\\upload\\profile\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	@PostMapping("/modify")
	public String modify(MemberVO vo, @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
			HttpSession session, RedirectAttributes rttr) {
		MemberVO sessionUser = (MemberVO) session.getAttribute("user");
		if (sessionUser == null)
			return "redirect:/member/login";
		vo.setUserid(sessionUser.getUserid());
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String uploadFolder = "C:\\upload\\profile";
			File uploadPath = new File(uploadFolder);

			if (!uploadPath.exists())
				uploadPath.mkdirs();
			String uuid = UUID.randomUUID().toString();
			String uploadFileName = uuid + "_" + uploadFile.getOriginalFilename();
			File saveFile = new File(uploadPath, uploadFileName);

			try {
				uploadFile.transferTo(saveFile);
				vo.setUserImg(uploadFileName);
			} catch (Exception e) {
				System.out.println("파일 저장 중 에러: " + e.getMessage());
			}
		} else {
			vo.setUserImg(sessionUser.getUserImg());
		}
		if (memberService.modifyProfile(vo)) {
			session.setAttribute("user", memberService.read(vo.getUserid()));
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/member/mypage";
	}
}