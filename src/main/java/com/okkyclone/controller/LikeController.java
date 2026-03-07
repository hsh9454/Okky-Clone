package com.okkyclone.controller;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.okkyclone.service.BoardService;

@Controller
@RequestMapping("/like/*")
public class LikeController {

	@Autowired
	private BoardService service;

	@PostMapping(value = "/update", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<?> updateLike(@RequestBody Map<String, Object> params, Principal principal) {
		if (principal == null) {
			return ResponseEntity.status(401).body("로그인이 필요합니다.");
		}

		try {
			Long bno = Long.parseLong(params.get("bno").toString());
			String userid = principal.getName();

			boolean result = service.toggleLike(bno, userid);
			return ResponseEntity.ok(result);

		} catch (IllegalStateException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).body("서버 오류");
		}
	}

	@PostMapping(value = "/disupdate", produces = "application/json; charset=utf-8")
	@ResponseBody
	public ResponseEntity<?> updateDislike(@RequestBody Map<String, Object> params, Principal principal) {
		if (principal == null) {
			return ResponseEntity.status(401).body("로그인이 필요합니다.");
		}

		try {
			Long bno = Long.parseLong(params.get("bno").toString());
			String userid = principal.getName();

			boolean result = service.toggleDislike(bno, userid);

			return ResponseEntity.ok(result); 

		} catch (IllegalStateException e) {
			return ResponseEntity.badRequest().body(e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(500).body("서버 오류");
		}
	}
}