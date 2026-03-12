package com.okkyclone.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.security.Principal;
import java.util.List;
import java.util.UUID;
import java.util.Map;
import java.util.HashMap;
import java.text.SimpleDateFormat;
import com.google.gson.Gson;

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
		System.out.println("=== 회원가입 페이지로 이동 ===");
	}

	@PostMapping("/join")
	public String joinProcess(MemberVO vo) {
		System.out.println("=== 회원가입 시도 아이디: " + vo.getUserId() + " ===");
		memberService.join(vo);
		return "redirect:/member/login";
	}

	@GetMapping("/login")
	public void loginPage() {
	    System.out.println("=== 로그인 페이지로 이동 ===");
	}
	
	

	@GetMapping("/mypage")
	public void mypage(Principal principal, HttpSession session, Model model) {
	    if (principal != null) {
	        String userid = principal.getName();
	        MemberVO vo = memberService.read(userid);
	       
	        session.setAttribute("loginMember", vo); 
	        model.addAttribute("memberInfo", vo);
	    }
	}

	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(@RequestParam("fileName") String fileName) { // @RequestParam 추가!
	    System.out.println("★ 사진 요청 왔음! 파일명: " + fileName);
		if (fileName == null || fileName.trim().isEmpty() || fileName.equals("null")) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		File file = new File("C:\\upload\\profile\\" + fileName);		
		if (!file.exists() || file.isDirectory()) {
			System.out.println("파일을 찾을 수 없거나 디렉토리입니다: " + file.getPath());
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
			System.err.println("파일 전송 중 에러 발생: " + e.getMessage());
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return result;
	}
	
	
	@PostMapping("/modify")
	public String modify(MemberVO vo, 
	                     @RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile,
	                     HttpSession session, 
	                     RedirectAttributes rttr) {
	    MemberVO sessionUser = (MemberVO) session.getAttribute("loginMember");
	    
	    if (sessionUser == null) {
	        return "redirect:/member/login";
	    }

	    vo.setUserId(sessionUser.getUserId());

	    if (uploadFile != null && !uploadFile.isEmpty()) {
	        String uploadFolder = "C:\\upload\\profile";
	        File uploadPath = new File(uploadFolder);
	        if (!uploadPath.exists()) uploadPath.mkdirs();

	        String uuid = UUID.randomUUID().toString();
	        String uploadFileName = uuid + "_" + uploadFile.getOriginalFilename();
	        File saveFile = new File(uploadPath, uploadFileName);

	        try {
	            uploadFile.transferTo(saveFile);
	            vo.setUserImg(uploadFileName); 
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    } else {
	        vo.setUserImg(sessionUser.getUserImg());
	    }

	    if (memberService.updateMemberProfile(vo)) {
	        session.setAttribute("loginMember", memberService.read(vo.getUserId()));
	        rttr.addFlashAttribute("result", "success");
	    } else {
	        System.out.println("수정 실패! 서비스에서 false 반환됨");
	    }

	    return "redirect:/member/mypage";
	}
	
	
	@GetMapping("/activity")
	public String activityPage(Model model, Principal principal, HttpSession session) {                
	    if (principal == null) {
	        return "redirect:/member/login"; 
	    }
	    
	    String memberId = principal.getName();
	    MemberVO vo = memberService.read(memberId);
	    session.setAttribute("loginMember", vo);

	    List<ActivityVO> posts = memberService.getActivityByType(memberId, "post");
	    List<ActivityVO> replies = memberService.getActivityByType(memberId, "reply");
	    
	    List<ActivityVO> allActivity = new java.util.ArrayList<>();
	    if (posts != null) allActivity.addAll(posts);
	    if (replies != null) allActivity.addAll(replies);
	    Map<String, Integer> dateCountMap = new HashMap<>();
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    
	    for (ActivityVO activity : allActivity) {
	        if (activity != null && activity.getActivityDate() != null) {
	            String dateStr = sdf.format(activity.getActivityDate());
	            dateCountMap.put(dateStr, dateCountMap.getOrDefault(dateStr, 0) + 1);
	        }
	    }
	    
	    Gson gson = new Gson();
	    String activityJsonData = gson.toJson(dateCountMap);
	    

	    System.out.println("생성된 잔디 데이터: " + activityJsonData);
	    
	    model.addAttribute("activityJsonData", activityJsonData);
	    model.addAttribute("activityList", allActivity); 
	    
	    return "member/activity"; 
	}
	
	@GetMapping("/getActivityList")
    @ResponseBody
    public ResponseEntity<List<ActivityVO>> getActivityList(@RequestParam("type") String type, Principal principal) {
        if (principal == null) {
            return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
        }
        
        String userId = principal.getName();
        List<ActivityVO> list = memberService.getActivityByType(userId, type);
        
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
	
}