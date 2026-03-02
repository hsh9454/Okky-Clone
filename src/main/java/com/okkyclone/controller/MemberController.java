package com.okkyclone.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

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

import com.okkyclone.domain.ActivityVO;
import com.okkyclone.domain.MemberVO;
import com.okkyclone.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {
    
    @Autowired
    private MemberService memberService;   

	@GetMapping("/join")
	public void joinPage() {
		System.out.println("=== �쉶�썝媛��엯 �럹�씠吏�濡� �씠�룞 ===");
	}

	@PostMapping("/join")
	public String joinProcess(MemberVO vo) {
		System.out.println("=== �쉶�썝媛��엯 �떆�룄 �븘�씠�뵒: " + vo.getUserid() + " ===");
		memberService.join(vo);
		return "redirect:/member/login";
	}

	@GetMapping("/login")
	public void loginPage() {
	    System.out.println("=== 濡쒓렇�씤 �럹�씠吏�濡� �씠�룞 ===");
	}
	
	@PostMapping("/modifyImg")
	public String modifyImg(@RequestParam("uploadFile") MultipartFile uploadFile, // @RequestParam 異붽�
			@RequestParam("userid") String userid, // @RequestParam 異붽�
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
			System.out.println("�뿉�윭 諛쒖깮: " + e.getMessage());
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
		
		if (fileName == null || fileName.trim().isEmpty() || fileName.equals("null")) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		File file = new File("C:\\upload\\profile\\" + fileName);		
		if (!file.exists() || file.isDirectory()) {
			System.out.println("�뙆�씪�쓣 李얠쓣 �닔 �뾾嫄곕굹 �뵒�젆�넗由ъ엯�땲�떎: " + file.getPath());
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			String contentType = Files.probeContentType(file.toPath());
			if (contentType != null) {
				header.add("Content-Type", contentType);
			}
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			System.err.println("�뙆�씪 �쟾�넚 以� �뿉�윭 諛쒖깮: " + e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
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
				System.out.println("�뙆�씪 ���옣 以� �뿉�윭: " + e.getMessage());
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
	
	@GetMapping("/activity")
	public String activityPage(Model model, Principal principal) {                
	    
	    String memberId = principal.getName();
	    System.out.println("�쐟 �젒洹� �궗�슜�옄: " + memberId);
	    
	    List<ActivityVO> activityList = memberService.getActivityList(memberId);
	    
	    model.addAttribute("activityList", activityList);
	    
	    return "member/activity"; 
	}
	
}